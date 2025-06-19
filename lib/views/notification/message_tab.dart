import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_color.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';

class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        "name": "Eleanor Pena",
        "msg": "send reel by hellodeep",
        "time": "2m",
        "avatar": "https://i.pravatar.cc/150?img=1",
        "unread": true
      },
      {
        "name": "RR",
        "msg": "send reel by hellodeep",
        "time": "3h",
        "avatar": "https://i.pravatar.cc/150?img=2",
        "unread": true
      },
      {
        "name": "Marvin Mckinney Co",
        "msg": "send reel by hello",
        "time": "2h",
        "avatar": "https://i.pravatar.cc/150?img=3",
        "unread": false
      },
      {
        "name": "Fox Robert",
        "msg": "send reel by fun_zone",
        "time": "2h",
        "avatar": "https://i.pravatar.cc/150?img=4",
        "unread": false
      },
      {
        "name": "Jenuuu Wilson",
        "msg": "send reel by hellodeep",
        "time": "4h",
        "avatar": "https://i.pravatar.cc/150?img=5",
        "unread": false
      },
      {
        "name": "Devon",
        "msg": "seen 23h ago",
        "time": "",
        "avatar": "https://i.pravatar.cc/150?img=6",
        "unread": false
      },
    ];

    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final m = messages[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StoryAvatar(imageUrl: m['avatar'] as String),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.messagesChatView);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        m['name'] as String,
                        style: TextStyle(
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              m['msg'] as String,
                              style: TextStyle(
                                color: themedColor(
                                    Get.context!, (c) => c.text2Color),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if ((m['time'] as String).isNotEmpty) ...[
                            const SizedBox(width: 6),
                            Text('•',
                                style: TextStyle(
                                  color: themedColor(
                                      Get.context!, (c) => c.text1Color),
                                )),
                            const SizedBox(width: 6),
                            Text(
                              m['time'] as String,
                              style: TextStyle(
                                  color: themedColor(
                                      Get.context!, (c) => c.text2Color),
                                  fontSize: 12),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (m['unread'] == true)...[
                const Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Icon(Icons.circle, color: AppColor.primaryColor, size: 8),
                ),
              ]else...[
                const Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Icon(Icons.circle, color: Colors.transparent, size: 8),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}

class StoryAvatar extends StatelessWidget {
  final String imageUrl;
  const StoryAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient:
            LinearGradient(colors: [Colors.purple, Colors.red, Colors.orange]),
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
