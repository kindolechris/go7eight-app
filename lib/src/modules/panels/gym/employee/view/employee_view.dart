import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/employee_controller.dart';
import 'widgets/nutritionist_list_view.dart';
import 'widgets/trainer_list_view.dart';

class GYMEmployeeView extends StatefulWidget {
  const GYMEmployeeView({super.key});

  @override
  State<GYMEmployeeView> createState() => _GYMEmployeeViewState();
}

class _GYMEmployeeViewState extends State<GYMEmployeeView> {
  final GYMEmployeeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    _controller.isTrainerSelected.value == true;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(context,
          showAddIcon: true,
          title: "user_type_two",
          iconAction: _controller.onEmployeeAddClick),
      body: Container(
          height: Get.height,
          width: Get.width,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              AppRatioSpaces.verticalSectionSpaceM(),
              Obx(() {
                return AppTabBar(
                    onChange: (value) {
                      _controller.isTrainerSelected.value = value;
                    },
                    isFirstOptionSelected: _controller.isTrainerSelected.value,
                    horizontalMargin: AppRatioSize.getRatioWidth() / 24,
                    optionOneText: "user_type_two",
                    optionTwoText: "user_type_three");
              }),
              Obx(() {
                return _controller.isTrainerSelected.value == true
                    ? const TrainerListView()
                    : const NutritionistListView();
              }),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }
}
