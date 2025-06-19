import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_color.dart';
import '../config/app_font.dart';
import '../config/app_size.dart';
import '../helpers/theme_helper.dart';

class DropDownListSelect extends StatefulWidget {
  final String label;
  final List<String> options;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const DropDownListSelect({
    super.key,
    required this.label,
    required this.options,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<DropDownListSelect> createState() => _DropDownListSelectState();
}

class _DropDownListSelectState extends State<DropDownListSelect> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ??
        (widget.options.isNotEmpty ? widget.options.first : null);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.7,
              builder: (_, controller) => Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon:
                          const Icon(Icons.close, color: AppColor.supportColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      itemCount: widget.options.length,
                      itemBuilder: (_, index) {
                        final item = widget.options[index];
                        return ListTile(
                          title: Text(item,
                              style: TextStyle(
                                fontFamily: AppFont.appFontRegular,
                                fontSize: AppSize.appSize14,
                                color: themedColor(
                                    Get.context!, (c) => c.secondaryColor),
                              )),
                          onTap: () => Navigator.pop(context, item),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );

        if (result != null) {
          setState(() {
            selectedValue = result;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(result);
          }
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          readOnly: true,
          controller: TextEditingController(text: selectedValue),
          decoration: InputDecoration(
            labelText: '${widget.label}',
            labelStyle: TextStyle(
                fontSize: AppSize.appSize14,
                fontFamily: AppFont.appFontRegular,
                color: themedColor(Get.context!, (c) => c.secondaryColor)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: themedColor(Get.context!, (c) => c.chatColor),
          ),
        ),
      ),
    );
  }
}
