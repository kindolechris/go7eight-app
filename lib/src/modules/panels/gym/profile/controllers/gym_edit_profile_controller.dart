import 'package:image_picker/image_picker.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/image_size_model.dart';
import 'package:go7eight/src/models/setting_option_model.dart';

class GYMEditProfileController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxString selectedProfileImagePath = "".obs;
  RxString selectedCoverImagePath = "".obs;
  final ImagePicker _picker = ImagePicker();
  Rx<OptionModel> selectedImageSourceOption = OptionModel(false, "", "").obs;
  List<OptionModel> imageSourceOptionData = [
    OptionModel(true, 'Gallery',
        "Please select the image, you want to upload from your gallery."),
    OptionModel(false, 'Camera',
        "Please capture the image, you want to upload directly from your camera.")
  ];
  selectImage(bool isProfileImage) async {
    if (isProfileImage) {
      selectedProfileImagePath.value =
          await imagePickFromSource(ImageSize(maxWidth: 350, maxHeight: 350));
    } else {
      selectedCoverImagePath.value =
          await imagePickFromSource(ImageSize(maxWidth: 550, maxHeight: 550));
    }
  }

  TextEditingController gymNameTextController = TextEditingController();
  RxBool showFirstNameError = false.obs;
  TextEditingController emailTextController = TextEditingController();
  RxBool showLastNameError = false.obs;

  Future<String> imagePickFromSource(ImageSize imageSize) async {
    ImageSource imageSource =
        selectedImageSourceOption.value == imageSourceOptionData[0]
            ? ImageSource.gallery
            : ImageSource.camera;
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
      maxWidth: imageSize.maxWidth,
      maxHeight: imageSize.maxHeight,
      imageQuality: 100,
    );
    return pickedFile!.path;
  }

  @override
  void onInit() {
    selectedImageSourceOption.value = imageSourceOptionData[0];
    super.onInit();
  }

  void doneEditingPreference() {}

  doneEditingTrainingDay() {
    Get.back();
  }

  getPreferenceDataFromController() {}
  saveProfileChanges() {
    Get.back();
    SnackBarX.showSuccess(
        title: "profile_update_snack_title",
        message: "profile_update_snack_message");
  }
}
