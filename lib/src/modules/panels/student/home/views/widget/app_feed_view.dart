import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/student/root/controllers/root_controller.dart';

import 'app_like_post.dart';

class AppFeedView extends StatelessWidget {
  final RootController controller = Get.find<RootController>();

  // Handler functions for post interactions
  void _handleLike(String postId) {
    // Implement like functionality
    print('Liked post: $postId');
  }

  void _handleComment(String postId) {
    // Navigate to comments screen
    Get.toNamed('/comments', arguments: {'postId': postId});
  }

  void _handleShare(String postId) {
    // Implement share functionality
    print('Sharing post: $postId');
  }

  void _handleSave(String postId) {
    // Implement save functionality
    print('Saved post: $postId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Go7eight',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.white),
            onPressed: controller.pickImages,
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Navigate to activity feed
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_outlined, color: Colors.white),
            onPressed: () {
              // Navigate to direct messages
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.posts.isEmpty && controller.isLoading.value) {
          // Initial loading state
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else if (controller.posts.isEmpty) {
          // No posts available
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "No posts available",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.refreshPosts,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                  ),
                  child: const Text("Refresh"),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshPosts,
          color: Colors.white,
          backgroundColor: AppColor.primary,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo is ScrollEndNotification) {
                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  // Load more posts when user scrolls to bottom
                  controller.loadMorePosts();
                }
              }
              return false;
            },
            child: ListView.builder(
              itemCount: controller.posts.length + (controller.hasMorePosts.value ? 1 : 0),
              itemBuilder: (context, index) {
                // Show loading indicator at the bottom
                if (index == controller.posts.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                }

                // Get post and display using our custom component
                final post = controller.posts[index];
                return AppLikePost(
                  post: post,
                  onLike: () => _handleLike(post.uid!),
                  onComment: () => _handleComment(post.uid!),
                  onShare: () => _handleShare(post.uid!),
                  onSave: () => _handleSave(post.uid!),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}