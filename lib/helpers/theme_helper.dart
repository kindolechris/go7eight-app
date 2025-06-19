import 'package:flutter/material.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';

Color themedColor(
    BuildContext context, Color Function(AppColorScheme) selector) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return selector(isDark ? AppColor.dark : AppColor.light);
}
