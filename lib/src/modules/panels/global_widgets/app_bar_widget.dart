
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/app_export.dart';

PreferredSizeWidget sessionAppBar(
  BuildContext context, {
  required String title,
  bool? showSaveIcon,
  void Function()? saveIconAction,
  void Function()? backButtonAction,
  bool? sessionSaved,
}) {
  return PreferredSize(
    preferredSize: Size(Get.width, 60),
    child: AppBar(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      centerTitle: true,
      automaticallyImplyLeading: true,
      leading: AppBackButton(action: backButtonAction),
      elevation: 0.6,
      title: Text(title.tr, style: TextStyleX.titleText7(context)),
      actions: [
        showSaveIcon == true
            ? _appBarAction(context, saveIconAction, sessionSaved)
            : Container()
      ],
    ),
  );
}

Widget _appBarAction(
    BuildContext context, void Function()? saveIconAction, bool? sessionSaved) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: saveIconAction,
        child: Container(
            width: AppRatioSize.getRatioWidth() / 12,
            height: AppRatioSize.getRatioWidth() / 12,
            margin: EdgeInsets.only(right: AppRatioSize.getRatioWidth() / 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              sessionSaved == true
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              color: AppColor.white,
            )),
      ),
    ],
  );
}
