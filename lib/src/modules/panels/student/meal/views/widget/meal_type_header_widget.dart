import 'package:go7eight/src/core/app_export.dart';


class MealTypeHeaderWidget extends StatefulWidget {
  const MealTypeHeaderWidget({super.key});

  @override
  State<MealTypeHeaderWidget> createState() => _MealTypeHeaderWidgetState();
}

class _MealTypeHeaderWidgetState extends State<MealTypeHeaderWidget> {
  late Offset _initialOffset;

  @override
  void initState() {
    _initialOffset = Offset.zero;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "meals_title".tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading1(context)
                  .copyWith(fontSize: AppTextSizes.titleText5()),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "3".tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading1(context).copyWith(
                  color: AppColor.primary,
                  fontSize: AppTextSizes.titleText5()),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        GestureDetector(
          onTapDown: (TapDownDetails details) {
            final tapPosition = details.globalPosition;
            final x = tapPosition.dx;
            final y = tapPosition.dy;
            _initialOffset = Offset(x, y);
          },
          onTap: () async {
            await showMenu(
              context: context,
              shadowColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.lightGrey
                  : AppColor.grey,
              elevation: 4.0,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              position: RelativeRect.fromLTRB(_initialOffset.dx,
                  _initialOffset.dy, _initialOffset.dx, _initialOffset.dy),
              items: [
                PopupMenuItem(
                  value: 1,
                  onTap: () {},
                  child: Text(
                    "option_one_lbl".tr,
                    style: TextStyleX.subHeading2BlueGrey(context),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  onTap: () {},
                  child: Text(
                    "option_two_lbl".tr,
                    style: TextStyleX.subHeading2BlueGrey(context),
                  ),
                ),
              ],
            );
          },
          child: Icon(Icons.more_horiz_rounded,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.blackShade
                  : AppColor.primary),
        )
      ],
    );
  }
}
