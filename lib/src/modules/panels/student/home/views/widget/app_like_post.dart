import 'package:flutter/material.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/constants/colors.dart';
import 'package:go7eight/src/models/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go7eight/src/modules/panels/student/post_details/bindings/post_details_binding.dart';
import 'package:go7eight/src/modules/panels/student/post_details/views/post_details.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'comments_modal_widget.dart';

class AppLikePost extends StatefulWidget {
  final Post post;
  final Function? onLike;
  final Function? onComment;
  final Function? onShare;
  final Function? onBook;
  final Function? onAddToCart;
  final Function? onSave;

  const AppLikePost({
    Key? key,
    required this.post,
    this.onLike,
    this.onComment,
    this.onShare,
    this.onBook,
    this.onAddToCart,
    this.onSave,
  }) : super(key: key);

  @override
  State<AppLikePost> createState() => _SafariPostState();
}

class _SafariPostState extends State<AppLikePost> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isLiked = false;
  bool _isSaved = false;
  int _likeCount = 20; // Default like count

  // For double-tap like animation
  late Animation _scaleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _likeCount = widget.post.noLikes ?? 20;

    // Setup animation for double tap like
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.7).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handleDoubleTap() {
    if (!_isLiked) {
      setState(() {
        _isLiked = true;
        _likeCount++;
      });

      // Play the heart animation
      _animationController.reset();
      _animationController.forward().then((_) {
        Future.delayed(const Duration(milliseconds: 500), () {
          _animationController.reverse();
        });
      });

      // Call like function if provided
      if (widget.onLike != null) {
        widget.onLike!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.post.user;
    final bool hasMultipleMedia = (widget.post.media?.length ?? 0) > 1;
    final postDate = widget.post.createdAt != null
        ? timeago.format(DateTime.parse(widget.post.createdAt!))
        : '2h ago';

    return Container(
      color: AppColor.white,
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post header with user info and follow button
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile picture
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.primary.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: user?.profileImageUrl != null
                        ? CachedNetworkImage(
                      imageUrl: user!.profileImageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppColor.lightGrey,
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppColor.lightGrey,
                        child: const Icon(
                          Icons.person,
                          color: AppColor.grey,
                        ),
                      ),
                    )
                        : user?.firstName != null
                        ? CachedNetworkImage(
                      imageUrl: 'https://ui-avatars.com/api/?name=${user!.firstName}+${user.lastName}&background=random',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppColor.lightGrey,
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppColor.lightGrey,
                        child: const Icon(
                          Icons.person,
                          color: AppColor.grey,
                        ),
                      ),
                    )
                        : Image.asset(
                      AppIcon.userIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // User info column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Username and verification badge
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              user?.nickname ?? 'Username',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColor.blackShade,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),

                          // Blue rounded verification badge with checkmark (like in the image)
                          Container(
                            height: 16,
                            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          ),

                          const SizedBox(width: 6),

                          // Orange post count badge (like in the image)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0xFFDD4F05), // Orange color from image
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${user?.postsCount ?? 84}', // Default to 84 as shown in image
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Location and time
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          // Always show location icon
                          const Icon(
                            Icons.location_on,
                            size: 12,
                            color: AppColor.grey,
                          ),
                          const SizedBox(width: 2),
                          Flexible(
                            child: Text(
                              widget.post.location ?? 'Location unavailable',
                              style: const TextStyle(
                                color: AppColor.grey,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            " · ",
                            style: TextStyle(
                              color: AppColor.grey,
                              fontSize: 12,
                            ),
                          ),
                          // Time ago
                          Text(
                            postDate,
                            style: const TextStyle(
                              color: AppColor.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Follow button
                SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColor.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Follow',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Media content
          GestureDetector(
            onDoubleTap: _handleDoubleTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Media carousel
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width,
                  child: widget.post.media != null && widget.post.media!.isNotEmpty
                      ? PageView.builder(
                    controller: _pageController,
                    itemCount: widget.post.media!.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final media = widget.post.media![index];
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          // Image
                          CachedNetworkImage(
                            imageUrl: "https://service.go7eight.com/${media.url}",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: AppColor.lightGrey,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primary,
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: AppColor.lightGrey,
                              child: const Center(
                                child: Icon(
                                  Icons.error_outline,
                                  color: AppColor.grey,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),

                          // Gradient overlay at bottom for better readability
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Featured indicator
                          if (widget.post.isFeatured ?? false)
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Featured',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  )
                      : Container(
                    color: AppColor.lightGrey,
                    child: const Center(
                      child: Text(
                        'No media available',
                        style: TextStyle(color: AppColor.grey),
                      ),
                    ),
                  ),
                ),

                // Page indicator dots
                if (hasMultipleMedia)
                  Positioned(
                    top: 12,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.post.media!.length,
                            (index) => Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? AppColor.primary : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                // Image counter indicator
                if (hasMultipleMedia)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${_currentPage + 1}/${widget.post.media?.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),

                // Interactive buttons on the right
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Save/Bookmark button
                      _buildCircleButton(
                        icon: _isSaved ? Icons.bookmark : Icons.bookmark_border,
                        onTap: () {
                          setState(() {
                            _isSaved = !_isSaved;
                          });
                          if (widget.onSave != null) {
                            widget.onSave!();
                          }
                        },
                        isActive: _isSaved,
                      ),
                      const SizedBox(height: 8),

                      // Cart button
                      _buildCartButton(
                        onTap: () {
                          if (widget.onAddToCart != null) {
                            widget.onAddToCart!();
                          }
                        },
                      ),
                    ],
                  ),
                ),

                // Like animation heart overlay
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animationController.value,
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: AppColor.primary,
                            size: 80,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Post title, description and tags
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with verification
                if (widget.post.title != null && widget.post.title!.isNotEmpty)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.post.title ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.blackShade,
                          ),
                        ),
                      ),
                      if (widget.post.verified ?? false)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12,
                              ),
                              const SizedBox(width: 2),
                              const Text(
                                'Verified',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),

                // Description
                if (widget.post.description != null && widget.post.description!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      widget.post.description ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.textBlueGrey,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                // Tags
                if (widget.post.tags != null && widget.post.tags!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.post.tags!.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColor.lightGrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '#$tag',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColor.textBlueGrey,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                // Price and duration row
                if (widget.post.price != null || widget.post.duration != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        // Price
                        if (widget.post.price != null && widget.post.price! > 0)
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.monetization_on_outlined,
                                  color: AppColor.primary,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '\$${widget.post.price!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Duration
                        if (widget.post.duration != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: AppColor.textBlueGrey,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.post.duration!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColor.textBlueGrey,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          // Bottom action bar with interaction buttons
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side actions (like, comment, share)
                Row(
                  children: [
                    // Like button
                    _buildActionButton(
                      icon: _isLiked ? Icons.favorite : Icons.favorite_border,
                      label: '$_likeCount',
                      onTap: () {
                        setState(() {
                          _isLiked = !_isLiked;
                          _likeCount = _isLiked ? _likeCount + 1 : _likeCount - 1;
                        });
                        if (widget.onLike != null) {
                          widget.onLike!();
                        }
                      },
                      isActive: _isLiked,
                    ),

                    // Comment button
                    _buildActionButton(
                      icon: Icons.chat_bubble_outline,
                      iconAsset: AppIcon.outlineComment,
                      label: '${widget.post.noComments ?? 0}',
                      onTap: () {
                        showCommentsModal(context, widget.post);
                        if (widget.onComment != null) {
                          widget.onComment!();
                        }
                      },
                    ),

                    // Share button
                    _buildActionButton(
                      icon: Icons.share_outlined,
                      iconAsset: AppIcon.shareIcon,
                      label: 'Share',
                      onTap: () {
                        if (widget.onShare != null) {
                          widget.onShare!();
                        }
                      },
                    ),
                  ],
                ),

                // Book now button
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                          () => PostDetailsView(post: widget.post),
                      binding: PostDetailsBinding(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 550),
                    );
                    if (widget.onBook != null) {
                      widget.onBook!();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    widget.post.isBookable ?? true ? 'Book now' : 'View details',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Divider at the bottom
          const Divider(height: 1, thickness: 1, color: Color(0xFFF5F5F5)),
        ],
      ),
    );
  }

  // Helper method to build action buttons (like, comment, share)
  Widget _buildActionButton({
    required IconData icon,
    String? iconAsset,
    required String label,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconAsset != null
                ? Image(
              width: 22,
              height: 22,
              color: isActive ? AppColor.primary : AppColor.textBlueGrey,
              image: AssetImage(iconAsset),
            )
                : Icon(
              icon,
              color: isActive ? AppColor.primary : AppColor.textBlueGrey,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? AppColor.primary : AppColor.textBlueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build circular buttons (bookmark, cart)
  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: isActive ? AppColor.primary : Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  // Helper method specifically for the cart button
  Widget _buildCartButton({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColor.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColor.primary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}