import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';

import '../../../../config/app_size.dart';
import '../../../../helpers/theme_helper.dart';
import '../../../../routes/app_routes.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                'Rate Your Checkout Experience!',
                style: TextStyle(
                  fontSize: AppSize.appSize24,
                  fontWeight: FontWeight.bold,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
              ),
              const SizedBox(height: AppSize.appSize40),

              // Check Icon
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.supportColor,
                  border: Border.all(color: Colors.white10, width: 4),
                ),
                child: const Icon(
                  Icons.check,
                  size: 48,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 24),
              Text(
                'Your Order was Created successful',
                style: TextStyle(
                  fontSize: AppSize.appSize16,
                  fontWeight: FontWeight.bold,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your Order# is GO78-250421-Q3ZB5K use it to follow-up or track your order anytime',
                style: TextStyle(
                  fontSize: AppSize.appSize14,
                  fontWeight: FontWeight.bold,
                  color: themedColor(Get.context!, (c) => c.text2Color),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.appSize24),
              Text(
                'Thank you for shopping with us, we are here to make sure you continue shopping online safely and more secure than ever before',
                style: TextStyle(
                  fontSize: AppSize.appSize13,
                  color: themedColor(Get.context!, (c) => c.text2Color),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSize.appSize36),

              // Receipt Options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.download, color: AppColor.supportColor),
                      SizedBox(height: 4),
                      Text(
                        'Download receipt',
                        style: TextStyle(
                          fontSize: AppSize.appSize13,
                          fontWeight: FontWeight.bold,
                          color: themedColor(Get.context!, (c) => c.text2Color),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share, color: AppColor.supportColor),
                      SizedBox(height: 4),
                      Text(
                        'Share receipt',
                        style: TextStyle(
                          fontSize: AppSize.appSize13,
                          fontWeight: FontWeight.bold,
                          color: themedColor(Get.context!, (c) => c.text2Color),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              // Done Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Get.offAllNamed(AppRoutes.buyerHomeView);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.supportColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: AppSize.appSize14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSize.appSize12),
            ],
          ),
        ),
      ),
    );
  }
}
