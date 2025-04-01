import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go7eight/src/core/reusableComponents/app_image_rounded_container.dart';
import 'package:go7eight/src/modules/panels/student/home/views/widget/app_like_post.dart';
import 'package:go7eight/src/modules/panels/student/profile/bindings/profile_binding.dart';
import 'package:go7eight/src/modules/panels/student/profile/views/profile_view.dart';
import 'package:go7eight/src/modules/panels/student/root/controllers/root_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/home_controller.dart';
import '../../../../../core/app_export.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final RootController rootController = Get.find<RootController>();
    final ScrollController scrollController = ScrollController();
    final RefreshController refreshController = RefreshController(initialRefresh: false);
    final double appBarHeight = kToolbarHeight + 20;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // Initialize controller properties
    if (controller.appBarVisible == null) {
      controller.appBarVisible = true.obs;
    }
    if (controller.lastScrollOffset == null) {
      controller.lastScrollOffset = 0.0;
    }

    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));

    // Add scroll listener for app bar animation
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        final currentScroll = scrollController.offset;
        final scrollDelta = currentScroll - controller.lastScrollOffset!;
        controller.lastScrollOffset = currentScroll;

        // Update appBar visibility based on scroll direction
        if (scrollDelta > 2 && currentScroll > appBarHeight && controller.appBarVisible!.value) {
          controller.appBarVisible?.value = false;
        } else if ((scrollDelta < -2 || currentScroll < appBarHeight / 2) && !controller.appBarVisible!.value) {
          controller.appBarVisible?.value = true;
        }
      }
    });

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          body: Stack(
            children: [
              // Background decoration
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: statusBarHeight + appBarHeight + 30,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0D000000),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),

              // Main content
              Column(
                children: [
                  // Status bar area
                  SizedBox(height: statusBarHeight),

                  // Animated AppBar
                  Obx(() => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: controller.appBarVisible!.value ? appBarHeight : 0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: controller.appBarVisible!.value ? 1.0 : 0.0,
                      child: _buildAppBar(context),
                    ),
                  )),

                  // Content area
                  Expanded(
                    child: _buildPostsContent(
                      rootController,
                      refreshController,
                      scrollController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: [
          // User profile image
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              Get.to(() => const ProfileView(),
                  binding: ProfileBinding(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 550));
            },
            child: Hero(
              tag: "profileImage_user",
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.primary.withOpacity(0.2), width: 1.5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const AppLocalImage(
                    width: 40,
                    height: 40,
                    showBoarder: false,
                    imagePath: AppIcon.userIcon,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Search field
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigate to search screen
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: AppColor.textFieldBackground,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.borderColor, width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColor.blueGrey,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Search product, service, account",
                        style: TextStyle(
                          color: AppColor.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Cart button
          _buildActionButton(
            context: context,
            icon: Icons.shopping_cart_outlined,
            badge: 16,
            onTap: () {
              // Navigate to cart
            },
          ),

          const SizedBox(width: 12),

          // Notification button
          _buildActionButton(
            context: context,
            icon: Icons.notifications_none_outlined,
            onTap: () {
              // Navigate to notifications
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    int? badge,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.primaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: AppColor.primary,
              size: 22,
            ),
          ),

          // Badge indicator for notifications/cart
          if (badge != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: Text(
                  badge.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPostsContent(
      RootController rootController,
      RefreshController refreshController,
      ScrollController scrollController,
      ) {
    return Obx(() {
      // Show loading indicator when initially loading posts
      if (rootController.posts.isEmpty && rootController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColor.primary,
          ),
        );
      }

      // Show empty state when no posts are available
      if (rootController.posts.isEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.feed_outlined,
              size: 60,
              color: AppColor.primary.withOpacity(0.6),
            ),
            const SizedBox(height: 16),
            const Text(
              "No posts yet",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColor.blackShade,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Follow accounts to see their posts",
              style: TextStyle(
                fontSize: 14,
                color: AppColor.grey,
              ),
            ),
          ],
        );
      }

      // Show posts with refresh and pagination
      return SmartRefresher(
        controller: refreshController,
        scrollController: scrollController,
        enablePullDown: true,
        enablePullUp: rootController.hasMorePosts.value,
        header: const WaterDropHeader(
          waterDropColor: AppColor.primary,
        ),
        footer: CustomFooter(
          builder: (context, mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("Pull up to load more");
            } else if (mode == LoadStatus.loading) {
              body = const CircularProgressIndicator(color: AppColor.primary);
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load failed! Click to retry");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("Release to load more");
            } else {
              body = const Text("No more posts");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        onRefresh: () async {
          await rootController.refreshPosts();
          refreshController.refreshCompleted();

          // Show app bar when refreshing
          controller.appBarVisible?.value = true;
        },
        onLoading: () {
          rootController.loadMorePosts();
          refreshController.loadComplete();
        },
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          itemCount: rootController.posts.length,
          itemBuilder: (context, index) {
            final post = rootController.posts[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blackPitch.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: AppLikePost(
                post: post,
                onLike: () => rootController.handleLikePost(post.uid!),
                onComment: () => rootController.handleCommentPost(post.uid!),
                onShare: () => rootController.handleSharePost(post.uid!),
                onSave: () => rootController.handleSavePost(post.uid!),
              ),
            );
          },
        ),
      );
    });
  }
}