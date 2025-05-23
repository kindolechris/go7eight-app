import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_color.dart';
import '../../../../config/app_font.dart';
import '../../../../config/app_size.dart';
import '../../../../helpers/theme_helper.dart';
import 'payment_methods.dart';

class ExpansionTileGroup extends StatefulWidget {
  const ExpansionTileGroup({super.key});

  @override
  State<ExpansionTileGroup> createState() => _ExpansionTileGroupState();
}

class _ExpansionTileGroupState extends State<ExpansionTileGroup> {
  int? openTileIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Delivery Options
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: const PageStorageKey('delivery'),
            onExpansionChanged: (expanded) {
              setState(() {
                openTileIndex = expanded ? 0 : null;
              });
            },
            initiallyExpanded: openTileIndex == 0,
            collapsedIconColor: themedColor(Get.context!, (c) => c.text2Color),
            iconColor: Colors.white,
            title:  Text(
              'Delivery Options',
              style: TextStyle(
                fontSize: AppSize.appSize14,
                fontWeight: FontWeight.w600,
                fontFamily: AppFont.appFontSemiBold,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              ),
            ),
            children: [
              // your delivery content here...
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Delivery content...',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSize.appSize28),

        // Payment Methods
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: const PageStorageKey('payment'),
            onExpansionChanged: (expanded) {
              setState(() {
                openTileIndex = expanded ? 1 : null;
              });
            },
            initiallyExpanded: openTileIndex == 1,
            collapsedIconColor: themedColor(Get.context!, (c) => c.text2Color),
            iconColor: Colors.white,
            title:  Text(
              'Payment Methods',
              style: TextStyle(
                fontSize: AppSize.appSize14,
                fontWeight: FontWeight.w600,
                fontFamily: AppFont.appFontSemiBold,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              ),
            ),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: PaymentSelectionWidget(),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSize.appSize28),

        // Guarantees
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: const PageStorageKey('warranty'),
            onExpansionChanged: (expanded) {
              setState(() {
                openTileIndex = expanded ? 2 : null;
              });
            },
            initiallyExpanded: openTileIndex == 2,
            collapsedIconColor: themedColor(Get.context!, (c) => c.text2Color),
            iconColor: Colors.white,
            title:  Text(
              'Guarantees, Returns  Warranties',
              style: TextStyle(
                fontSize: AppSize.appSize14,
                fontWeight: FontWeight.w600,
                fontFamily: AppFont.appFontSemiBold,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: Column(
                  children: const [
                    Text(
                      'Warranty content...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
