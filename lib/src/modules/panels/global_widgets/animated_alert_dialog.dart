import 'package:flutter/cupertino.dart';
import '../../../core/app_export.dart';

class AnimatedAlertDialog extends StatefulWidget {
  final String title;
  final String description;
  final Widget icon;
  final Widget? buttonWidget;
  final String? buttonText;
  final void Function()? buttonAction;
  final Color? titleColor;

  const AnimatedAlertDialog(
      {super.key,
      required this.title,
      required this.description,
      required this.icon,
      this.buttonText,
      this.buttonWidget,
      this.buttonAction,
      this.titleColor});
  @override
  State<StatefulWidget> createState() => AnimatedAlertDialogState();
}

class AnimatedAlertDialogState extends State<AnimatedAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.ease);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: Get.width,
            padding: EdgeInsets.all(AppRatioSize.getRatioWidth() / 24),
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.blackShade,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                AppRatioSpaces.verticalSectionSpaceMTF(),
                widget.icon,
                AppRatioSpaces.verticalSectionSpaceXS(),
                Text(
                  widget.title.tr,
                  textAlign: TextAlign.center,
                  style: TextStyleX.titleText7(context),
                ),
                AppRatioSpaces.verticalSectionSpaceXS(),
                Text(
                  widget.description.tr,
                  style: TextStyleX.subHeading2(context).copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? widget.titleColor ?? AppColor.grey
                        : widget.titleColor ?? AppColor.grey,
                    fontSize: AppTextSizes.headerText3() / 1.1,
                  ),
                  maxLines: 5,
                  textAlign: TextAlign.center,
                ),
                AppRatioSpaces.verticalSectionSpaceM(),
                widget.buttonWidget != null
                    ? widget.buttonWidget!
                    : AppButton(
                        action: () {
                          controller.reverse().then((value) {
                            Navigator.pop(context);
                              widget.buttonAction!();
                          });
                        },
                        text: widget.buttonText ?? "lbl_got_it",
                        fontSize: AppTextSizes.headerText(),
                        buttonWidth: double.infinity,
                        boarderRadius: 8,
                        buttonHeight: 48,
                      ),
                AppRatioSpaces.verticalSectionSpaceMTF(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
