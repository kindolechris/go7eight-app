// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/profile/profile_controller.dart';
import 'package:prime_social_media_flutter_ui_kit/views/widget/home/post_view_dailog.dart';
import '../../../../config/app_size.dart';
import '../../../helpers/theme_helper.dart';

class ProfilePostsTabView extends StatelessWidget {
  ProfilePostsTabView({Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return _profilePostsTab();
  }

  //Profile Posts Tab content
  _profilePostsTab() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSize.appSize20, right: AppSize.appSize20,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppSize.size4,
          crossAxisSpacing: AppSize.appSize1,
          mainAxisSpacing: AppSize.appSize1,
        ),
        itemCount: profileController.postsList.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                barrierColor: themedColor(Get.context!, (c) => c.backgroundColor).withOpacity(AppSize.appSizePoint7),
                builder: (context) {
                  return PostViewDialog(imageUrl: profileController.postsList[index]);
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(profileController.postsList[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
