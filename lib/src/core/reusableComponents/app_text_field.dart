import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_export.dart';
import '../constants/colors.dart';
import '../constants/ratio_size.dart';
import 'app_container.dart';
import 'app_text_style.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
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
  final bool? showHintFormat;
  final bool showSuffixIcon;
  final IconData suffixIcon;
  final Widget? suffixWidget;
  final Function()? suffixAction;
  final String? suffixIconPath;
  final String? prefixIconPath;
  final String? hintFormatText;
  final bool showPrefixIcon;
  final int maxLine;
  final bool enabled;
  final IconData prefixIcon;
  final Function()? prefixAction;
  final Function(String)? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;  // Validator for error messages

  const AppTextField({
    super.key,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
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
    this.suffixIcon = Icons.person,
    this.suffixWidget,
    this.suffixAction,
    this.suffixIconPath,
    this.prefixIconPath,
    this.showPrefixIcon = false,
    this.enabled = true,
    this.showHintFormat = false,
    this.showBoarder = false,
    this.prefixIcon = Icons.person,
    this.prefixAction,
    this.shadowOpacity = 0.1,
    this.onSubmit,
    this.boarderWeight = 0.5,
    this.validator,
    this.inputFormatters,
    this.hintFormatText,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
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
              maxLines: widget.maxLine,
              textCapitalization: widget.textCapitalization!,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              inputFormatters: widget.inputFormatters,
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
                border: InputBorder.none,
                contentPadding:  EdgeInsets.symmetric(
                    horizontal: AppRatioSize.getRatioWidth() / 32,
                    vertical: widget.boxHeight ?? 12),
                errorStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 0,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.boarderRadius)),
                    borderSide: BorderSide(color: widget.labelColor!, width: widget.boarderWeight*4>2?2: widget.boarderWeight*4)),
                enabledBorder: widget.showBoarder?OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.boarderRadius)),
                    borderSide: BorderSide(color: widget.boarderColor!, width: widget.boarderWeight)):InputBorder.none,

                disabledBorder: widget.showBoarder?OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.boarderRadius)),
                    borderSide: BorderSide(color: widget.boarderColor!, width: widget.boarderWeight)):InputBorder.none,
                hintStyle: TextStyleX.textFieldHint(context).copyWith(
                  fontSize: widget.hintFontSize,
                  fontWeight: widget.hintFontWeight,
                  color: widget.hintColor,
                ),
                  suffixIcon: widget.showSuffixIcon == true
                      ? widget.suffixWidget!=null?Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.suffixWidget!,
                    ],
                  ):GestureDetector(
                    onTap: widget.suffixAction,
                    child: widget.suffixIconPath == null
                        ? Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness ==
                              Brightness.light
                              ? AppColor.primary.withOpacity(0.1)
                              : AppColor.primary.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(
                        widget.suffixIcon,
                        color: widget.obscureText == false
                            ? widget.labelColor
                            : Theme.of(context).brightness ==
                            Brightness.light
                            ? widget.hintColor.withOpacity(0.4)
                            : AppColor.creamColor,
                      ),
                    )
                        : Container(
                      width: AppRatioSize.getRatioWidth() / 12,
                      padding: EdgeInsets.all(
                          AppRatioSize.getRatioWidth() / 32),
                      child: Image.asset(
                        widget.suffixIconPath!,
                        fit: BoxFit.contain,
                        color: widget.obscureText == true
                            ? widget.labelColor
                            : widget.hintColor,
                      ),
                    ),
                  )
                      : null,
                  prefixIcon: widget.showPrefixIcon == true
                      ? GestureDetector(
                    onTap: widget.prefixAction,
                    child: widget.prefixIconPath == null
                        ? Icon(
                      widget.prefixIcon,
                      color: widget.prefixIconColor ?? widget.labelColor,
                    )
                        : Container(
                      width: AppRatioSize.getRatioWidth() / 12,
                      padding: EdgeInsets.all(
                          AppRatioSize.getRatioWidth() / 32),
                      child: Image.asset(
                        widget.prefixIconPath!,
                        fit: BoxFit.contain,
                        color: widget.prefixIconColor ?? widget.labelColor,
                      ),
                    ),
                  )
                      : null),
              keyboardType: widget.textInputType,
              controller: widget.controller,
              obscureText: widget.obscureText ?? false,
              onFieldSubmitted: widget.onSubmit,
              validator: (value) {
                  final error = widget.validator?.call(value);
                  setState(() {
                    errorMessage = error;  // Set the error message
                  });
                  return error;  // Do not display error inside the field
              },
            ),
          ),
        ),
        Visibility(
          visible: widget.showHintFormat!,
          child: Padding(
            padding: const EdgeInsets.only(left: 4, top: 4),
            child: Text(
              widget.hintFormatText ?? "",
              style: TextStyle(
                letterSpacing: 1.5,
                fontSize: widget.labelFontSize / 1.02,
                fontWeight: FontWeight.w400,
                color: AppColor.grey,
              ),
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
    return Icon(widget.suffixIcon,
        color: widget.suffixIconColor ?? widget.labelColor);
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