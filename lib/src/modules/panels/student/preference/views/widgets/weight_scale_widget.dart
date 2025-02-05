import 'package:go7eight/src/core/app_export.dart';

class WeightScaleWidget extends StatefulWidget {
  final FixedExtentScrollController scaleController;
  final List<int> scaleIntList;
  final String scaleType;
  final void Function(int) onChange;

  const WeightScaleWidget(
      {super.key,
      required this.scaleController,
      required this.scaleIntList,
      required this.onChange,
      required this.scaleType});

  @override
  State<WeightScaleWidget> createState() => _WeightScaleWidgetState();
}

class _WeightScaleWidgetState extends State<WeightScaleWidget> {
  int selectedNum = 0;

  @override
  void initState() {
    selectedNum = widget.scaleController.initialItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppRatioSize.getRatioHeight() / 1.55,
      width: Get.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: Get.height / 3.6,
            child: Container(
              height: Get.height,
              width: Get.width * 1.2,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                borderRadius: BorderRadius.circular(Get.width * 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.grey.withOpacity(0.05),
                    spreadRadius: 12,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          RotatedBox(
            quarterTurns: -1,
            child: ListWheelScrollView(
              controller: widget.scaleController,
              itemExtent: 80,
              physics: const FixedExtentScrollPhysics(),
              useMagnifier: false,
              diameterRatio: 5,
              squeeze: 1.5,
              perspective: 0.0055,
              overAndUnderCenterOpacity: 0.4,
              offAxisFraction: 1.6,
              scrollBehavior: const MaterialScrollBehavior(),
              onSelectedItemChanged: (index) {
                setState(() {
                  widget.onChange(widget.scaleIntList[index]);
                  selectedNum = index;
                });
              },
              children: widget.scaleIntList.map((feet) {
                return RotatedBox(
                  quarterTurns: 1,
                  child: Center(
                      child: Container(
                    height: 24,
                    width: 4,
                    color: AppColor.grey,
                  )),
                );
              }).toList(),
            ),
          ),
          Container(
              width: AppRatioSize.getRatioWidth() / 10,
              height: AppRatioSize.getRatioHeight() / 5,
              margin: const EdgeInsets.only(top: 12),
              decoration: const BoxDecoration(),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text.rich(
                    style: TextStyleX.body2(context).copyWith(
                      fontSize: 20,
                    ),
                    TextSpan(
                      children: [
                        TextSpan(text: "$selectedNum"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(
                      AppIcon.pinIcon,
                      color: AppColor.primary,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              )),
          Positioned(
            top: Get.height / 2.6,
            child: Container(
              height: Get.height / 3.5,
              width: Get.height / 3.5,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.creamColor
                    : AppColor.black,
                borderRadius: BorderRadius.circular(Get.width * 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primary.withOpacity(0.15),
                    spreadRadius: 12,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Get.height / 2.2,
            child: Row(
              children: [
                Text(
                  "$selectedNum".tr,
                  textAlign: TextAlign.center,
                  style: TextStyleX.header2(context).copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.black
                          : AppColor.creamColor,
                      fontSize: AppTextSizes.titleText2()),
                ),
                Text(
                  " ${widget.scaleType}".tr,
                  textAlign: TextAlign.center,
                  style: TextStyleX.header2(context).copyWith(
                      color: AppColor.primary,
                      fontSize: AppTextSizes.titleText4()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
