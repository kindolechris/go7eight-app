import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';

import '../../helpers/theme_helper.dart';
import 'message_tab.dart';
import 'notifications_tab.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MessagesNotificationsPage(),
  ));
}

class MessagesNotificationsPage extends StatefulWidget {
  const MessagesNotificationsPage({super.key});

  @override
  State<MessagesNotificationsPage> createState() =>
      _MessagesNotificationsPageState();
}

class _MessagesNotificationsPageState extends State<MessagesNotificationsPage> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> messages = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top header
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back,
                          color: themedColor(Get.context!, (c) => c.secondaryColor))),
                  const SizedBox(width: 12),
                    Text(
                    "Messages",
                    style: TextStyle(
                        fontSize: 22,
                        color: themedColor(Get.context!, (c) => c.secondaryColor),
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon:
                          Icon(Icons.add_box_outlined, color: themedColor(Get.context!, (c) => c.secondaryColor),),
                  )
                ],
              ),
              const SizedBox(height: 16),

              // Search bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: themedColor(Get.context!, (c) => c.chatColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  TextField(
                  style: TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor),),
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: themedColor(Get.context!, (c) => c.text2Color),),
                    hintText: "Search",
                    hintStyle: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color),),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Tab buttons
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTab = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedTab == 0
                              ? themedColor(Get.context!, (c) => c.secondaryColor)
                              : themedColor(Get.context!, (c) => c.cardBackgroundColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Messages',
                          style: TextStyle(
                            color:
                                selectedTab == 0 ? themedColor(Get.context!, (c) => c.backgroundColor): themedColor(Get.context!, (c) => c.secondaryColor),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTab = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedTab == 1
                              ? themedColor(Get.context!, (c) => c.secondaryColor)
                              : themedColor(Get.context!, (c) => c.cardBackgroundColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            color:
                                selectedTab == 1 ? themedColor(Get.context!, (c) => c.backgroundColor) : themedColor(Get.context!, (c) => c.secondaryColor),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Main content
              Expanded(
                child: selectedTab == 0 ? MessagesTab() : NotificationsTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
