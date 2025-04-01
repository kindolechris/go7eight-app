import 'package:get/get.dart';
import 'package:go7eight/src/models/post.dart';

class PostDetailsController extends GetxController {
  Post? _post;
  bool isInitialized = false;

  // Getters
  Post? get post => _post;

  @override
  void onInit() {
    super.onInit();
    // Try to get post from arguments if not directly injected
    if (Get.arguments != null && Get.arguments['post'] != null) {
      initializeWithPost(Get.arguments['post']);
    }
  }

  void initializeWithPost(Post post) {
    _post = post;
    isInitialized = true;
    update();
  }

  // Add any business logic related to post details here

  // For example: methods to handle likes, comments, bookmarks, etc.
  void toggleLike() {
    if (_post != null) {
      // Implementation would depend on your API
      // This is just a placeholder
      _post!.noLikes = (_post!.noLikes ?? 0) + 1;
      update();
    }
  }

  void addComment(String comment) {
    if (_post != null) {
      // Implementation would depend on your API
      // This is just a placeholder
      _post!.noComments = (_post!.noComments ?? 0) + 1;
      update();
    }
  }

  void bookmarkPost() {
    // Implementation would depend on your API
    // This is just a placeholder
    update();
  }

  void addToCart() {
    // Implementation would depend on your cart service
    // This is just a placeholder
    update();
  }
}