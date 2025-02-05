import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/student/recipe/controllers/recipe_controller.dart';
import 'package:go7eight/src/modules/panels/global_widgets/option_widget.dart';

class RecipeInstructionTab extends GetView<RecipeController> {
  const RecipeInstructionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        OptionWidget(
            title: "",
            filterOptions: controller.instructionOptions,
            showLeftPadding: false),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        _stepContainer(context,
            stepNumber: 1,
            stepDesc:
                "We all have different passions and talents, and that’s a beautiful thing. Some of us are incredible athletes, entrepreneurs, or investors. Some of us have spent our adult lives learning several languages or have learned how to fly airplanes or design skyscrapers."),
        _stepContainer(context,
            stepNumber: 2,
            stepDesc:
                "We all have different passions and talents, and that’s a beautiful thing. Some of us are incredible athletes, entrepreneurs, or investors. Some of us have spent our adult lives learning several languages or have learned how to fly airplanes or design skyscrapers. And then there are those of us who’ve dedicated our careers and our love to food. Some of us feel like kids at Disneyland when walking into a grocery store with a menu to plan. And while we’re certainly not the ones to build you a house or plan your retirement, what we can offer is, arguably, even better, which is learning to cook."),
        _stepContainer(context,
            stepNumber: 3,
            stepDesc:
                "While Uber Eats and DoorDash are life-saving options some days, learning a few basic kitchen techniques is a pretty important life skill. Knowing what you’re doing in the kitchen is one of the sexiest things you can master, so even if you have no interest in using your oven for anything but storage, know that being a good cook, if nothing else, is pretty hot."),
        _stepContainer(context,
            stepNumber: 4,
            stepDesc:
                "While Uber Eats and DoorDash are life-saving options some days, learning a few basic kitchen techniques is a pretty important life skill. Knowing what you’re doing in the kitchen is one of the sexiest things you can master, so even if you have no interest in using your oven for anything but storage, know that being a good cook, if nothing else, is pretty hot."),
        _stepContainer(context,
            stepNumber: 5,
            stepDesc:
                "While Uber Eats and DoorDash are life-saving options some days, learning a few basic kitchen techniques is a pretty important life skill. Knowing what you’re doing in the kitchen is one of the sexiest things you can master, so even if you have no interest in using your oven for anything but storage, know that being a good cook, if nothing else, is pretty hot."),
      ],
    );
  }

  Widget _stepContainer(BuildContext context,
      {required int stepNumber, required String stepDesc}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Step $stepNumber".tr,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyleX.subHeading1(context),
        ),
        Text(
          stepDesc.tr,
          textAlign: TextAlign.justify,
          maxLines: 150,
          overflow: TextOverflow.ellipsis,
          style: TextStyleX.body3(context),
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
      ],
    );
  }
}
