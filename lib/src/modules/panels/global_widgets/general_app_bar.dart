
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/app_export.dart';

PreferredSizeWidget fitnofyGeneralAppBar(
  BuildContext context, {
  required String title,
  bool? showAddIcon,
  bool? showViewIcon,
  bool? visibility,
  bool? showLeading,
  void Function()? iconAction,
  void Function()? iconViewAction,
  void Function()? backButtonAction,
}) {
  return PreferredSize(
    preferredSize: Size(Get.width, 60),
    child: AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      centerTitle: true,
      automaticallyImplyLeading: showLeading ?? false,
      leading: showLeading == null
          ? Container()
          : AppBackButton(action: backButtonAction),
      elevation: 3,
      shadowColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.textBlueGrey.withOpacity(0.12)
          : AppColor.white.withOpacity(0.12),
      title: Text(title.tr,
          style: TextStyleX.titleText7(context).copyWith(letterSpacing: 0.5)),
      actions: [
        showAddIcon == true
            ? _appBarAction(context, iconAction: iconAction)
            : Container(),
        showViewIcon == true
            ? _appBarViewAction(context,
                iconAction: iconViewAction, visibility: visibility!)
            : Container()
      ],
    ),
  );
}

Widget _appBarAction(BuildContext context,
    {required void Function()? iconAction}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: iconAction,
        child: Container(
            width: AppRatioSize.getRatioWidth() / 12,
            height: AppRatioSize.getRatioWidth() / 12,
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(Get.width),
                border: Border.all(color: AppColor.primary)),
            child: const Icon(
              Icons.add,
              color: AppColor.primary,
            )),
      ),
    ],
  );
}

Widget _appBarViewAction(BuildContext context,
    {required void Function()? iconAction, required bool visibility}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: iconAction,
        child: Container(
            width: AppRatioSize.getRatioWidth() / 12,
            height: AppRatioSize.getRatioWidth() / 12,
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(Get.width),
                border: Border.all(color: AppColor.primary)),
            child: Icon(
              visibility == true ? Icons.visibility : Icons.visibility_off,
              color: AppColor.primary,
            )),
      ),
    ],
  );
}
