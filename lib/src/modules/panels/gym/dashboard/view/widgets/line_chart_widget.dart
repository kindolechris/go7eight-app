import 'package:fl_chart/fl_chart.dart';
import 'package:go7eight/src/core/app_export.dart';

import '../../controllers/gym_dashboard_controller.dart';

class LineChartGYM extends StatefulWidget {
  const LineChartGYM({super.key});

  @override
  State<LineChartGYM> createState() => _LineChartGYMState();
}

class _LineChartGYMState extends State<LineChartGYM> {
  final GYMDashboardController _controller = Get.find();
  List<Color> gradientColors = [
    AppColor.primary,
    AppColor.white,
  ];

  bool showAvg = false;

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "user_lbl".tr,
                  maxLines: 1,
                  style: TextStyleX.subHeading1(context).copyWith(
                    color: AppColor.black,
                  ),
                ),
                Obx(() {
                  return Container(
                    height: AppRatioSize.getRatioHeight() / 25,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.white
                          : AppColor.blackShade,
                    ),
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(12),
                      underline: Container(),
                      padding: EdgeInsets.zero,
                      style: TextStyleX.subHeading1(context).copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.blackShade
                            : AppColor.creamColor,
                        fontSize: AppTextSizes.headerText4(),
                      ),
                      dropdownColor:
                          Theme.of(context).brightness == Brightness.light
                              ? AppColor.white
                              : AppColor.blackShade,
                      value: "${_controller.lineChartFilterValue}",
                      items: <String>[
                        'Today',
                        'This week',
                        'This month',
                        'This year',
                        'Last year'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value.tr,
                            style: TextStyleX.subHeading3(context)
                                .copyWith(fontSize: AppTextSizes.headerText4()),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        
                        _controller.lineChartFilterValue.value = value!;
                        setState(() {
                          if (_controller.lineChartFilterValue.value ==
                              "This week") {
                            showAvg = true;
                          } else {
                            showAvg = false;
                          }
                        });
                      },
                    ),
                  );
                })
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.2,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 44, vertical: 8),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyleX.subHeading1(context).copyWith(
      fontWeight: FontWeight.w400,
      color: AppColor.grey,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('1', style: style);
        break;
      case 2:
        text = Text('3', style: style);
        break;
      case 3:
        text = Text('6', style: style);
        break;
      case 4:
        text = Text('9', style: style);
        break;
      case 5:
        text = Text('12', style: style);
        break;
      case 6:
        text = Text('15', style: style);
        break;
      case 7:
        text = Text('21', style: style);
        break;
      case 8:
        text = Text('24', style: style);
        break;
      case 9:
        text = Text('27', style: style);
        break;
      default:
        text = Text('18', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyleX.subHeading1(context).copyWith(
      fontWeight: FontWeight.w400,
      color: AppColor.grey,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '0';
        break;
      case 2:
        text = '100';
        break;
      case 3:
        text = '200';
        break;
      case 4:
        text = '300';
        break;
      case 5:
        text = '400';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColor.lightGrey,
            strokeWidth: 0,
          );
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(left: BorderSide(color: AppColor.lightGrey), bottom: BorderSide(color: AppColor.lightGrey)),),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 3),
            const FlSpot(1, 2.8),
            const FlSpot(2, 3.8),
            const FlSpot(2.2, 4),
            const FlSpot(2.5, 2),
            const FlSpot(2.7, 3),
            const FlSpot(2.9, 3.2),
            const FlSpot(3.2, 3.5),
            const FlSpot(3.4, 4.2),
            const FlSpot(3.8, 4.8),
            const FlSpot(4.9, 3),
            const FlSpot(6.8, 3.1),
            const FlSpot(8, 4),
            const FlSpot(9.5, 3),
            const FlSpot(11, 4),
          ],
          isCurved: false,
          color: AppColor.primary,
          barWidth: 0.5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.5))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColor.lightGrey,
            strokeWidth: 0,
          );
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
            left: BorderSide(color: AppColor.lightGrey),
            bottom: BorderSide(color: AppColor.lightGrey)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 3.44),
            const FlSpot(2.5, 2),
            const FlSpot(2.7, 3),
            const FlSpot(2.9, 3.2),
            const FlSpot(3.2, 3.5),
            const FlSpot(3.4, 4.2),
            const FlSpot(3.8, 4.8),
            const FlSpot(4.9, 3),
            const FlSpot(6.8, 3.1),
            const FlSpot(11, 3.44),
          ],
          isCurved: false,
          color: AppColor.primary,
          barWidth: 0.5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.5))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
