

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/app_export.dart';

class BackShadow extends StatelessWidget{
  const BackShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          width: Get.width,
          height: Get.height/1.2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme
                    .of(context)
                    .brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                Theme
                    .of(context)
                    .brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                AppColor.white.withOpacity(0.0),
              ],
              begin: const FractionalOffset(0.0, 1.0),
              end: const FractionalOffset(0.0, 0.0),
              stops: const [0.0, 0.25,0.6],
            ),
          ),
        ),
      ],
    );
  }



}