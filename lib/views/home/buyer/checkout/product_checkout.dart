import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:prime_social_media_flutter_ui_kit/routes/app_routes.dart';

import '../../../../config/app_color.dart';
import '../../../../config/app_font.dart';
import '../../../../config/app_size.dart';
import '../../../../helpers/theme_helper.dart';
import '../../../../widget/quantity_dialog.dart';
import '../../../../widget/warrant_card.dart';
import 'payment_methods.dart';

class ProductCheckoutPage extends StatefulWidget {
  const ProductCheckoutPage({super.key});

  @override
  State<ProductCheckoutPage> createState() => _ProductCheckoutPageState();
}

class _ProductCheckoutPageState extends State<ProductCheckoutPage> {
  bool isPickAtSeller = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              backgroundColor:
                  themedColor(Get.context!, (c) => c.backgroundColor),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/post1.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: SafeArea(
                        child: BackButton(
                          color: themedColor(
                              Get.context!, (c) => c.secondaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Men T-shirt',
                          style: TextStyle(
                            fontSize: AppSize.appSize24,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFont.appFontSemiBold,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'TZS',
                            style: TextStyle(
                              fontSize: AppSize.appSize24,
                              color: themedColor(
                                  Get.context!, (c) => c.secondaryColor),
                              decoration: TextDecoration
                                  .underline, // underline only "TZS"
                            ),
                            children: [
                              const TextSpan(
                                text: ' ',
                              ),
                              TextSpan(
                                text: '33,000',
                                style: TextStyle(
                                  fontSize: AppSize.appSize24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppFont.appFontSemiBold,
                                  color: themedColor(
                                      Get.context!, (c) => c.secondaryColor),
                                  decoration:
                                      TextDecoration.none, // no underline
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.appSize20),
                    RichText(
                      text: TextSpan(
                          text:
                              'Description Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                              'Lorem Ipsum has been the industry\'s standard dum ',
                          style: TextStyle(
                            fontSize: AppSize.appSize12,
                            color:
                                themedColor(Get.context!, (c) => c.text2Color),
                          ),
                          children: [
                            TextSpan(
                              text: 'See more',
                              style: TextStyle(
                                  fontSize: AppSize.appSize12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppFont.appFontSemiBold,
                                  color: themedColor(
                                      Get.context!, (c) => c.text2Color),
                                  decoration: TextDecoration.underline),
                            ),
                          ]),
                    ),
                    const SizedBox(height: AppSize.appSize24),
                    Padding(
                      padding: const EdgeInsets.only(right: AppSize.appSize10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Attachments:',
                              style: TextStyle(
                                fontSize: AppSize.appSize13,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.appFontSemiBold,
                                color: themedColor(
                                    Get.context!, (c) => c.text2Color),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Product specifications',
                                  style: TextStyle(
                                    fontSize: AppSize.appSize13,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppFont.appFontSemiBold,
                                    color: themedColor(
                                        Get.context!, (c) => c.text2Color),
                                  ),
                                ),
                                Image.asset('assets/images/file.png',
                                    width: 20, height: 20),
                              ],
                            ),
                          ]),
                    ),
                    const SizedBox(height: AppSize.appSize24),
                    ExpansionTile(
                      collapsedIconColor:
                          themedColor(Get.context!, (c) => c.text2Color),
                      iconColor:
                          themedColor(Get.context!, (c) => c.secondaryColor),
                      title: Text(
                        'Select color and Size',
                        style: TextStyle(
                          fontSize: AppSize.appSize14,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFont.appFontSemiBold,
                          color: themedColor(
                              Get.context!, (c) => c.secondaryColor),
                        ),
                      ),
                      children: [
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4, // or use dynamic count
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const SizeQuantityDialog(),
                                  );
                                },
                                child: Container(
                                  width: 100,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: themedColor(
                                        Get.context!, (c) => c.borderColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/images/tshirt.png', // change this path
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        index == 2
                                            ? 'item is OS'
                                            : 'TZS ${33000 + index * 2000}',
                                        style: TextStyle(
                                          color: themedColor(Get.context!,
                                              (c) => c.secondaryColor),
                                          fontSize: AppSize.appSize12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.appSize24),
                    Container(
                      decoration: BoxDecoration(
                        color: themedColor(
                            Get.context!, (c) => c.cardBackgroundColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Summary',
                            style: TextStyle(
                                color: themedColor(
                                    Get.context!, (c) => c.secondaryColor),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          _SummaryRow(label: 'Total items', value: '(1)'),
                          _SummaryRow(label: 'Total price', value: '33,000'),
                          _SummaryRow(
                              label: 'Shipping fees, CF', value: '0.00'),
                          _SummaryRow(label: 'Delivery charges', value: '0.00'),
                          _SummaryRow(label: 'Discount', value: '0.00'),
                          Divider(
                            color:
                                themedColor(Get.context!, (c) => c.lineColor),
                          ),
                          _SummaryRow(
                              label: 'GRAND TOTAL',
                              value: 'TZS 33,000.00',
                              bold: true),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.appSize28),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor:
                            themedColor(Get.context!, (c) => c.lineColor),
                      ),
                      child: ExpansionTile(
                        collapsedIconColor:
                            themedColor(Get.context!, (c) => c.text2Color),
                        iconColor:
                            themedColor(Get.context!, (c) => c.secondaryColor),
                        title: Text(
                          'Delivery Options',
                          style: TextStyle(
                            fontSize: AppSize.appSize14,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFont.appFontSemiBold,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: StatefulBuilder(
                              builder: (context, setState) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => setState(
                                              () => isPickAtSeller = true),
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: isPickAtSeller
                                                  ? Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? const Color(0xFF4A0E23)
                                                      : themedColor(
                                                          Get.context!,
                                                          (c) => c.chatColor)
                                                  : themedColor(Get.context!,
                                                      (c) => c.backgroundColor),
                                              border: Border.all(
                                                color: themedColor(Get.context!,
                                                    (c) => c.borderColor),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pick at Seller's Location",
                                                  style: TextStyle(
                                                    fontSize: AppSize.appSize14,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        AppFont.appFontSemiBold,
                                                    color: themedColor(
                                                        Get.context!,
                                                        (c) =>
                                                            c.secondaryColor),
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Seller has multiple locations, tap to pick one that is easily accessible to you',
                                                  style: TextStyle(
                                                    fontSize: AppSize.appSize12,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        AppFont.appFontSemiBold,
                                                    color: themedColor(
                                                        Get.context!,
                                                        (c) => c.text2Color),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => setState(
                                              () => isPickAtSeller = false),
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: !isPickAtSeller
                                                  ? Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? const Color(0xFF4A0E23)
                                                      : themedColor(
                                                          Get.context!,
                                                          (c) => c.chatColor)
                                                  : themedColor(Get.context!,
                                                      (c) => c.backgroundColor),
                                              border: Border.all(
                                                color: themedColor(Get.context!,
                                                    (c) => c.borderColor),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Deliver to my Location",
                                                  style: TextStyle(
                                                    fontSize: AppSize.appSize14,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        AppFont.appFontSemiBold,
                                                    color: themedColor(
                                                        Get.context!,
                                                        (c) =>
                                                            c.secondaryColor),
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'You have the option to use your current location or other location, click to choose',
                                                  style: TextStyle(
                                                    fontSize: AppSize.appSize12,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        AppFont.appFontSemiBold,
                                                    color: themedColor(
                                                        Get.context!,
                                                        (c) => c.text2Color),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSize.appSize20),
                                  Text(
                                    isPickAtSeller
                                        ? 'Estimate delivery time has multiple locations, tap to pick one that is easily accessible to you'
                                        : 'Delivery will be made to your selected address or current location',
                                    style: TextStyle(
                                      fontSize: AppSize.appSize14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppFont.appFontSemiBold,
                                      color: themedColor(
                                          Get.context!, (c) => c.text2Color),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.appSize28),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor:
                            themedColor(Get.context!, (c) => c.backgroundColor),
                      ),
                      child: ExpansionTile(
                        collapsedIconColor:
                            themedColor(Get.context!, (c) => c.text2Color),
                        iconColor:
                            themedColor(Get.context!, (c) => c.secondaryColor),
                        title: Text(
                          'Payment Methods',
                          style: TextStyle(
                            fontSize: AppSize.appSize14,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFont.appFontSemiBold,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          ),
                        ),
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0),
                            child: PaymentSelectionWidget(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.appSize28),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor:
                            themedColor(Get.context!, (c) => c.backgroundColor),
                      ),
                      child: ExpansionTile(
                        collapsedIconColor:
                            themedColor(Get.context!, (c) => c.text2Color),
                        iconColor:
                            themedColor(Get.context!, (c) => c.secondaryColor),
                        title: Text(
                          'Guarantees, Returns  Warranties',
                          style: TextStyle(
                            fontSize: AppSize.appSize14,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFont.appFontSemiBold,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Column(
                              children: [
                                WarrantyCard(
                                  title: '100% Money Back',
                                  description:
                                      'Go7eight guarantees 100% money back incase you won’t receive the item you paid for.',
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF4A0E23)
                                      : themedColor(
                                          Get.context!, (c) => c.chatColor),
                                ),
                                const SizedBox(height: 8),
                                WarrantyCard(
                                  title: 'Official Warranty',
                                  description:
                                      '1 year manufacturer warranty with authorized service center',
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Color(0xFF183059)
                                      : themedColor(
                                          Get.context!, (c) => c.chatColor),
                                  // Blue card background
                                ),
                                const SizedBox(height: 8),
                                WarrantyCard(
                                  title: 'Return Policy',
                                  description:
                                      '3 days easy return policy if product is defective or damaged.',
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF4A0E23)
                                      : themedColor(
                                          Get.context!, (c) => c.chatColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.appSize28),
                    RichText(
                      text: TextSpan(
                          text:
                              'Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dum ',
                          style: TextStyle(
                            fontSize: AppSize.appSize12,
                            color:
                                themedColor(Get.context!, (c) => c.text2Color),
                          ),
                          children: [
                            TextSpan(
                              text: 'Read full specifications',
                              style: TextStyle(
                                  fontSize: AppSize.appSize12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppFont.appFontSemiBold,
                                  color: themedColor(
                                      Get.context!, (c) => c.text2Color),
                                  decoration: TextDecoration.underline),
                            ),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color.fromRGBO(74, 14, 35, 1)
                                      : themedColor(
                                          Get.context!, (c) => c.chatColor),

                                  // deep maroon background
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Icon(Icons.message,
                                    color: themedColor(
                                        Get.context!, (c) => c.secondaryColor),
                                    size: AppSize.appSize30),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF4A0E23)
                                      : themedColor(
                                          Get.context!, (c) => c.chatColor),

                                  // same maroon
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Icon(Icons.shopping_cart,
                                    color: themedColor(
                                        Get.context!, (c) => c.secondaryColor),
                                    size: AppSize.appSize30),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.supportColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Get.toNamed(AppRoutes.orderConfirmation);
                                },
                                child: Text(
                                  'Confirm & Pay',
                                  style: TextStyle(
                                    fontSize: AppSize.appSize14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFont.appFontBold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Or',
                            style: TextStyle(
                              fontSize: AppSize.appSize14,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFont.appFontSemiBold,
                              color: themedColor(
                                  Get.context!, (c) => c.text2Color),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See Similar Items',
                              style: TextStyle(
                                fontSize: AppSize.appSize14,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFont.appFontSemiBold,
                                color: themedColor(
                                    Get.context!, (c) => c.secondaryColor),
                                decoration: TextDecoration.underline,
                                decorationColor: themedColor(
                                    Get.context!, (c) => c.secondaryColor),
                                decorationThickness: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper widget for order summary rows
class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: AppSize.appSize14,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontFamily: AppFont.appFontSemiBold,
              color: themedColor(Get.context!, (c) => c.text2Color),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: AppSize.appSize14,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontFamily: AppFont.appFontSemiBold,
              color: themedColor(Get.context!, (c) => c.text2Color),
            ),
          ),
        ],
      ),
    );
  }
}
