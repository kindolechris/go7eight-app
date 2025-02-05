import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:go7eight/src/core/app_export.dart';
import '../controllers/session_controllers.dart';
import '../../../global_widgets/app_bar_widget.dart';

class SessionBeginningCounterView extends GetView<SessionController> {
  final String title;

  const SessionBeginningCounterView({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sessionAppBar(context, showSaveIcon: false, title: title),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CircularCountDownTimer(
                    duration: 6,
                    initialDuration: 0,
                    controller: CountDownController(),
                    width: AppRatioSize.getRatioWidth() / 2,
                    height: AppRatioSize.getRatioWidth() / 2,
                    ringColor: Theme.of(context).brightness == Brightness.light
                        ? AppColor.primary.withOpacity(0.2)
                        : AppColor.primary.withOpacity(0.2),
                    ringGradient: null,
                    fillColor: Theme.of(context).brightness == Brightness.light
                        ? AppColor.primary
                        : AppColor.primary,
                    fillGradient: null,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                            ? AppColor.white
                            : AppColor.black,
                    backgroundGradient: null,
                    strokeWidth: 5.0,
                    strokeCap: StrokeCap.round,
                    textStyle: TextStyle(
                        fontSize: AppTextSizes.titleText1() * 2,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.textBlueGrey
                            : AppColor.creamColor,
                        fontWeight: FontWeight.bold),
                    textFormat: CountdownTextFormat.S,
                    isReverse: true,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    autoStart: true,
                    onStart: () {
                      debugPrint('Countdown Started');
                    },
                    onComplete: controller.countDownFinished,
                    onChange: (String timeStamp) {
                      debugPrint('Countdown Changed $timeStamp');
                    },
                    timeFormatterFunction:
                        (defaultFormatterFunction, duration) {
                      if (duration.inSeconds == 0) {
                        return "0";
                      } else {
                        return Function.apply(
                            defaultFormatterFunction, [duration]);
                      }
                    }),
                AppRatioSpaces.verticalSectionSpaceS(),
                Text(
                  "${"starting_in_lbl".tr}...",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleX.subHeading2(context),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBarButtons(context),
    );
  }

  _bottomNavBarButtons(BuildContext context) {
    return Container(
      padding: AppPaddings.bottomBarButton2(),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.blackShade.withOpacity(0.1)
                : AppColor.white.withOpacity(0.1),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: const Offset(0, -2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: AppButton(
            action: controller.countDownFinished,
            text: "lbl_skip",
            fontSize: AppTextSizes.headerText1(),
            buttonWidth: double.infinity,
            boarderRadius: 8,
            txtColor: AppColor.white,
          )),
        ],
      ),
    );
  }
}
