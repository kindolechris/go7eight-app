import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_color.dart';
import '../config/app_size.dart';
import '../helpers/theme_helper.dart';

class SizeQuantityDialog extends StatefulWidget {
  const SizeQuantityDialog({super.key});

  @override
  State<SizeQuantityDialog> createState() => _SizeQuantityDialogState();
}

class _SizeQuantityDialogState extends State<SizeQuantityDialog> {
  String selectedSize = 'S';
  int quantity = 0;

  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Text(
                'Scroll up or down to select size',
                style:  TextStyle(
                  fontSize: AppSize.appSize14,
                  fontWeight: FontWeight.bold,
                  color: themedColor(Get.context!, (c) => c.secondaryColor),
                ),
              ),
              const SizedBox(height: AppSize.appSize20),

              // Size and Qty Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Size dropdown
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Size',
                          style:  TextStyle(
                            fontSize: AppSize.appSize14,
                            fontWeight: FontWeight.bold,
                            color: themedColor(Get.context!, (c) => c.text2Color),
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: selectedSize,
                          dropdownColor: Colors.black,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                          ),
                          style:  TextStyle(
                            fontSize: AppSize.appSize14,
                            fontWeight: FontWeight.bold,
                            color: themedColor(Get.context!, (c) => c.text2Color),
                          ),
                          items: sizes
                              .map((size) => DropdownMenuItem(
                                    value: size,
                                    child: Text(size),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedSize = value;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSize.appSize24),

                  // Quantity
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Qnty',
                            style: TextStyle(color: themedColor(Get.context!, (c) => c.text2Color))),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              icon:  Icon(Icons.remove,
                                  color: themedColor(Get.context!, (c) => c.text2Color)),
                              onPressed: () {
                                setState(() {
                                  quantity = (quantity > 0) ? quantity - 1 : 0;
                                });
                              },
                            ),
                            Text(
                              quantity.toString().padLeft(2, '0'),
                              style:  TextStyle(
                                fontSize: AppSize.appSize16,
                                fontWeight: FontWeight.bold,
                                color: themedColor(Get.context!, (c) => c.text2Color),
                              ),
                            ),
                            IconButton(
                              icon:  Icon(Icons.add,
                                  color: themedColor(Get.context!, (c) => c.text2Color)),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSize.appSize24),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel',
                        style: TextStyle(color: AppColor.supportColor)),
                  ),
                  const SizedBox(width: AppSize.appSize20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.supportColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.appSize25, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // return values if needed
                    },
                    child:  Text(
                      'Add',
                      style:  TextStyle(
                        fontSize: AppSize.appSize14,
                        fontWeight: FontWeight.bold,
                        color: themedColor(Get.context!, (c) => c.secondaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
