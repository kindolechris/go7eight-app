// Create a custom ReactiveAppBar that implements PreferredSizeWidget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go7eight/src/modules/panels/student/home/controllers/home_controller.dart';
import 'package:go7eight/src/modules/panels/student/home/views/widget/home_app_bar.dart';

class ReactiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController controller;
  final double appBarHeight;

  const ReactiveAppBar({
    required this.controller,
    this.appBarHeight = kToolbarHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Calculate if we should hide the app bar
      final bool shouldHide = controller.appBarOffset.value <= -appBarHeight * 0.6;

      return Container(
        height: shouldHide ? 0 : appBarHeight,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(0, controller.appBarOffset.value, 0),
          child: Opacity(
            opacity: (1 + controller.appBarOffset.value / appBarHeight).clamp(0.0, 1.0),
            child: HomeAppBar(),
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(
    // Dynamically calculate preferred size based on appBarOffset
      controller.appBarOffset.value <= -appBarHeight * 0.6 ? 0 : appBarHeight
  );
}
