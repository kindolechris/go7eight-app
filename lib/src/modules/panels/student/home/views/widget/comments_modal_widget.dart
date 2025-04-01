import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/post.dart';

class Comment {
  final String userName;
  final String userAvatar;
  final String commentText;
  final String timeAgo;
  final int likeCount;
  final bool isVerified;

  Comment({
    required this.userName,
    required this.userAvatar,
    required this.commentText,
    required this.timeAgo,
    this.likeCount = 0,
    this.isVerified = false,
  });
}

class CommentsModal extends StatefulWidget {
  final Post post;

  const CommentsModal({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<CommentsModal> createState() => _CommentsModalState();
}

class _CommentsModalState extends State<CommentsModal> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;

  // Sample comments data - in a real app, this would come from an API
  final List<Comment> _comments = [
    Comment(
      userName: "John_Traveller",
      userAvatar: "https://i.pravatar.cc/150?img=1",
      commentText: "This looks amazing! Is the price negotiable?",
      timeAgo: "2h ago",
      likeCount: 12,
      isVerified: true,
    ),
    Comment(
      userName: "Sarah_Parker",
      userAvatar: "https://i.pravatar.cc/150?img=5",
      commentText: "I bought this last week. The quality is excellent, highly recommend it!",
      timeAgo: "1d ago",
      likeCount: 34,
    ),
    Comment(
      userName: "TechGuy_86",
      userAvatar: "https://i.pravatar.cc/150?img=8",
      commentText: "Does it come with a charger? Looking to upgrade from my old model.",
      timeAgo: "3d ago",
      likeCount: 5,
    ),
    Comment(
      userName: "Maria_Johnson",
      userAvatar: "https://i.pravatar.cc/150?img=10",
      commentText: "How long is the delivery time to New York?",
      timeAgo: "4d ago",
      likeCount: 2,
    ),
    Comment(
      userName: "David_Smith",
      userAvatar: "https://i.pravatar.cc/150?img=12",
      commentText: "The color looks different from what I expected. Is this the actual product color?",
      timeAgo: "1w ago",
      likeCount: 8,
      isVerified: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isComposing = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF1A1A1A),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar at the top
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Comments (${widget.post.noComments ?? _comments.length})",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E3A59), // Matching the profile screen text color
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF78849E)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // Divider with shadow effect
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  offset: const Offset(0, 1),
                  blurRadius: 3,
                ),
              ],
            ),
          ),

          // Comments list
          Expanded(
            child: _comments.isEmpty
                ? _buildEmptyState()
                : _buildCommentsList(),
          ),

          // Divider above input
          Container(
            height: 1,
            color: Colors.grey.shade200,
          ),

          // Comment input area
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chat_bubble_outline,
              size: 40,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "No comments yet",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2E3A59),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Be the first to comment on this post",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _comments.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        indent: 72,
        color: Colors.grey.shade200,
      ),
      itemBuilder: (context, index) {
        final comment = _comments[index];
        return _buildCommentItem(comment);
      },
    );
  }

  Widget _buildCommentItem(Comment comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: comment.userAvatar,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey.shade200,
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2B32E7)),
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey.shade200,
                child: const Icon(Icons.person, color: Colors.grey),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Comment content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username and verification
                Row(
                  children: [
                    Text(
                      comment.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color(0xFF2E3A59),
                      ),
                    ),
                    if (comment.isVerified)
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2B32E7),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 8,
                        ),
                      ),
                    const Spacer(),
                    Text(
                      comment.timeAgo,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Comment text
                Text(
                  comment.commentText,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF2E3A59),
                  ),
                ),

                const SizedBox(height: 10),

                // Like and reply
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 15,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            comment.likeCount > 0 ? "${comment.likeCount}" : "Like",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Reply",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -1),
            blurRadius: 5,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User avatar
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(
                  image: NetworkImage("https://i.pravatar.cc/150?img=12"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Comment text field
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: _commentController,
                  focusNode: _focusNode,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF2E3A59),
                  ),
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: "Add a comment...",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    border: InputBorder.none,
                    suffixIcon: _isComposing || _commentController.text.isNotEmpty
                        ? IconButton(
                      icon: const Icon(
                        Icons.send_rounded,
                        color: AppColor.primary,
                      ),
                      onPressed: () {
                        if (_commentController.text.trim().isNotEmpty) {
                          setState(() {
                            _comments.insert(
                              0,
                              Comment(
                                userName: "You",
                                userAvatar: "https://i.pravatar.cc/150?img=12",
                                commentText: _commentController.text.trim(),
                                timeAgo: "Just now",
                              ),
                            );
                            _commentController.clear();
                            FocusScope.of(context).unfocus();
                          });
                        }
                      },
                    )
                        : null,
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show the comments modal
void showCommentsModal(BuildContext context, Post post) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => CommentsModal(post: post),
  );
}