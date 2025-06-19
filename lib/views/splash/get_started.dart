import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import '../../config/app_size.dart';
import '../../config/app_string.dart';
import '../../helpers/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../../widget/app_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: SafeArea(
        child: Stack(
          children: [
            // Bottom wave decoration
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bottom_wave.png',
                width: AppSize.appSize400,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.appSize20, vertical: AppSize.appSize30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.appSize40),
                   Text(
                    '"Welcome!',
                    style:  TextStyle(
                        fontSize: AppSize.appSize18,
                        fontWeight: FontWeight.bold,
                        color: themedColor(Get.context!, (c) => c.secondaryColor),
                        decoration: TextDecoration.underline),
                  ),
                  const SizedBox(height: AppSize.appSize40),
                  const Text(
                    'Here, every seller is',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GradientText(
                        style: const TextStyle(
                          fontSize: AppSize.appSize48,
                          fontWeight: FontWeight.bold,
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.pink,
                            Colors.purple,
                          ],
                        ),
                        text: 'verified.',
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/icons/verified_badge.png', // verified icon
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Every order is',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  GradientText(
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.pink,
                        Colors.purple,
                      ],
                    ),
                    text: 'protected.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            // Bottom "Next" button
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.getStarted2);
                    },
                    text: AppString.buttonTextNext,
                    backgroundColor: AppColor.supportColor,
                    margin: const EdgeInsets.only(top: AppSize.appSize32),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      blendMode: BlendMode.srcIn,
      child: Text(text, style: style),
    );
  }
}
