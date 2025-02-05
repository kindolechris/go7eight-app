import 'package:flutter/material.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const AppDatePicker({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  _AppDatePickerState createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? _selectedDate;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 4.0),
          child: Text(
            "Date of Birth",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            setState(() {
              _isFocused = true;
            });
            await _pickDate();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _isFocused ? AppColor.primary : Colors.grey.shade300,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                      : "Select your date",
                  style: TextStyle(
                    fontSize: 16,
                    color: _selectedDate != null
                        ? Colors.black
                        : Colors.grey.shade400,
                  ),
                ),
                const Icon(
                  Icons.calendar_today,
                  color: AppColor.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.primary, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColor.primary, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    setState(() {
      if (pickedDate != null) {
        _selectedDate = pickedDate;
        widget.onDateSelected(pickedDate);
      }
      _isFocused = false; // Reset focus after date selection
    });
  }
}
