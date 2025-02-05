import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/trainer_add_recipe_controller.dart';
import 'assembly_process_widget.dart';
import 'cook_process_widget.dart';
import 'prepare_process_widget.dart';

class AddProcessWidget extends GetView<TrainerAddRecipeController> {
  const AddProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "add_process_lbl".tr,
              style: TextStyleX.subHeading4(context).copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.w800,
                fontSize: AppTextSizes.headerText2(),
              ),
            ),
          ),
          AppRatioSpaces.verticalSectionSpaceXXXS(),
          Container(
            padding: EdgeInsets.all(AppRatioSize.getRatioWidth() / 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.boarderBlueGrey),
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.textFieldBackground
                  : AppColor.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrepareProcessWidget(),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                const CookProcessWidget(),
                AppRatioSpaces.verticalSectionSpaceXXXS(),
                const AssemblyProcessWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
