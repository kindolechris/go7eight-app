// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/profile/settings_options/hidden_words_controller.dart';
import 'package:prime_social_media_flutter_ui_kit/controller/profile/settings_options/language_controller.dart';
import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_icon.dart';
import '../../config/app_size.dart';
import '../../config/app_string.dart';
import '../../helpers/theme_helper.dart';
import '../../widget/app_textfield.dart';

class HiddenWordsView extends StatelessWidget {
  HiddenWordsView({Key? key}) : super(key: key);

  HiddenWordsController hiddenWordsController = Get.put(HiddenWordsController());
  LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: _appBar(),
      body: _body(),
    );
  }

  //Hidden Words content
  _appBar() {
    return AppBar(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      scrolledUnderElevation: AppSize.appSize0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: AppSize.appSize12, left: AppSize.appSize6),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize12 : AppSize.appSize0,
                right: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize0 : AppSize.appSize12,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  languageController.selectedLanguageIndex.value == AppSize.size2 ? AppIcon.backRight : AppIcon.back,
                  width: AppSize.appSize24,
                ),
              ),
            ),
             Text(
              AppString.hiddenWords,
              style: TextStyle(
                fontSize: AppSize.appSize20,
                fontWeight: FontWeight.w600,
                fontFamily: AppFont.appFontSemiBold,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSize.appSize24, left: AppSize.appSize20, right: AppSize.appSize20,
      ),
      child: Column(
        children: [
          AppTextField(
            controller: hiddenWordsController.enterWordsController,
            labelText: AppString.enterWord,
            fillColor: themedColor(Get.context!, (c) => c.cardBackgroundColor),
            keyboardType: TextInputType.text,
            readOnly: false,
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSize.appSize12),
            child: Row(
              children: [
                _customHiddenWords(text: AppString.hi),
                _customHiddenWords(text: AppString.hello),
                _customHiddenWords(text: AppString.user),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _customHiddenWords({required String text}) {
    return Container(
      padding: const EdgeInsets.only(
        left: AppSize.appSize12, right: AppSize.appSize12, top: AppSize.appSize6, bottom: AppSize.appSize7,
      ),
      margin: EdgeInsets.only(
        left: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize8 : AppSize.appSize0,
        right: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize0 : AppSize.appSize8,
      ),
      decoration: BoxDecoration(
        color: themedColor(Get.context!, (c) => c.cardBackgroundColor),
        borderRadius: BorderRadius.circular(AppSize.appSize22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize8 : AppSize.appSize0,
              right: languageController.selectedLanguageIndex.value == AppSize.size2 ? AppSize.appSize0 : AppSize.appSize8,
            ),
            child: Text(
              text,
              style:  TextStyle(
                fontSize: AppSize.appSize14,
                fontWeight: FontWeight.w400,
                fontFamily: AppFont.appFontRegular,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              ),
            ),
          ),
          Image.asset(
            AppIcon.cancel,
            width: AppSize.appSize8,
          ),
        ],
      ),
    );
  }
}