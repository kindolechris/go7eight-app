import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';

import '../../../config/app_font.dart';
import '../../../config/app_icon.dart';
import '../../../helpers/theme_helper.dart';
import '../../../routes/app_routes.dart';
import '../../../widget/dropdown.dart';

class UpdateBusinessInfo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themedColor(Get.context!, (c) => c.chatColor),
        title: Text('Update Business Info',
            style: TextStyle(
              fontFamily: AppFont.appFontRegular,
              fontSize: AppSize.appSize16,
              color: themedColor(Get.context!, (c) => c.secondaryColor),
            )),
        leading: Padding(
          padding: const EdgeInsets.only(left: AppSize.appSize20),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(AppIcon.back,
                width: AppSize.appSize20,
                color: themedColor(Get.context!, (c) => c.secondaryColor)),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Businesses of tomorrow are built on trust, and genuine community Go7eight helps with exactly that complete this transaction, please enter the 6-digit code phone naumber ending in +2557 ***. 517.\nTo complete this transaction,',
              style: TextStyle(
                  fontSize: AppSize.appSize14,
                  fontFamily: AppFont.appFontRegular,
                  color: themedColor(Get.context!, (c) => c.text2Color)),
            ),
            const Divider(height: AppSize.appSize32),

            // Part I
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Part I: Business/Org information",
                style: TextStyle(
                    fontSize: AppSize.appSize16,
                    fontFamily: AppFont.appFontRegular,
                    color: themedColor(Get.context!, (c) => c.secondaryColor)),
              ),
              children: [
                SizedBox(height: AppSize.appSize8),
                DropDownListSelect(
                  label: 'Select Businbess Type*',
                  options: businessTypes,
                  initialValue: '1. Creator/Influencer',
                  onChanged: (selected) {
                    print("Selected type: $selected");
                  },
                ),
                SizedBox(height: AppSize.appSize8),
                _buildTextField(
                  "National ID*",
                  isObscured: true,
                  suffixIcon: Icons.camera_alt_outlined,
                  onSuffixTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      print("Picked image path: ${image.path}");
                      // TODO: Store or display the image
                    }
                  },
                ),
                SizedBox(height: AppSize.appSize8),
                _buildTextField("Enter Business/Trading Name*",
                    initial: "Ante Meridian Limited"),
                SizedBox(height: AppSize.appSize12),
                DropDownListSelect(
                  label: 'Select Business Activities',
                  options: businessActivities,
                  initialValue: 'I Sell Product only',
                  onChanged: (selected) {
                    print("Selected type: $selected");
                  },
                ),
                SizedBox(height: AppSize.appSize8),
                _buildTextField(
                  "Briefly Describe your Business for your Customers",
                  initial:
                      "We are selling digital products like software and more .....",
                  maxLines: 4,
                ),
                SizedBox(height: AppSize.appSize8),
              ],
            ),

            const Divider(height: AppSize.appSize32),

            // Part II
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Part II: Tax information",
                style: TextStyle(
                    fontSize: AppSize.appSize16,
                    fontFamily: AppFont.appFontRegular,
                    color: themedColor(Get.context!, (c) => c.secondaryColor)),
              ),
              children: [
                _buildTextField(
                  "Business Registration Number",
                  suffixIcon: Icons.picture_as_pdf,
                  onSuffixTap: () => pickPdf("Business Registration Number"),
                ),
                SizedBox(height: AppSize.appSize8),
                _buildTextField(
                  "Tax Identification Number (TIN)",
                  suffixIcon: Icons.picture_as_pdf,
                  onSuffixTap: () => pickPdf("Tax Identification Number (TIN)"),
                ),
                SizedBox(height: AppSize.appSize8),
                _buildTextField(
                  "VAT Registration Number",
                  suffixIcon: Icons.picture_as_pdf,
                  onSuffixTap: () => pickPdf("VAT Registration Number"),
                ),
                SizedBox(height: AppSize.appSize8),
              ],
            ),

            const Divider(height: 32),

            // Part III
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Part III: Operational information",
                style: TextStyle(
                    fontSize: AppSize.appSize16,
                    fontFamily: AppFont.appFontRegular,
                    color: themedColor(Get.context!, (c) => c.secondaryColor)),
              ),
              children: [
                _buildTextField("Main Office Address (Delivery Address 1)",
                    initial: "9th floor Tan house building, Victoria..."),
                _buildTextField("Branch/Distributor 1", initial: "xxx xxx xxx"),
                _buildTextField("Add Branch/Distributor 2",
                    initial: "xxx xxx xxx"),
              ],
            ),

            const Divider(height: AppSize.appSize32),

            // Part IV
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Part IV: Attachments",
                style: TextStyle(
                    fontSize: AppSize.appSize16,
                    fontFamily: AppFont.appFontRegular,
                    color: themedColor(Get.context!, (c) => c.secondaryColor)),
              ),
              children: [
                _buildAttachmentItem("National ID"),
                _buildAttachmentItem("Business Registration Certificate"),
                _buildAttachmentItem("Tax Identification Certificate"),
              ],
            ),

            const SizedBox(height: AppSize.appSize24),
            Center(
              child: Text.rich(
                TextSpan(
                  text:
                      'Simply dummy text of the printing and typsetting industry\'s standard dum ',
                  style: TextStyle(
                      fontSize: AppSize.appSize13,
                      fontFamily: AppFont.appFontRegular,
                      color: themedColor(Get.context!, (c) => c.text2Color)),
                  children: [
                    TextSpan(
                      text: 'Read full specification',
                      style: TextStyle(
                          fontSize: AppSize.appSize13,
                          fontFamily: AppFont.appFontRegular,
                          color: themedColor(
                              Get.context!, (c) => c.secondaryColor),
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppSize.appSize16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF4A0E23)
                              : themedColor(Get.context!, (c) => c.chatColor),
                    ),
                    onPressed: () {},
                    child: Text("Save",
                        style: TextStyle(
                          fontSize: AppSize.appSize13,
                          fontFamily: AppFont.appFontRegular,
                          color: themedColor(
                              Get.context!, (c) => c.secondaryColor),
                        )),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.supportColor,
                    ),
                    onPressed: () {
                      _verificationConfirmationBottomSheet(context);
                    },
                    child: Text("Confirm & Submit",
                        style: TextStyle(
                          fontSize: AppSize.appSize13,
                          fontFamily: AppFont.appFontRegular,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    bool isObscured = false,
    String? initial,
    IconData? suffixIcon,
    VoidCallback? onSuffixTap,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: isObscured,
        initialValue: initial,
        maxLines: maxLines,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: AppSize.appSize14,
              fontFamily: AppFont.appFontRegular,
              color: themedColor(Get.context!, (c) => c.text1Color),
            ),
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onSuffixTap,
                    child: Icon(suffixIcon,
                        color:
                            themedColor(Get.context!, (c) => c.secondaryColor)),
                  )
                : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: themedColor(Get.context!, (c) => c.backgroundColor)),
      ),
    );
  }

  Widget _buildAttachmentItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontSize: AppSize.appSize14,
            fontFamily: AppFont.appFontRegular,
            color: themedColor(Get.context!, (c) => c.text2Color)),
      ),
      trailing: const Icon(Icons.close, color: Colors.redAccent),
    );
  }

  Future<void> pickPdf(String label) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      print("Picked PDF for $label: ${result.files.single.path}");
      // TODO: Store file path if needed
    }
  }

  final List<String> businessTypes = [
    '1. Creator/Influencer',
    '2. Startup',
    '3. Small Enterprise',
    '4. Medium Enterprise',
    '5. Large Enterprise',
    '6. Public Company',
    '7. Government/Agency/Dept',
    '8. Nonprofit (NGO)',
    '9. International Organization',
    '10. Academic & Research Institution',
    '11. Development Program/Project',
    '12. Social Enterprise',
    '13. Religious Institution',
    '14. Others',
  ];

  final List<String> businessActivities = [
    'I Sell Product Only',
    'I Sell Service Only',
    'I Sell Product & Service',
  ];

  void _verificationConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: themedColor(Get.context!, (c) => c.cardBackgroundColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirmation',
                style: TextStyle(
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                    fontSize: AppSize.appSize15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.appSize16),
              Text(
                'By clickin Confirm & Submit, you agree that all submitted information is true and accurate.',
                style: TextStyle(
                    color: themedColor(Get.context!, (c) => c.secondaryColor),
                    fontFamily: AppFont.appFontRegular,
                    fontSize: AppSize.appSize13),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: AppSize.appSize16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themedColor(
                            Get.context!, (c) => c.cardBackgroundColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        // Get.toNamed(AppRoutes.loginView);
                      },
                      child: const Text('Deny',
                          style: TextStyle(color: AppColor.supportColor)),
                    ),
                  ),
                  const SizedBox(width: AppSize.appSize12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.supportColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.offAllNamed(AppRoutes.sellerHomeView);
                      },
                      child:
                          Text('Allow', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
