import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:go7eight/src/core/app_export.dart';

class AppFullScreenDialog extends StatelessWidget {
  final String? message;
  final Color? barrierColor;
  final Widget? customLoadingWidget;
  final bool showMessage;
  final TextStyle? messageStyle;

  const AppFullScreenDialog({
    Key? key,
    this.message,
    this.barrierColor,
    this.customLoadingWidget,
    this.showMessage = true,
    this.messageStyle,
  }) : super(key: key);

  // Static method to easily show the loader
  static Future<void> show(
      BuildContext context, {
        String? message,
        Color? barrierColor,
        Widget? customLoadingWidget,
        bool showMessage = true,
        TextStyle? messageStyle,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (_) => AppFullScreenDialog(
        message: message,
        barrierColor: barrierColor,
        customLoadingWidget: customLoadingWidget,
        showMessage: showMessage,
        messageStyle: messageStyle,
      ),
    );
  }

  // Static method to hide the loader
  static void hide(BuildContext context) {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: () async => false, // Prevent back button from dismissing
        child: SizedBox.expand( // Ensures the widget takes up all available space
          child: Stack(
            fit: StackFit.expand, // Makes the stack fill all available space
            children: [
              // Enhanced blurred background
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: barrierColor ?? Colors.white.withOpacity(0.65),
                  ),
                ),
              ),
              // Loading content with frosted glass effect
              SafeArea(
                child: Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            customLoadingWidget ?? const _DefaultLoadingIndicator(),
                            if (showMessage && message != null) ...[
                              const SizedBox(height: 16),
                              Text(
                                message!,
                                style: messageStyle ??
                                    const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Default loading indicator with animation
class _DefaultLoadingIndicator extends StatelessWidget {
  const _DefaultLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
      ),
    );
  }
}