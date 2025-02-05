import 'package:image_picker/image_picker.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/meal_process_type_enum.dart';
import 'package:go7eight/src/models/image_size_model.dart';

import 'trainer_recipe_controller.dart';

class TrainerAddRecipeController extends GetxController {
  TextEditingController recipetitleTextController = TextEditingController();
  TextEditingController caloriesTextController = TextEditingController();
  TextEditingController prepTimeTextController = TextEditingController();
  TextEditingController proteinsTextController = TextEditingController();
  TextEditingController fatsTextController = TextEditingController();
  TextEditingController carbsTextController = TextEditingController();
  TextEditingController mealTypeTextController = TextEditingController();
  RxList<TextEditingController> recipeTagListController =
      <TextEditingController>[].obs;
  RxList<TextEditingController> processListController =
      <TextEditingController>[].obs;
  RxList<IngredientAndSpiceModel> ingredientList =
      <IngredientAndSpiceModel>[].obs;
  RxList<IngredientAndSpiceModel> spiceList = <IngredientAndSpiceModel>[].obs;
  RxList<String> prepareList = <String>[].obs;
  RxList<String> cookList = <String>[].obs;
  RxList<String> assemblyList = <String>[].obs;
  RxString mealTypeValue = "Breakfast".obs;
  RxString ingredientUnitValue = "Ounce".obs;
  RxString spiceUnitValue = "Tps".obs;
  TextEditingController ingredientSpiceNameTextController =
      TextEditingController();
  TextEditingController ingredientSpiceQuantityValueTextController =
      TextEditingController();
  TextEditingController ingredientSpiceBrandNameTextController =
      TextEditingController();
  RxBool showIngredientSpiceNameError = false.obs;
  RxBool showIngredientSpiceQuantityError = false.obs;
  RxBool showIngredientSpiceBrandNameError = false.obs;
  RxString selectedThumbnailImagePath = "".obs;
  final ImagePicker _picker = ImagePicker();

  RxBool showRecipeTitleError = false.obs;
  RxBool showCaloriesError = false.obs;
  RxBool showPrepTimeError = false.obs;
  RxBool showProteinError = false.obs;
  RxBool showFatError = false.obs;
  RxBool showCarbError = false.obs;
  RxBool showMealTypeError = false.obs;

  TextEditingController overviewDescription = TextEditingController();
  late QuillEditorController overviewDescriptionController;
  RxString overviewText = "".obs;

  @override
  void onInit() {
    final workoutTypeController = TextEditingController();
    recipeTagListController.add(workoutTypeController);
    overviewDescriptionController = QuillEditorController();
    super.onInit();
  }

  addIngredient({required bool isSpice}) {
    IngredientAndSpiceModel ingredient = IngredientAndSpiceModel(
        name: ingredientSpiceNameTextController.text,
        brand: ingredientSpiceBrandNameTextController.text,
        quantity: ingredientSpiceQuantityValueTextController.text,
        unit: isSpice
            ? spiceUnitValue.value
            : ingredientUnitValue.value);
    if (isSpice) {
      spiceList.add(ingredient);
    } else {
      ingredientList.add(ingredient);
    }
    cancelIngredient();
  }

  editIngredient(IngredientAndSpiceModel item) {
    ingredientSpiceNameTextController.text = "${item.name}";
    ingredientSpiceBrandNameTextController.text = "${item.brand}";
    ingredientSpiceQuantityValueTextController.text = "${item.quantity}";
    ingredientUnitValue.value = "${item.unit}";
  }

  cancelIngredient() {
    ingredientSpiceNameTextController.text = "";
    ingredientSpiceBrandNameTextController.text = "";
    ingredientSpiceQuantityValueTextController.text = "";
    ingredientUnitValue.value = "Ounce";
  }

  selectImage() async {
    selectedThumbnailImagePath.value =
        await _imagePickFromSource(ImageSize(maxWidth: 350, maxHeight: 350));
  }

  Future<String> _imagePickFromSource(ImageSize imageSize) async {
    ImageSource imageSource = ImageSource.gallery;
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
      maxWidth: imageSize.maxWidth,
      maxHeight: imageSize.maxHeight,
      imageQuality: 100,
    );
    return pickedFile!.path;
  }

  addProcess(MealProcessType mealProcessType) {
    switch (mealProcessType) {
      case MealProcessType.prepare:
        for (var textController in processListController) {
          prepareList.add(textController.text);
        }
        processListController.clear();
        break;
      case MealProcessType.cook:
        for (var textController in processListController) {
          cookList.add(textController.text);
        }
        processListController.clear();
        break;
      case MealProcessType.assembly:
        for (var textController in processListController) {
          assemblyList.add(textController.text);
        }
        processListController.clear();
        break;
      default:
        break;
    }
  }

  initProcessTextController() {
    if (processListController.isEmpty) {
      processListController.add(TextEditingController());
    }
  }

  gotoRecipeDetails() {
    TrainerRecipeController trainerRecipeController = Get.find();
    trainerRecipeController.gotoRecipeDetailsView(
        recipe: trainerRecipeController.recipes.first, isCreate: true);
  }
}

class IngredientAndSpiceModel {
  String? name;
  String? brand;
  String? quantity;
  String? unit;

  IngredientAndSpiceModel(
      {required this.name,
      required this.brand,
      required this.quantity,
      required this.unit});
}
