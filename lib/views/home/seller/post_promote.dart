import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_color.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_font.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_image.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_size.dart';
import '../../../helpers/theme_helper.dart';
import '../../../widget/app_button.dart';
import '../buyer/checkout/payment_methods.dart';

class PromotePostPage extends StatefulWidget {
  const PromotePostPage({super.key});

  @override
  State<PromotePostPage> createState() => _PromotePostPageState();
}

class _PromotePostPageState extends State<PromotePostPage> {
  int ageStart = 19;
  int ageEnd = 56;
  double dailyBudget = 89;
  bool isScheduled = false;
  DateTime? startDate;
  DateTime? endDate;
  int selectedObjective = 0;
  int selectedBudgetType = 0;
  int selectedGender = 0;

  final List<String> locations = ['Dar es Salaam', 'Nairobi'];
  final List<String> interests = ['Fashion', 'Sustainable clothing'];
  final List<bool> _isExpanded = [true, true, true, true, true];

  final TextEditingController locationController = TextEditingController();
  final TextEditingController interestController = TextEditingController();

  Future<void> pickDate(bool isStart) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔷 Image and overlay
            Stack(
              children: [
                Image.asset(AppImage.post1,
                    width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white70),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Text('Follow',
                            style: TextStyle(color: Colors.white70)),
                        const SizedBox(width: 4),
                        Image.asset('assets/icons/verified_badge.png', height: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔷 Title and price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Men T-shirt',
                          style: TextStyle(
                              color:
                                  themedColor(Get.context!,(c) => c.secondaryColor),
                              fontFamily: AppFont.appFontBold,
                              fontSize: 18)),
                      Text('TZS 33,000',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppFont.appFontBold,
                              color:
                                  themedColor(Get.context!,(c) => c.text2Color))),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Description Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
                    style: TextStyle(
                        color: themedColor(Get.context!,(c) => c.text2Color)),
                  ),
                  const SizedBox(height: 12),

                  // 🔷 Expansion panels
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() => _isExpanded[index] = !isExpanded);
                    },
                    expandedHeaderPadding: EdgeInsets.zero,
                    elevation: 2,
                    children: [
                      // ✅ Campaign Objective
                      ExpansionPanel(
                        isExpanded: _isExpanded[0],
                        canTapOnHeader: true,
                        headerBuilder: (_, __) => ListTile(
                          leading: const Icon(Icons.check_circle,
                              color: Colors.green),
                          title: const Text('Campaign Objective*'),
                        ),
                        body: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Select the main goal for your campaign...',
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  buildObjectiveBox('Brand Awareness', 0),
                                  const SizedBox(width: 10),
                                  buildObjectiveBox('Checkouts', 1),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ✅ Target Audience
                      ExpansionPanel(
                        isExpanded: _isExpanded[1],
                        canTapOnHeader: true,
                        headerBuilder: (_, __) => ListTile(
                          leading: const Icon(Icons.check_circle,
                              color: Colors.green),
                          title: const Text('Define your target audience'),
                        ),
                        body: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: locationController,
                                decoration: InputDecoration(
                                  labelText: 'Add country, city or region',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      if (locationController.text.isNotEmpty) {
                                        setState(() {
                                          locations.add(
                                              locationController.text.trim());
                                          locationController.clear();
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Wrap(
                                spacing: 8,
                                children: locations
                                    .map((e) => Chip(label: Text(e)))
                                    .toList(),
                              ),
                              const SizedBox(height: 10),
                              const Text('Age Range'),
                              RangeSlider(
                                values: RangeValues(
                                    ageStart.toDouble(), ageEnd.toDouble()),
                                min: 10,
                                max: 70,
                                onChanged: (v) {
                                  setState(() {
                                    ageStart = v.start.toInt();
                                    ageEnd = v.end.toInt();
                                  });
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text('$ageStart'), Text('$ageEnd')],
                              ),
                              const SizedBox(height: 10),
                              const Text('Gender'),
                              Row(
                                children: [
                                  buildGenderButton('All', 0),
                                  buildGenderButton('Men', 1),
                                  buildGenderButton('Women', 2),
                                ],
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: interestController,
                                decoration: InputDecoration(
                                  labelText: 'E.g. Fashion, sneakers...',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      if (interestController.text.isNotEmpty) {
                                        setState(() {
                                          interests.add(
                                              interestController.text.trim());
                                          interestController.clear();
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Wrap(
                                spacing: 8,
                                children: interests
                                    .map((e) => Chip(label: Text(e)))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // 🔴 Budget Type
                      ExpansionPanel(
                        isExpanded: _isExpanded[2],
                        canTapOnHeader: true,
                        headerBuilder: (_, __) => ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 12,
                            child: Text('1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                          title: const Text('Budget Type*'),
                        ),
                        body: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  buildBudgetTypeBox('Daily Budget', 0),
                                  const SizedBox(width: 10),
                                  buildBudgetTypeBox('Lifetime Budget', 1),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Text('Daily Budget Amount'),
                                  const Spacer(),
                                  Text('\$${dailyBudget.toStringAsFixed(0)}'),
                                ],
                              ),
                              Slider(
                                value: dailyBudget,
                                min: 5,
                                max: 100,
                                divisions: 20,
                                onChanged: (v) =>
                                    setState(() => dailyBudget = v),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // 🔘 Schedule
                      ExpansionPanel(
                        isExpanded: _isExpanded[3],
                        canTapOnHeader: true,
                        headerBuilder: (_, __) => ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: AppColor.primaryColor,
                            radius: 12,
                            child: Text('5',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                          title: const Text('Schedule'),
                          trailing: Switch(
                            value: isScheduled,
                            onChanged: (val) =>
                                setState(() => isScheduled = val),
                          ),
                        ),
                        body: isScheduled
                            ? Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () => pickDate(true),
                                        child: Text(startDate == null
                                            ? 'Pick a date'
                                            : startDate
                                                .toString()
                                                .split(' ')[0]),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () => pickDate(false),
                                        child: Text(endDate == null
                                            ? 'Pick a date'
                                            : endDate.toString().split(' ')[0]),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ),

                      // 💰 Bill Summary
                      ExpansionPanel(
                        isExpanded: _isExpanded[4],
                        canTapOnHeader: true,
                        headerBuilder: (_, __) => const ListTile(
                          title: Text('Bill Summary'),
                        ),
                        body: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Daily Budget:'),
                                  Text('\$${dailyBudget.toStringAsFixed(0)}'),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Total Days:'),
                                  Text('30'),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("You'll pay",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total'),
                                  Text(
                                      '\$${(dailyBudget * 30).toStringAsFixed(0)}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  PaymentSelectionWidget(),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: const Text('Gift card/Voucher/Promocode'),
                    ),
                  ),

                  AppButton(
                    onPressed: () {},
                    text: "Pay & Submit for Approval",
                    backgroundColor: AppColor.supportColor,
                    margin: const EdgeInsets.only(top: AppSize.appSize32),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: AppColor.supportColor,
                  //     minimumSize: const Size.fromHeight(50),
                  //   ),
                  //   child: const Text('Pay & Submit for Approval'),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildObjectiveBox(String title, int index) => Expanded(
        child: GestureDetector(
          onTap: () => setState(() => selectedObjective = index),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: selectedObjective == index
                  ? AppColor.primaryColor
                  : themedColor(Get.context!,(c) => c.borderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(title,
                style: TextStyle(
                  color: themedColor(Get.context!,(c) => c.secondaryColor),
                ),
                textAlign: TextAlign.center),
          ),
        ),
      );

  Widget buildBudgetTypeBox(String title, int index) => Expanded(
        child: GestureDetector(
          onTap: () => setState(() => selectedBudgetType = index),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: selectedBudgetType == index
                  ? AppColor.primaryColor
                  : themedColor(Get.context!,(c) => c.borderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(title,
                style: TextStyle(
                  color: themedColor(Get.context!,(c) => c.secondaryColor),
                ),
                textAlign: TextAlign.center),
          ),
        ),
      );

  Widget buildGenderButton(String label, int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ChoiceChip(
          label: Text(label),
          selected: selectedGender == index,
          onSelected: (val) => setState(() => selectedGender = index),
          labelStyle: TextStyle(
            color: themedColor(Get.context!,(c) => c.secondaryColor),
          ),
          selectedColor: AppColor.primaryColor,
          backgroundColor: themedColor(Get.context!,(c) => c.borderColor),
        ),
      );
}
