import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStatusBar extends StatelessWidget {
  final Color? systemNavigationBarColor;
  final Brightness? systemNavigationBarIconBrightness;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Brightness? statusBarBrightness;
  final Widget child;
  const AppStatusBar({Key? key, this.systemNavigationBarColor, this.statusBarColor, required this.child, this.systemNavigationBarIconBrightness, this.statusBarIconBrightness, this.statusBarBrightness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value :  SystemUiOverlayStyle(
          systemNavigationBarColor: systemNavigationBarColor,
          systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
          statusBarIconBrightness: statusBarIconBrightness,
          statusBarBrightness: statusBarBrightness,
          statusBarColor: statusBarColor
      ),
      // value: SystemUiOverlayStyle.dark,
      // value: SystemUiOverlayStyle(
      // systemNavigationBarColor: systemNavigationBarColor,
      // systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
      // statusBarColor: statusBarColor,
      // statusBarIconBrightness: statusBarIconBrightness,
      // statusBarBrightness: statusBarBrightness,
      // ),
      child: child,
    );
  }
}
