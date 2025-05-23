import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/routes/app_routes.dart';

import '../../../config/app_color.dart';
import '../../../config/app_font.dart';
import '../../../config/app_size.dart';
import '../../../helpers/theme_helper.dart';
import '../../../widget/dropdown.dart';

class PhysicalProductCheckoutPage extends StatefulWidget {
  const PhysicalProductCheckoutPage({super.key});

  @override
  State<PhysicalProductCheckoutPage> createState() =>
      _PhysicalProductCheckoutPageState();
}

class _PhysicalProductCheckoutPageState
    extends State<PhysicalProductCheckoutPage> {
  List<bool> _isExpanded = [true, true, true, true, true, true, true];
  bool allowMultivariant = true;
  bool allowPickup = false;
  bool allowDelivery = false;

  final TextEditingController brandController =
      TextEditingController(text: 'OMEGA');

  final TextEditingController xlController = TextEditingController(text: '456');

  final TextEditingController xxlController = TextEditingController(text: '50');
  final TextEditingController xlPriceController =
      TextEditingController(text: '33,000.00');
  final TextEditingController xxlPriceController =
      TextEditingController(text: '37,000.00');

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController(
    text:
        'Men tshirt, good for all weather, all colors available, #men #tshirts #daressalaam',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
        elevation: 0,
        title: Text(
          'Post Checkout Form',
          style: TextStyle(
            fontFamily: AppFont.appFontRegular,
            fontSize: AppSize.appSize16,
            color: themedColor(Get.context!, (c) => c.secondaryColor),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themedColor(Get.context!, (c) => c.secondaryColor),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Sell tangible items like clothes, gadgets, food, or crafts. Add photos, set price, manage stock, and choose delivery options',
                style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.text2Color),
                ),
              ),
              const SizedBox(height: 16),
              ExpansionPanelList(
                elevation: 1,
                expandedHeaderPadding: EdgeInsets.zero,
                expansionCallback: (index, isOpen) {
                  setState(() => _isExpanded[index] = !isOpen);
                },
                children: [
                  // ✅ Basic Info
                  ExpansionPanel(
                    isExpanded: _isExpanded[0],
                    canTapOnHeader: true,
                    headerBuilder: (_, __) => const ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text('Basic Info*'),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          // Row 1: Content Subtype & Niche
                          DropDownListSelect(
                            label: 'Select Content Sub Type*',
                            options: productCategories,
                            initialValue: 'Apparel & Accessories',
                            onChanged: (selected) {
                              print("Selected type: $selected");
                            },
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(
                                child: DropDownListSelect(
                                  label: 'Niche*',
                                  options: nicheOptions,
                                  initialValue: 'Clothing',
                                  onChanged: (selected) {
                                    print("Selected type: $selected");
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: DropDownListSelect(
                                  label: 'Country of Origin*',
                                  options: countryOptions,
                                  initialValue: 'China',
                                  onChanged: (selected) {
                                    print("Selected type: $selected");
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Row 2: Brand Name & Country

// Full-width title input
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  'Brand Name*',
                                  controller: brandController,
                                ),
                              ),
                              const SizedBox(width: AppSize.appSize10),
                              Expanded(
                                child: _buildTextField('Give it a title/Name*',
                                    hintText: 'Eg Men T-shirt',
                                    controller: titleController),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

// Full-width description input
                          _buildTextField(
                            'Edit Post Caption/Description',
                            controller: descriptionController,
                            maxLines: 4,
                          ),

                          const SizedBox(height: 10),
                          _buildFileAttachment(),
                        ],
                      ),
                    ),
                  ),

                  // ✅ Allow Multivariant Items
                  ExpansionPanel(
                    isExpanded: _isExpanded[1],
                    canTapOnHeader: true, // disables default icon interaction
                    headerBuilder: (_, __) => InkWell(
                      onTap: () =>
                          setState(() => _isExpanded[1] = !_isExpanded[1]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Allow Multivariant Items',
                              style: TextStyle(
                                fontFamily: AppFont.appFontRegular,
                                fontSize: AppSize.appSize16,
                                color: themedColor(
                                    Get.context!, (c) => c.secondaryColor),
                              ),
                            ),
                            Switch(
                              value: allowMultivariant,
                              onChanged: (val) {
                                setState(() {
                                  allowMultivariant = val;
                                  if (!val) _isExpanded[1] = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    body: allowMultivariant
                        ? Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Colors',
                                    style: TextStyle(
                                        color: themedColor(Get.context!,
                                            (c) => c.secondaryColor))),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  children: [
                                    _buildColorOption(AppColor.primaryColor),
                                    _buildColorOption(AppColor.supportColor),
                                    _buildColorOption(Colors.grey),
                                    _buildColorOption(Colors.black),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text('Size Available',
                                    style: TextStyle(
                                        color: themedColor(Get.context!,
                                            (c) => c.secondaryColor))),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 10,
                                  children: ['S', 'M', 'L', 'XL', 'XXL']
                                      .map((s) => _buildChip(s))
                                      .toList(),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),

                  // ✅ Unit Pricing
                  ExpansionPanel(
                    isExpanded: _isExpanded[2],
                    canTapOnHeader: true,
                    headerBuilder: (_, __) => ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text('Unit Pricing',
                          style: TextStyle(
                            fontFamily: AppFont.appFontRegular,
                            fontSize: AppSize.appSize16,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          )),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          _buildItemPriceRow(
                              '1. Grey T-shirt (L)', xlPriceController),
                          const SizedBox(height: 10),
                          _buildItemPriceRow(
                              '2. Grey T-shirt (XXL)', xxlPriceController),
                          const SizedBox(height: 12),
                          Text(
                            'Go7eight automatically picks the item with the lowest price to show to customers.',
                            style: TextStyle(
                              color: themedColor(
                                  Get.context!, (c) => c.text2Color),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ✅ Inventory Counter
                  ExpansionPanel(
                    isExpanded: _isExpanded[3],
                    canTapOnHeader: true,
                    headerBuilder: (_, __) => ListTile(
                      leading:
                          Icon(Icons.inventory_2_outlined, color: Colors.green),
                      title: Text('Inventory Counter',
                          style: TextStyle(
                            fontFamily: AppFont.appFontRegular,
                            fontSize: AppSize.appSize16,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          )),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          _buildItemCountRow(
                              '1. Grey T-shirt (L)', xlController),
                          const SizedBox(height: 10),
                          _buildItemCountRow(
                              '2. Grey T-shirt (XXL)', xxlController),
                          const SizedBox(height: 8),
                          Text(
                            'Allow Go7eight to notify you when your stock runs out.',
                            style: TextStyle(
                              fontFamily: AppFont.appFontRegular,
                              color: themedColor(
                                  Get.context!, (c) => c.text2Color),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ✅ Pickup Location
                  ExpansionPanel(
                    isExpanded: _isExpanded[4],
                    canTapOnHeader: true,
                    headerBuilder: (_, __) => SwitchListTile(
                      value: allowPickup,
                      onChanged: (val) => setState(() => allowPickup = val),
                      title: Text('Allow Pickup at Sellers Location',
                          style: TextStyle(
                            fontFamily: AppFont.appFontRegular,
                            fontSize: AppSize.appSize14,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          )),
                    ),
                    body: allowPickup
                        ? Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                _buildItemPriceRow2(
                                    '1. Pickup location', '3 hours'),
                                _buildItemPriceRow2(
                                    '2. More locations/Distributors', '...'),
                                const SizedBox(height: 6),
                                Text(
                                  'Pickup at seller location is free. You can also offer cash on delivery.',
                                  style: TextStyle(
                                    color: themedColor(
                                        Get.context!, (c) => c.text2Color),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),

                  // ✅ Delivery to Customers
                  ExpansionPanel(
                    isExpanded: _isExpanded[5],
                    canTapOnHeader: true,
                    headerBuilder: (_, __) => SwitchListTile(
                      value: allowDelivery,
                      onChanged: (val) => setState(() => allowDelivery = val),
                      title: Text('Offer Delivery to Customers',
                          style: TextStyle(
                            fontFamily: AppFont.appFontRegular,
                            fontSize: AppSize.appSize14,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          )),
                    ),
                    body: allowDelivery
                        ? Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                _buildItemPriceRow2('Same Region', 'Eg: 1 day'),
                                _buildItemPriceRow2(
                                    'National wide', 'Eg: 3-5 days'),
                                _buildItemPriceRow2(
                                    'International', 'Eg: 30-45 days'),
                                const SizedBox(height: 6),
                                Text(
                                  'Whether local, national, or international — delivery fees must be defined.',
                                  style: TextStyle(
                                    fontFamily: AppFont.appFontRegular,
                                    fontSize: AppSize.appSize14,
                                    color: themedColor(
                                        Get.context!, (c) => c.text2Color),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),

                  // 🔴 Guarantees
                  ExpansionPanel(
                    isExpanded: _isExpanded[6],
                    canTapOnHeader: true,
                    headerBuilder: (_, __) => ListTile(
                      leading: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Text('4',
                            style: TextStyle(
                              fontSize: 12,
                              color: themedColor(
                                  Get.context!, (c) => c.secondaryColor),
                            )),
                      ),
                      title: Text('Guarantees, Returns & Warranties',
                          style: TextStyle(
                            fontFamily: AppFont.appFontRegular,
                            fontSize: AppSize.appSize14,
                            color: themedColor(
                                Get.context!, (c) => c.secondaryColor),
                          )),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoCard(
                            '100% Money Back',
                            'Go7eight guarantees 100% money back incase you won\'t receive the item you paid for.',
                            background:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF440015)
                                    : themedColor(
                                        Get.context!, (c) => c.borderColor),
                          ),
                          const SizedBox(height: 10),
                          _buildInfoCard(
                            'Official Warranty',
                            '1 year manufacturer warranty with authorized service center',
                            background:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF0C2233)
                                    : themedColor(
                                        Get.context!, (c) => c.borderColor),
                          ),
                          const SizedBox(height: 10),
                          _buildInfoCard(
                            'Return Policy',
                            '3 days easy return policy if product is defective or damaged.',
                            background:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white70
                                    : themedColor(
                                        Get.context!, (c) => c.borderColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColor.supportColor),
                      ),
                      child: const Text('Save as Draft',
                          style: TextStyle(color: AppColor.supportColor)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.productCheckout);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.supportColor,
                      ),
                      child: const Text('Preview Listing',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
      {TextEditingController? controller, String? hintText, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: themedColor(Get.context!,(c) => c.secondaryColor))),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: TextStyle(
            fontFamily: AppFont.appFontRegular,
            fontSize: AppSize.appSize14,
            color: themedColor(Get.context!, (c) => c.text2Color),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: themedColor(Get.context!, (c) => c.backgroundColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildInput(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
              fontFamily: AppFont.appFontRegular,
              fontSize: AppSize.appSize14,
              color: themedColor(Get.context!, (c) => c.secondaryColor),
            )),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: themedColor(Get.context!, (c) => c.backgroundColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(value,
              style: TextStyle(
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              )),
        ),
      ],
    );
  }

  Widget _buildFileAttachment() {
    return Row(
      children: const [
        Icon(Icons.attach_file, color: Colors.orange),
        SizedBox(width: 6),
        Text('Attachment', style: TextStyle(color: Colors.orange)),
      ],
    );
  }

  Widget _buildColorOption(Color color) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: color,
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      labelStyle: TextStyle(
        color: themedColor(Get.context!, (c) => c.secondaryColor),
      ),
    );
  }

  Widget _buildItemPriceRow(String label, var priceController) {
    return Row(
      children: [
        Expanded(
            child: Text(label,
                style: TextStyle(
                  fontFamily: AppFont.appFontRegular,
                  fontSize: AppSize.appSize14,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ))),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontFamily: AppFont.appFontRegular,
                fontSize: AppSize.appSize14,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              )),
        ),
      ],
    );
  }

  Widget _buildItemPriceRow2(String label, String price) {
    return Row(
      children: [
        Expanded(
            child: Text(label,
                style: TextStyle(
                  fontFamily: AppFont.appFontRegular,
                  fontSize: AppSize.appSize14,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ))),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: themedColor(Get.context!, (c) => c.backgroundColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(price,
                style: TextStyle(
                  fontFamily: AppFont.appFontRegular,
                  fontSize: AppSize.appSize14,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                )),
          ),
        ),
      ],
    );
  }

  Widget _buildItemCountRow(String item, var countController) {
    return Row(
      children: [
        Expanded(
            child: Text(item,
                style: TextStyle(
                  fontFamily: AppFont.appFontRegular,
                  fontSize: AppSize.appSize14,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ))),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
              controller: countController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontFamily: AppFont.appFontRegular,
                fontSize: AppSize.appSize14,
                color: themedColor(Get.context!, (c) => c.secondaryColor),
              )),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, String description, {Color? background}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:
            background ?? themedColor(Get.context!, (c) => c.backgroundColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
          const SizedBox(height: 4),
          Text(description,
              style: TextStyle(
                  color: themedColor(Get.context!, (c) => c.text2Color),
                  fontSize: 13)),
        ],
      ),
    );
  }

  final List<String> productCategories = [
    'Apparel & Accessories',
    'Footwear',
    'Consumer Electronics',
    'Fast food',
    'Agriculture products',
    'Furniture',
    'Home & Garden',
    'Beauty & Personal Care',
    'Health & Medical',
    'Machinery',
    'Vehicle Parts & Accessories',
    'Office & Stationaries',
    'Cars & Automobiles',
    'Others',
  ];

  final List<String> nicheOptions = [
    'Clothing',
    'Footwear',
    'Accessories',
  ];

  final List<String> countryOptions = [
    'Tanzania',
    'Kenya',
    'Nigeria',
    'South Africa',
    'China',
  ];
}
