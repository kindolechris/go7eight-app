import 'package:go7eight/src/core/app_export.dart';

import '../controllers/gym_dashboard_controller.dart';
import 'widgets/bar_chart_widget.dart';
import 'widgets/gym_app_bar.dart';
import 'widgets/insight_macro_widget.dart';
import 'widgets/line_chart_widget.dart';
import 'widgets/transfer_widget.dart';

class GYMDashboardView extends GetView<GYMDashboardController> {
  const GYMDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
            appBar: const GYMAppBar(),
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            body: Container(
              height: Get.height,
              width: Get.width,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              margin: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 24),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  AppRatioSpaces.verticalSectionSpaceXS(),
                  const MoneyTransferWidget(),
                  AppRatioSpaces.verticalSectionSpaceXXXS(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: GridView.builder(
                      itemCount: controller.insightMacros.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Get.width < 600 ? 2 : 4,
                          crossAxisSpacing: AppRatioSize.getRatioWidth() / 88,
                          mainAxisSpacing: AppRatioSize.getRatioWidth() / 44,
                          childAspectRatio: 2.2),
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: InsightMacroWidget(
                            iconColor:
                                controller.insightMacros[index].iconColor!,
                            iconPath: controller.insightMacros[index].iconPath!,
                            macroLabel:
                                controller.insightMacros[index].name!,
                            macroValue:
                                controller.insightMacros[index].macroValue!,
                            macroUnit:
                                controller.insightMacros[index].macroUnit!,
                          ),
                        );
                      },
                    ),
                  ),
                  AppRatioSpaces.verticalSectionSpaceS(),
                  const LineChartGYM(),
                  AppRatioSpaces.verticalSectionSpaceM(),
                  const BarChartGYM(),
                  AppRatioSpaces.verticalSectionSpaceM(),
                ],
              ),
            )),
      ),
    );
  }
}
