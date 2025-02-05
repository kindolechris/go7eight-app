import 'package:image_picker/image_picker.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/models/image_size_model.dart';
import 'trainer_session_controller.dart';

class TrainerSessionAddController extends GetxController {
  TextEditingController sessiontitleTextController = TextEditingController();
  TextEditingController sessionPriceTextController = TextEditingController();
  TextEditingController caloriesBurnTextController = TextEditingController();
  TextEditingController mealTextController = TextEditingController();
  RxList<TextEditingController> workoutTypeListController =
      <TextEditingController>[].obs;
  RxString selectedThumbnailImagePath = "".obs;
  RxString selectedVideoPath = "".obs;
  final ImagePicker _picker = ImagePicker();

  RxBool showChallengeTitle = false.obs;
  TextEditingController overviewDescription = TextEditingController();
  late QuillEditorController overviewDescriptionController;
  RxString overviewText = "".obs;
  RxBool videoIsReady = false.obs;

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

  selectImage(bool isVideo) async {
    if (isVideo) {
      selectedVideoPath.value =
          await _videoPickFromSource(ImageSize(maxWidth: 350, maxHeight: 350));
    } else {
      selectedThumbnailImagePath.value =
          await _imagePickFromSource(ImageSize(maxWidth: 350, maxHeight: 350));
    }
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

  Future<String> _videoPickFromSource(ImageSize imageSize) async {
    final pickedFile = await _picker.pickVideo(
        source: ImageSource.gallery,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: const Duration(minutes: 10));
    XFile? xfilePick = pickedFile;

    return xfilePick!.path;
  }

  gotoSessionDetailsView() {
    TrainerSessionController trainerSessionController = Get.find();
    trainerSessionController.singleSessionClick(
        SessionType.regular, false, trainerSessionController.sessions.first,
        isCreate: true);
  }
}
