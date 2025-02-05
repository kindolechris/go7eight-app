import '../../controllers/home_controller.dart';
import 'package:go7eight/src/core/app_export.dart';

class ReflectionWidget extends GetView<HomeController> {
  const ReflectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const AppSectionTitle(
          title: "reflection_lbl",
          disableDefaultVPadding: true,
        ),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        _reflectionTextFieldWidget(context),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppRatioSize.getRatioWidth() / 24,
          ),
          child: Obx(() {
            return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.reflections.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppRatioSize.getRatioWidth() / 24,
                        vertical: AppRatioSize.getRatioHeight() / 66),
                    margin: EdgeInsets.only(
                        bottom: AppRatioSize.getRatioHeight() / 88),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.offWhite
                            : AppColor.blackShade),
                    child: Text(
                      controller.reflections[index].data.tr,
                      textAlign: TextAlign.start,
                      style: TextStyleX.subHeading3(context).copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.grey
                                  : AppColor.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  );
                });
          }),
        ),
      ],
    );
  }

  Widget _reflectionTextFieldWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppRatioSize.getRatioWidth() / 24,
      ),
      child: AppTextField(
        controller: controller.reflectionTextController,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        showLabel: false,
        hintText: "how_was_your_day_hint",
        boarderRadius: 12,
        showSuffixIcon: true,
        suffixIcon: Icons.send_rounded,
        suffixAction: () {
          controller.addReflection();
        },
      ),
    );
  }
}
