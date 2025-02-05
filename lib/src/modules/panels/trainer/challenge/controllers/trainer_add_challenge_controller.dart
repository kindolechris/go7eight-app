import 'package:image_picker/image_picker.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/image_size_model.dart';
import 'package:go7eight/src/modules/panels/trainer/challenge/controllers/trainer_challenge_controller.dart';

class TrainerAddChallengeController extends GetxController {
  TextEditingController challengetitleTextController = TextEditingController();
  TextEditingController numberOfWeeksTextController = TextEditingController();
  TextEditingController challengePriceTextController = TextEditingController();
  RxList<TextEditingController> workoutTypeListController =
      <TextEditingController>[].obs;

  RxBool showChallengeTitle = false.obs;
  TextEditingController overviewDescription = TextEditingController();
  late QuillEditorController overviewDescriptionController;
  RxString overviewText = "".obs;
  RxString selectedThumbnailImagePath = "".obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    final workoutTypeController = TextEditingController();
    workoutTypeListController.add(workoutTypeController);
    overviewDescriptionController = QuillEditorController();
    overviewDescriptionController.onTextChanged((text) {
      overviewText.value = text;
    });
    super.onInit();
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

  gotoChallengeView() {
    TrainerChallengeListController trainerChallengeController = Get.find();
    trainerChallengeController.gotoChallengeDetails(
        challenge: trainerChallengeController.challenges.first,
        isCreate: true);
  }
}
