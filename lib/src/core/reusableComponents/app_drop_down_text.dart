import '../app_export.dart';
import '../constants/colors.dart';
import '../constants/ratio_size.dart';
import 'app_container.dart';
import 'app_text_style.dart';

class AppDropDownTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final Color backgroundColor;
  final Color shadowColor;
  final Color inputColor;
  final bool showLabel;
  final String labelText;
  final double labelFontSize;
  final double boarderWeight;
  final Color? labelColor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final FontWeight fontWeight;
  final CrossAxisAlignment labelAlignment;
  final String hintText;
  final double hintFontSize;
  final Color hintColor;
  final FontWeight hintFontWeight;
  final bool showBoarder;
  final Color? boarderColor;
  final double boarderRadius;
  final double? boxWidth;
  final double? boxHeight;
  final double? shadowOpacity;
  final bool? obscureText;
  final bool showSuffixIcon;
  final IconData suffixIcon;
  final Widget? suffixWidget;
  final Function()? suffixAction;
  final String? suffixIconPath;
  final String? prefixIconPath;
  final bool showPrefixIcon;
  final int maxLine;
  final bool enabled;
  final bool? readOnly;
  final IconData prefixIcon;
  final Function()? prefixAction;
  final Function(String)? onSubmit;
  final Function()? onClick;
  final String? Function(String?)? validator;  // Validator for error messages

  const AppDropDownTextField({
    super.key,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.backgroundColor = AppColor.white,
    this.shadowColor = AppColor.white,
    this.inputColor = AppColor.black,
    this.showLabel = true,
    this.labelText = "Label",
    this.labelFontSize = 14,
    this.labelColor = AppColor.primary,
    this.prefixIconColor,
    this.suffixIconColor,
    this.fontWeight = FontWeight.w800,
    this.labelAlignment = CrossAxisAlignment.start,
    this.hintText = "Hint",
    this.hintFontSize = 14,
    this.hintColor = AppColor.grey,
    this.boarderColor = AppColor.primary,
    this.hintFontWeight = FontWeight.w400,
    this.boarderRadius = 10,
    this.boxWidth,
    this.maxLine = 1,
    this.boxHeight,
    this.obscureText,
    this.showSuffixIcon = false,
    this.suffixIcon = Icons.arrow_drop_down,  // Default drop-down icon
    this.suffixWidget,
    this.suffixAction,
    this.suffixIconPath,
    this.prefixIconPath,
    this.showPrefixIcon = false,
    this.enabled = true,
    this.showBoarder = false,
    this.prefixIcon = Icons.person,
    this.prefixAction,
    this.shadowOpacity = 0.1,
    this.onSubmit,
    this.boarderWeight = 0.5,
    this.validator,
    this.readOnly,
    this.onClick,  // Validator for error messages
  });

  @override
  _AppDropDownTextFieldState createState() => _AppDropDownTextFieldState();
}

class _AppDropDownTextFieldState extends State<AppDropDownTextField> {
  String? errorMessage;  // To hold the error message returned by the validator

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.labelAlignment,
      children: [
        // Label for the input field
        if (widget.showLabel)
          Container(
            width: widget.boxWidth,
            margin: const EdgeInsets.only(left: 4),
            child: Text(
              widget.labelText.tr,
              style: TextStyleX.subHeading4(context).copyWith(
                fontSize: widget.labelFontSize,
                fontWeight: widget.fontWeight,
                color: widget.labelColor,
              ),
            ),
          ),
        const SizedBox(height: 4),

        // TextFormField container
        AppContainerWidget(
          disableDefaultVPadding: true,
          disableDefaultHPadding: true,
          shadowOpacity: widget.shadowOpacity!,
          child: Material(
            color: widget.backgroundColor,
            elevation: 0,
            borderRadius: BorderRadius.circular(widget.boarderRadius),
            child: TextFormField(
              cursorColor: AppColor.primary,
              autofocus: false,
              onTap: widget.onClick,
              readOnly: widget.readOnly!,
              maxLines: widget.maxLine,
              style: TextStyleX.textFieldInput(context).copyWith(
                color: widget.enabled
                    ? Theme.of(context).brightness == Brightness.light
                    ? AppColor.blackShade
                    : AppColor.creamColor
                    : AppColor.grey,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText.tr,
                enabled: widget.enabled,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 32,
                  vertical: widget.boxHeight ?? 12,
                ),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.boarderRadius),
                  ),
                  borderSide: BorderSide(
                    color: widget.labelColor!,
                    width: widget.boarderWeight * 4 > 2
                        ? 2
                        : widget.boarderWeight * 4,
                  ),
                ),
                enabledBorder: widget.showBoarder
                    ? OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(widget.boarderRadius)),
                  borderSide: BorderSide(
                      color: widget.boarderColor!, width: widget.boarderWeight),
                )
                    : InputBorder.none,
                hintStyle: TextStyleX.textFieldHint(context).copyWith(
                  fontSize: widget.hintFontSize,
                  fontWeight: widget.hintFontWeight,
                  color: widget.hintColor,
                ),
                suffixIcon: widget.showSuffixIcon
                    ? suffixIconWidget()  // Show dropdown icon
                    : null,
                prefixIcon: widget.showPrefixIcon
                    ? prefixIconWidget()
                    : null,
              ),
              keyboardType: widget.textInputType,
              controller: widget.controller,
              obscureText: widget.obscureText ?? false,
              onFieldSubmitted: widget.onSubmit,
              validator: (value) {
                final error = widget.validator?.call(value);
                setState(() {
                  errorMessage = error;  // Set the error message
                });
                return null;  // Do not display error inside the field
              },
            ),
          ),
        ),

        // Display the error message below the text field
        if (errorMessage != null && errorMessage!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 4),
            child: Text(
              errorMessage!,
              style: TextStyle(
                fontSize: widget.labelFontSize / 1.02,
                fontWeight: FontWeight.w400,
                color: AppColor.red,
              ),
            ),
          ),
        const SizedBox(height: 4),
      ],
    );
  }

  // Helper function for suffix icon handling
  Widget? suffixIconWidget() {
    if (widget.suffixIconPath != null) {
      return Container(
        width: AppRatioSize.getRatioWidth() / 12,
        padding: EdgeInsets.all(AppRatioSize.getRatioWidth() / 32),
        child: Image.asset(widget.suffixIconPath!,
            fit: BoxFit.contain, color: widget.suffixIconColor ?? widget.labelColor),
      );
    }
    return Icon(
      widget.suffixIcon,  // Use arrow_drop_down icon for the dropdown
      color: widget.suffixIconColor ?? widget.labelColor,
    );
  }

  // Helper function for prefix icon handling
  Widget? prefixIconWidget() {
    if (widget.prefixIconPath != null) {
      return Container(
        width: AppRatioSize.getRatioWidth() / 12,
        padding: EdgeInsets.all(AppRatioSize.getRatioWidth() / 32),
        child: Image.asset(widget.prefixIconPath!,
            fit: BoxFit.contain, color: widget.prefixIconColor ?? widget.labelColor),
      );
    }
    return Icon(widget.prefixIcon,
        color: widget.prefixIconColor ?? widget.labelColor);
  }
}
