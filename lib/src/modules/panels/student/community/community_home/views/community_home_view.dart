import 'package:flutter/material.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';
import 'package:go7eight/src/modules/panels/global_widgets/option_widget.dart';
import 'package:go7eight/src/modules/panels/student/community/community_home/views/widgets/post_widget.dart';
import 'package:go7eight/src/modules/panels/student/community/community_notification/bindings/community_notification_binding.dart';
import 'package:go7eight/src/modules/panels/student/home/views/widget/home_app_bar.dart';

import '../../community_notification/views/community_notification_view.dart';
import '../../community_profile/bindings/community_profile_binding.dart';
import '../../community_profile/views/community_profile_view.dart';
import '../controller/community_home_controller.dart';

class MessageView extends GetView<CommunityHomeController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Messages",
            style: TextStyle(
              color: AppColor.textBlueGrey,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColor.textBlueGrey, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add, color: AppColor.textBlueGrey, size: 24),
              onPressed: () {},
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(),
            ),
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: AppColor.textBlueGrey, size: 24),
              onPressed: () {},
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: _buildMessagesList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: AppColor.primaryLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(22),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search messages',
                  hintStyle: const TextStyle(
                    color: AppColor.blueGrey,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColor.primary,
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColor.primaryLight.withOpacity(0.3),
              borderRadius: BorderRadius.circular(22),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.filter_list,
                color: AppColor.primary,
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: 8, // For demonstration, using 8 messages
          separatorBuilder: (context, index) => Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade100,
          ),
          itemBuilder: (context, index) {
            // Alternate between different users for demonstration
            final bool isComputerCollection = index % 3 == 0;
            final bool isEze = index % 3 == 1;
            final bool isWalamlete = index % 3 == 2;

            String name = isComputerCollection
                ? "Computer_Collection"
                : (isEze ? "Eze_tz123" : "Walamlete");

            String message = isComputerCollection
                ? "Hello Edgar, Ndio black pia ipo..."
                : (isEze
                ? "Kuko na Link nimekutumia icheki basi.."
                : "When I can get notification about my pa...");

            String avatarUrl = isComputerCollection
                ? "https://i.pravatar.cc/150?img=12"
                : (isEze
                ? "https://i.pravatar.cc/150?img=5"
                : "https://i.pravatar.cc/150?img=8");

            bool hasUnread = isComputerCollection;

            return _buildMessageTile(
              name: name,
              message: message,
              time: "11:20",
              avatarUrl: avatarUrl,
              isOnline: isComputerCollection,
              hasUnread: hasUnread,
              unreadCount: hasUnread ? 2 : 0,
            );
          },
        ),
      ),
    );
  }

  Widget _buildMessageTile({
    required String name,
    required String message,
    required String time,
    required String avatarUrl,
    bool isOnline = false,
    bool hasUnread = false,
    int unreadCount = 0,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Avatar with online indicator
            Stack(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.network(
                      avatarUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                            strokeWidth: 2,
                            valueColor: const AlwaysStoppedAnimation<Color>(AppColor.primary),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => const Center(
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                if (isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColor.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 12),

            // Message content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColor.textBlueGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(
                      color: AppColor.blueGrey,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Time and unread count
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: AppColor.blueGrey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                if (hasUnread)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: AppColor.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        unreadCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}