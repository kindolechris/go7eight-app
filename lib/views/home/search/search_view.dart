// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/profile/settings_options/language_controller.dart';
import '../../../config/app_color.dart';
import '../../../config/app_font.dart';
import '../../../config/app_icon.dart';
import '../../../config/app_size.dart';
import '../../../config/app_string.dart';
import '../../../controller/home/search_controller.dart';
import '../../../helpers/theme_helper.dart';
import '../../../routes/app_routes.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  SearchIDController searchIDController = Get.put(SearchIDController());
  LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  //Search content
  _appBar() {
    return AppBar(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      leading: Padding(
        padding: EdgeInsets.only(
          left: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize0 : AppSize.appSize20,
          right: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize20 : AppSize.appSize0,
          top: AppSize.appSize6,
        ),
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            languageController.selectedLanguageIndex.value == AppSize.size2 ? AppIcon.backRight : AppIcon.back,
          ),
        ),
      ),
      leadingWidth: AppSize.appSize44,
      title: Container(
        height: AppSize.appSize38,
        margin: const EdgeInsets.only(top: AppSize.appSize6),
        padding: const EdgeInsets.only(
          left: AppSize.appSize14,
          right: AppSize.appSize14,
        ),
        decoration: BoxDecoration(
          color: themedColor(Get.context!, (c) => c.cardBackgroundColor),
          borderRadius: BorderRadius.circular(AppSize.appSize6),
          border: Border.all(color: themedColor(Get.context!, (c) => c.borderColor), width: AppSize.appSizePoint7),
        ),
        child: Center(
          child: TextFormField(
            controller: searchIDController.searchFieldController,
            cursorColor: themedColor(Get.context!, (c) => c.secondaryColor),
            style:  TextStyle(
              fontSize: AppSize.appSize14,
              fontWeight: FontWeight.w400,
              fontFamily: AppFont.appFontSemiBold,
              color: themedColor(Get.context!, (c) => c.secondaryColor),
            ),
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              hintText: AppString.search,
              hintStyle:  TextStyle(
                fontSize: AppSize.appSize14,
                fontWeight: FontWeight.w400,
                fontFamily: AppFont.appFontRegular,
                color: themedColor(Get.context!, (c) => c.text1Color),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  left: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize8 : AppSize.appSize0,
                  right: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize0 : AppSize.appSize8,
                ),
                child: Image.asset(AppIcon.searchLike),
              ),
              prefixIconConstraints: const BoxConstraints(
                maxWidth: AppSize.appSize22,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.appSize24),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: searchIDController.searchIDList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: AppSize.appSize20, right: AppSize.appSize20,
            ),
            child: ListTile(
              onTap: () {
                Get.toNamed(AppRoutes.allPostView);
              },
              contentPadding: EdgeInsets.zero,
              dense: true,
              leading: GestureDetector(
                onTap: () {
                  if(index == 0 || index == 3 || index == 4 || index == 5) {
                    Get.toNamed(AppRoutes.storyFullView);
                  }
                },
                child: Image.asset(
                  searchIDController.searchIDImageList[index],
                  width: searchIDController.searchImageWidthList[index],
                ),
              ),
              title: Text(
                searchIDController.searchIDList[index],
                style:  TextStyle(
                  fontSize: AppSize.appSize14,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFont.appFontSemiBold,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
              ),
              subtitle: Text(
                searchIDController.searchIDList[index],
                style:  TextStyle(
                  fontSize: AppSize.appSize14,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFont.appFontRegular,
                  color: themedColor(Get.context!, (c) => c.text2Color),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
