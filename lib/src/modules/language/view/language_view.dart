
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../panels/global_widgets/profile_item_widget.dart';
import '../../panels/global_widgets/radio_button_option.dart';
import '../controller/language_controller.dart';

class LanguageView extends GetView<LanguageController>{
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileItemWidget(
      title: "language_lbl",
      listChild: RadioButtonOption(
        title: "",
        controller.appLanguageData,
        showDescription: false,
        verticalMargin: 2,
        onChanged: (value) {
          controller.appLanguageSelected.value = value;
          controller.changeLanguage();
        },
      ),
    );
  }

}