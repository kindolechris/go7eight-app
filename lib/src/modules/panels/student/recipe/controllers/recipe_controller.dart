
import 'package:get/get.dart';
import 'package:go7eight/src/models/setting_option_model.dart';
class RecipeController extends GetxController {
  RxBool isIngredientsSelected = true.obs;
  RxBool showBrandSelected = true.obs;
  RxBool showSpicesSelected = true.obs;
  RxInt personCount = 1.obs;

  List<OptionModel> instructionOptions = <OptionModel>[
    OptionModel(true, "Prepared", ""),
    OptionModel(false, "Cook", ""),
    OptionModel(false, "Assembly", ""),
  ];
}
