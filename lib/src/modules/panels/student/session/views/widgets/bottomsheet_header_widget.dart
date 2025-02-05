import 'package:go7eight/src/core/app_export.dart';

class BottomsheetHeaderWidget extends StatelessWidget {
  final String title;

  const BottomsheetHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.black,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            height: 60,
            width: Get.width,
            alignment: Alignment.center,
            child: Text(
              title.tr,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleX.subHeading1(context).copyWith(
                fontSize: AppTextSizes.titleText5(),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                alignment: Alignment.centerRight,
                margin:
                    EdgeInsets.only(right: AppRatioSize.getRatioWidth() / 32),
                child: Icon(
                  Icons.close,
                  size: AppRatioSize.getRatioWidth() / 16,
                )),
          )
        ],
      ),
    );
  }
}
