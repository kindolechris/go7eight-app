import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/meal_process_type_enum.dart';

import '../../controllers/trainer_add_recipe_controller.dart';
import 'add_process_bottomsheet.dart';

class AssemblyProcessWidget extends GetView<TrainerAddRecipeController> {
  const AssemblyProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("assembly_lbl".tr,
            textAlign: TextAlign.left,
            style: TextStyleX.subHeading2BlueGrey(context)),
        GestureDetector(
          onTap: () {
            controller.initProcessTextController();
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) {
                return Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const RecipeAddProcessBottomsheet(
                      mealProcessType: MealProcessType.assembly,
                    ));
              },
            );
          },
          child: Obx(() {
            return controller.assemblyList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.assemblyList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).brightness ==
                                    Brightness.light
                                ? AppColor.white
                                : AppColor.blackShade,
                            border: Border.all(
                              color: AppColor.boarderBlueGrey,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Step ${index + 1}",
                              style:
                                  TextStyleX.subHeading2BlueGrey(context),
                            ),
                            Text(
                              controller.assemblyList[index],
                              maxLines: 10,
                              style: TextStyleX.subHeading2BlueGrey(context)
                                  .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.grey
                                    : AppColor.lightGrey,
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                : Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.white
                            : AppColor.blackShade,
                        border: Border.all(
                          color: AppColor.boarderBlueGrey,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "recipe_process_hint".tr,
                            style: TextStyleX.subHeading2BlueGrey(context)
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.grey,
                        )
                      ],
                    ));
          }),
        ),
      ],
    );
  }
}
