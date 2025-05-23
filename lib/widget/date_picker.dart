import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/theme_helper.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime tempPickedDate;

  @override
  void initState() {
    super.initState();
    tempPickedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color:themedColor(Get.context!, (c) => c.backgroundColor),
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
              initialDateTime: tempPickedDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  tempPickedDate = newDate;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  widget.onDateSelected(tempPickedDate);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'SET',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
