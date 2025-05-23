import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';

import '../../helpers/theme_helper.dart';

class StoryListPage extends StatelessWidget {
  const StoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> users = [
      {
        'name': 'eleanor_pena',
        'time': '33m ago',
        'image': 'https://i.pravatar.cc/150?img=1',
        'action': 'replay'
      },
      {
        'name': 'eleanor_pena',
        'time': '33m ago',
        'image': 'https://i.pravatar.cc/150?img=2',
        'action': 'replay'
      },
      {
        'name': 'eleanor_pena',
        'time': '33m ago',
        'image': 'https://i.pravatar.cc/150?img=3',
        'action': 'live'
      },
      {
        'name': 'eleanor_pena',
        'time': '33m ago',
        'image': 'https://i.pravatar.cc/150?img=4',
        'action': 'live'
      },
    ];

    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        titleSpacing: 0,
        title: const Text(''),
        leading: Container(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(AppSize.appSize20),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.appSize16, vertical: AppSize.appSize8),
            child: Container(
              height: AppSize.appSize43,
              decoration: BoxDecoration(
                color: themedColor(Get.context!, (c) => c.text2Color),
                borderRadius: BorderRadius.circular(12),
              ),
              child:  TextField(
                style: TextStyle(color: themedColor(Get.context!, (c) => c.secondaryColor)),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: AppSize.appSize18,
                    color: themedColor(Get.context!, (c) => c.text1Color),
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: themedColor(Get.context!, (c) => c.text1Color),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (_, __) =>  Divider(color: themedColor(Get.context!, (c) => c.backgroundColor)),
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.purple,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user['image']),
              ),
            ),
            title: Text(
              user['name'],
              style:  TextStyle(
                color: themedColor(Get.context!, (c) => c.secondaryColor),
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              user['time'],
              style:  TextStyle(color: themedColor(Get.context!, (c) => c.text1Color)),
            ),
            trailing: user['action'] == 'replay'
                ?  Icon(Icons.history, color: themedColor(Get.context!, (c) => c.text2Color))
                : const Icon(FontAwesomeIcons.circleDot, color: AppColor.supportColor),
          );
        },
      ),
    );
  }
}
