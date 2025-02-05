import '../../core/app_export.dart';
import '../constants/app_text_sizes.dart';
import '../constants/colors.dart';
import 'app_text_style.dart';

class AppButton extends StatelessWidget {
  final void Function()? action;  // Allow action to be nullable
  final String text;
  final Color btnColor;
  final Color txtColor;
  final bool enabled;
  final bool primary;
  final double? fontSize;
  final bool isLoading;  // Set default to false
  final double? buttonWidth;
  final double? buttonHeight;
  final double? boarderRadius;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.text,
    this.action,  // Action can be optional when the button is disabled
    this.btnColor = AppColor.primary,
    this.txtColor = AppColor.white,
    this.enabled = true,
    this.primary = true,
    this.fontSize,
    this.isLoading = false,  // Default value for loading state
    this.buttonWidth,
    this.buttonHeight,
    this.boarderRadius = 10,
    this.icon = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled && !isLoading ? action : null,  // Disable action when not enabled or loading
      child: Container(
        height: buttonHeight ?? 48,
        width: buttonWidth ?? Get.width,
        decoration: primary == true
            ? BoxDecoration(
          color: enabled && !isLoading ? btnColor : AppColor.primary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(boarderRadius ?? Get.width),
        )
            : BoxDecoration(
          border: Border.all(color: btnColor),
          borderRadius: BorderRadius.circular(boarderRadius ?? Get.width),
        ),
        child: Center(
          child: isLoading == true
              ? const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 8,
                            strokeCap: StrokeCap.round,
                          ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  const SizedBox(width: 10,),
                  Text(
                              text.tr,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleX.buttonText(context).copyWith(
                  color: txtColor,
                  fontSize: fontSize ?? AppTextSizes.buttonText1(),
                              ),
                            ),
                ],
              ),
        ),
      ),
    );
  }
}
