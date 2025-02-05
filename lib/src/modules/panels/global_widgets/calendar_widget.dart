
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class Calendar extends StatefulWidget {
  final Widget? titleChild;

  const Calendar({super.key, this.titleChild});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();
  int currentDateSelectedIndex = 0;
  ScrollController scrollController = ScrollController();

  List<String> listOfMonths = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<String> listOfDays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.titleChild == null ? Container() : widget.titleChild!,
              Container(
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${selectedDate.day.toString()}, ${listOfMonths[selectedDate.month - 1]}, ${selectedDate.year.toString()}",
                    style: TextStyleX.subHeading3(context),
                  )),
            ],
          ),
          const SizedBox(height: 4),
          Container(
              height: 80,
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 6);
                },
                itemCount: 365,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentDateSelectedIndex = index;
                    selectedDate =
                        DateTime.now().add(Duration(days: index));
                  });
                },
                child: Container(
                  width: 58,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColor.primary),
                      color: currentDateSelectedIndex == index
                          ? AppColor.primary
                          : Theme.of(context).brightness == Brightness.light
                              ? AppColor.primary.withOpacity(0.1)
                              : AppColor.primary.withOpacity(0.3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        listOfDays[DateTime.now()
                                    .add(Duration(days: index))
                                    .weekday -
                                1]
                            .toString(),
                        style: TextStyleX.subHeading2BlueGrey(context)
                            .copyWith(
                                color: currentDateSelectedIndex == index
                                    ? AppColor.white
                                    : Theme.of(context).brightness ==
                                            Brightness.light
                                        ? AppColor.grey
                                        : AppColor.grey,
                                fontSize: AppTextSizes.headerText3()),
                      ),
                      currentDateSelectedIndex == index
                          ? CircleAvatar(
                              backgroundColor: AppColor.white,
                              radius: AppRatioSize.getRatioWidth() / 26,
                              child: Text(
                                DateTime.now()
                                    .add(Duration(days: index))
                                    .day
                                    .toString(),
                                style: TextStyleX.subHeading1(context)
                                    .copyWith(
                                        color:
                                            Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? AppColor.primary
                                                : AppColor.primary,
                                        fontSize:
                                            AppTextSizes.headerText1()),
                              ),
                            )
                          : Text(
                              DateTime.now()
                                  .add(Duration(days: index))
                                  .day
                                  .toString(),
                              style: TextStyleX.subHeading1(context)
                                  .copyWith(
                                      color: currentDateSelectedIndex ==
                                              index
                                          ? AppColor.white
                                          : Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? AppColor.darkGrey
                                              : AppColor.grey,
                                      fontSize: AppTextSizes.headerText1()),
                            ),
                      Text(
                        listOfMonths[DateTime.now()
                                    .add(Duration(days: index))
                                    .month -
                                1]
                            .toString()
                            .substring(0, 3),
                        style: TextStyleX.subHeading1(context).copyWith(
                            color: currentDateSelectedIndex == index
                                ? AppColor.white
                                : Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.grey
                                    : AppColor.grey,
                            fontSize: AppTextSizes.headerText4()),
                      ),
                    ],
                  ),
                ),
              );
                },
              )),
        ],
      ),
    ));
  }
}
