import 'package:flutter/cupertino.dart';
import 'package:go7eight/src/core/app_export.dart';

class BottomsheetTimePickerWidget extends StatefulWidget {
  const BottomsheetTimePickerWidget({super.key});

  @override
  State<BottomsheetTimePickerWidget> createState() =>
      _BottomsheetTimePickerWidgetState();
}

class _BottomsheetTimePickerWidgetState
    extends State<BottomsheetTimePickerWidget> {
  final List<int> hrList = List.generate(12, (index) => index + 1);
  final List<int> minList = List.generate(60, (index) => index + 1);
  final List<String> atList = ["am", "pm"];
  final FixedExtentScrollController _timeHour =
      FixedExtentScrollController(initialItem: 10);
  final FixedExtentScrollController _timeMinute =
      FixedExtentScrollController(initialItem: 30);
  final FixedExtentScrollController _timeAt =
      FixedExtentScrollController(initialItem: 1);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppRatioSize.getRatioWidth() / 2.2,
        height: AppRatioSize.getRatioHeight() / 3,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.lightBlueGrey.withOpacity(0.15)
              : AppColor.lightBlueGrey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                _scrollPickerWidget(controller: _timeHour, itemList: hrList),
                _scrollPickerWidget(controller: _timeMinute, itemList: minList),
                _scrollPickerWidget(controller: _timeAt, itemList: atList)
              ],
            ),
            _scrollFocusLines()
          ],
        ),
      ),
    );
  }

  Widget _scrollPickerWidget(
      {required FixedExtentScrollController controller,
      required List itemList}) {
    return Flexible(
      child: ListWheelScrollView(
        controller: controller,
        itemExtent: 70,
        physics: const FixedExtentScrollPhysics(),
        useMagnifier: true,
        magnification: 1.1,
        diameterRatio: 1.5,
        squeeze: 1.5,
        perspective: 0.003,
        overAndUnderCenterOpacity: 0.4,
        scrollBehavior: const CupertinoScrollBehavior(),
        onSelectedItemChanged: (index) {
          setState(() {});
        },
        children: itemList.map((at) {
          return Center(
            child: Text.rich(
              style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.black
                      : AppColor.creamColor),
              TextSpan(
                children: [
                  TextSpan(text: "$at"),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _scrollFocusLines() {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.5,
            color: AppColor.primary,
          ),
          SizedBox(
            height: AppRatioSize.getRatioHeight() / 18,
          ),
          Container(
            height: 1.5,
            color: AppColor.primary,
          )
        ],
      ),
    );
  }
}
