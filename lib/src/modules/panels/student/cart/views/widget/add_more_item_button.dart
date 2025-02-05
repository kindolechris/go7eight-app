import 'package:go7eight/src/core/app_export.dart';

class AddMoreItemTextButton extends StatelessWidget {
  final void Function() action;
  final String? buttonText;

  const AddMoreItemTextButton(
      {super.key, required this.action, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(8)),
                width: AppRatioSize.getRatioWidth() / 14,
                height: AppRatioSize.getRatioWidth() / 14,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.add,
                  color: AppColor.white,
                )),
            AppRatioSpaces.horizontalSectionSpaceXXXS(),
            Text(
              buttonText ?? "add_more_items".tr,
              textAlign: TextAlign.left,
              style: TextStyleX.header5(context).copyWith(
                fontWeight: FontWeight.w400,
                color: AppColor.primary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
