import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/constants/app_api_repsonse_code.dart';
import 'package:go7eight/src/core/reusableComponents/app_custom_toast.dart';
import 'package:go7eight/src/data/dataSource/remote/posts.dart';
import 'package:go7eight/src/models/post.dart';
import 'package:go7eight/src/modules/panels/student/community/community_home/views/community_home_view.dart';
import 'package:go7eight/src/modules/panels/student/home/views/home_view.dart';
import 'package:go7eight/src/modules/panels/student/meal/views/meal_view.dart';
import 'package:go7eight/src/modules/panels/student/root/views/post_uploading_view.dart';
import 'package:go7eight/src/modules/panels/student/root/views/root_view.dart';
import 'package:go7eight/src/modules/panels/student/workout/views/workout_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../user_account/user_account.dart';
import '../bindings/root_binding.dart';
import '../views/image_preview_root.dart';


class RootController extends GetxController {
  // Navigation and UI state
  RxInt selectedIndex = 0.obs;
  RxInt currentImageIndex = 0.obs;
  RxBool profileIsConnected = false.obs;
  RxBool isBiometricModalShown = false.obs;
  DateTime cTime = DateTime.now();

  // Image and caption related variables
  final ImagePicker _picker = ImagePicker();
  RxList<XFile> selectedImages = <XFile>[].obs;
  final RxString postCaption = ''.obs;
  final RxBool isEditingCaption = false.obs;
  final RxMap<int, String> imageCaptions = <int, String>{}.obs;
  final RxDouble uploadProgress = 0.0.obs;
  final RxBool isUploading = false.obs;

  // Pagination related variables
  final RxList<Post> posts = <Post>[].obs;
  final RxInt page = 0.obs; // Starting from page 0 (API pagination often starts at 0)
  final RxInt size = 10.obs; // Default page size
  final RxString sortBy = "createdAt".obs;
  final RxString sortDirection = "DESC".obs; // Usually newest first
  final RxBool isLoading = false.obs;
  final RxBool hasMorePosts = true.obs;
  final RxInt totalPages = 0.obs;
  final RxInt totalElements = 0.obs;
  PostsApiService postsApiService = PostsApiService();

  late ScrollController scrollController;

  // Controller for pull-to-refresh widget
  late RefreshController refreshController;

  @override
  void onInit() {
    super.onInit();
    getPosts();
    scrollController = ScrollController();
    refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void onClose() {
    scrollController.dispose();
    refreshController.dispose();
    super.onClose();
  }

  // Post interaction methods
  void handleLikePost(String postId) {
    // Implement like functionality
    print('Liked post: $postId');
    // You could call an API here to like the post
  }

  void handleCommentPost(String postId) {
    // Navigate to comments screen
    //Get.toNamed('/comments', arguments: {'postId': postId});
  }

  void handleSharePost(String postId) {
    // Implement share functionality
    print('Sharing post: $postId');
    // You could open a share dialog here

    // Example toast notification
    CustomToast.showToast("Sharing post...");
  }

  void handleSavePost(String postId) {
    // Implement save functionality
    print('Saved post: $postId');
    // You could call an API here to save the post

    // Example toast notification
    CustomToast.showToast("Post saved");
  }

  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600
  );

  Future<void> getPosts({bool refresh = false}) async {
    if (isLoading.value) return; // Prevent multiple simultaneous requests

    if (refresh) {
      // Reset pagination params when refreshing
      page.value = 0;
      posts.clear();
      hasMorePosts.value = true;
    }

    // If we've already loaded all pages, don't make another request
    if (!hasMorePosts.value && !refresh) return;

    isLoading.value = true;

    try {
      var payload = {
        "page": page.value.toString(),
        "size": size.value.toString(),
        "sortBy": sortBy.value,
        "sortDirection": sortDirection.value
      };

      var response = await postsApiService.geAllPosts(payload);

      if (response.code == AppResponseCode.SUCCESS) {
        // Parse the response data
        Map<String, dynamic> responseData = response.data;

        // Extract pagination info
        totalPages.value = responseData['totalPages'] ?? 0;
        totalElements.value = responseData['totalElements'] ?? 0;

        // Check if this is the last page
        hasMorePosts.value = !(responseData['last'] ?? true);

        // Parse the posts from the 'content' array
        List<dynamic> content = responseData['content'] ?? [];
        List<Post> newPosts = content.map((item) => Post.fromJson(item)).toList();

        // Add new posts to the existing list
        posts.addAll(newPosts);

        // Increment page for next request
        page.value++;

      } else if (response.code == AppResponseCode.RECORD_DOES_NOT_EXISTS) {
        hasMorePosts.value = false;
        if (page.value == 0) {
          // No posts at all
          CustomToast.showToast("No posts available");
        }
      } else if (response.code == AppResponseCode.FAILURE) {
        CustomToast.showToast("Failed to load posts");
      } else if (response.code == AppResponseCode.INTERNAL_SERVER_ERROR) {
        CustomToast.showToast("Server error, please try again later");
      } else if (response.code == AppResponseCode.EXCEPTION) {
        CustomToast.showToast("An error occurred");
      }
    } catch (e) {
      print("Error fetching posts: $e");
      CustomToast.showToast("Error loading posts");
    } finally {
      isLoading.value = false;
    }
  }

  // Method to handle loading more posts when user reaches end of list
  void loadMorePosts() {
    if (!isLoading.value && hasMorePosts.value) {
      getPosts();
    }
  }

  // Method to refresh posts
  Future<void> refreshPosts() async {
    await getPosts(refresh: true);
  }

  // Method to filter or change sort order
  void changeSortOrder(String newSortBy, String newSortDirection) {
    sortBy.value = newSortBy;
    sortDirection.value = newSortDirection;
    refreshPosts();
  }

  Future<void> uploadPost() async {
    try {
      isUploading.value = true;
      uploadProgress.value = 0.0;

      // Initial delay to show starting state
      await Future.delayed(const Duration(seconds: 1));

      // First stage: 0% to 40% (Processing images)
      for (double i = 0.0; i <= 0.4; i += 0.1) {
        uploadProgress.value = i;
        await Future.delayed(const Duration(milliseconds: 800));
      }

      // Process images and create base64 content
      List<Map<String, String>> imagesList = [];
      for (var image in selectedImages) {
        final bytes = await File(image.path).readAsBytes();
        final base64Image = base64Encode(bytes);
        imagesList.add({"base64Content": base64Image});

        // Update progress for each image (40% to 70%)
        uploadProgress.value += (0.3 / selectedImages.length);
        await Future.delayed(const Duration(milliseconds: 500));
      }

      var payload = {
        "title": "Go78 Post",
        "description": postCaption.value,
        "location": "Dar es Salaam",
        "media": imagesList
      };

      // Pre-API call delay (70% to 80%)
      uploadProgress.value = 0.7;
      await Future.delayed(const Duration(seconds: 1));
      uploadProgress.value = 0.8;
      await Future.delayed(const Duration(milliseconds: 800));

      var response = await postsApiService.createAPost(payload);

      if (response.code == AppResponseCode.SUCCESS) {
        // Final progress (80% to 100%) with delays
        uploadProgress.value = 0.9;
        await Future.delayed(const Duration(milliseconds: 800));
        uploadProgress.value = 0.95;
        await Future.delayed(const Duration(milliseconds: 800));
        uploadProgress.value = 1.0;

        // Show completion state before navigation
        await Future.delayed(const Duration(seconds: 2));

        isUploading.value = false;
        CustomToast.showToast("Post created successfully");

        // Refresh posts after creating a new one
        await refreshPosts();

        Get.offAll(() => StudentRootView());
      } else {
        throw Exception('Upload failed');
      }
    } catch (e) {
      isUploading.value = false;
      uploadProgress.value = 0.0;
      CustomToast.showToast("Failed to create post: ${e.toString()}");
      print('Error uploading post: $e');
    }
  }

  List<Widget> widgetOptions = <Widget>[
    const HomeView(),
    const AnalyticsView(),
    const AddPostView(),
    const MessageView(),
    const SellerAccountView()
  ];

  setBottomSheetVisibility(bool value) {
    isBiometricModalShown.value = value;
  }

  void verifyImages() {
    for (var image in selectedImages) {
      final file = File(image.path);
      print('Image path: ${image.path}');
      print('Image exists: ${file.existsSync()}');
      print('Image size: ${file.lengthSync()} bytes');
    }
  }

  void onTabTapped(int index) {
    if (index == 2) {
      pickImages();
    } else {
      selectedIndex.value = index;
    }
  }

  bool isValidImage(String path) {
    try {
      final file = File(path);
      return file.existsSync() && file.lengthSync() > 0;
    } catch (e) {
      print('Error checking image validity: $e');
      return false;
    }
  }

  void handleAddText() {
    if (selectedImages.isEmpty) return;
    toggleCaptionEdit();
  }

  void toggleCaptionEdit() {
    isEditingCaption.value = !isEditingCaption.value;
  }

  void setCaption(int imageIndex, String caption) {
    if (caption.trim().isNotEmpty) {
      imageCaptions[imageIndex] = caption.trim();
    } else {
      imageCaptions.remove(imageIndex);
    }
    isEditingCaption.value = false;
  }

  String? getCaption(int imageIndex) {
    return imageCaptions[imageIndex];
  }

  void handleAddEmoji() {
    if (selectedImages.isEmpty) return;
    print('Add emoji to image at index: ${currentImageIndex.value}');
  }

  bool onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(cTime) > const Duration(seconds: 2)) {
      cTime = now;
      return false;
    }
    return true;
  }

  void handleNextPressed() {
    Get.to(() => const PostUploadingView(), binding: RootBinding(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn
    );

    uploadPost();
  }

  Future<void> pickImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 80,
        maxWidth: 1200,
        maxHeight: 1200,
      );

      if (images.isNotEmpty) {
        selectedImages.value = images;
        currentImageIndex.value = 0;
        // Reset captions when picking new images
        postCaption.value = '';
        imageCaptions.clear();
        isEditingCaption.value = false;
        Get.to(
                () => ImagePreviewView(),
            binding: RootBinding(),
            duration: const Duration(milliseconds: 400),
            transition: Transition.fadeIn
        );
      }
    } catch (e) {
      print('Error picking images: $e');
      Get.snackbar(
        'Error',
        'Failed to pick images',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}