import 'package:fl_chart/fl_chart.dart';
import 'package:go7eight/src/core/app_export.dart';

class BarChartGYM extends StatefulWidget {
  const BarChartGYM({super.key});
  final Color leftBarColor = AppColor.primary;
  final Color rightBarColor = AppColor.primary;
  final Color avgColor = AppColor.primary;
  @override
  State<StatefulWidget> createState() => BarChartGYMState();
}

class BarChartGYMState extends State<BarChartGYM> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 11, 5);
    final barGroup4 = makeGroupData(3, 15, 16);
    final barGroup5 = makeGroupData(4, 16, 6);
    final barGroup6 = makeGroupData(5, 13, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.blackShade.withOpacity(0.15)
                : AppColor.white.withOpacity(0.05),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.primary.withOpacity(0.15)
                  : AppColor.primary.withOpacity(0.55),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 44, vertical: 8),
            child: Text(
              "total_earning_lbl".tr,
              maxLines: 1,
              style: TextStyleX.subHeading1(context).copyWith(
                color: AppColor.black,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              padding: EdgeInsets.only(left: AppRatioSize.getRatioWidth() / 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        maxY: 22,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            //tooltipBgColor: Colors.grey,
                            getTooltipItem: (a, b, c, d) => null,
                          ),
                          touchCallback: (FlTouchEvent event, response) {
                            if (response == null || response.spot == null) {
                              setState(() {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              });
                              return;
                            }

                            touchedGroupIndex =
                                response.spot!.touchedBarGroupIndex;

                            setState(() {
                              if (!event.isInterestedForInteractions) {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                                return;
                              }
                              showingBarGroups = List.of(rawBarGroups);
                              if (touchedGroupIndex != -1) {
                                var sum = 0.0;
                                for (final rod
                                    in showingBarGroups[touchedGroupIndex]
                                        .barRods) {
                                  sum += rod.toY;
                                }
                                final avg = sum /
                                    showingBarGroups[touchedGroupIndex]
                                        .barRods
                                        .length;

                                showingBarGroups[touchedGroupIndex] =
                                    showingBarGroups[touchedGroupIndex]
                                        .copyWith(
                                  barRods: showingBarGroups[touchedGroupIndex]
                                      .barRods
                                      .map((rod) {
                                    return rod.copyWith(
                                        toY: avg, color: widget.avgColor);
                                  }).toList(),
                                );
                              }
                            });
                          },
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: bottomTitles,
                              reservedSize: 42,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              interval: 1,
                              getTitlesWidget: leftTitles,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: AppColor.lightGrey)),
                        barGroups: showingBarGroups,
                        gridData: const FlGridData(show: false),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final style = TextStyleX.subHeading1(context).copyWith(
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0 ';
    } else if (value == 4) {
      text = '100 ';
    } else if (value == 8) {
      text = '200 ';
    } else if (value == 12) {
      text = '300 ';
    } else if (value == 16) {
      text = '400 ';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      '1',
      '3',
      '6',
      '9',
      '12',
      '18',
      '21',
      '24',
      '27',
      '30'
    ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }
}
