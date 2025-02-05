import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/actions_alertbox.dart';
import '../../controllers/trainer_session_controller.dart';

class SessionCardWidget extends GetView<TrainerSessionController> {
  final SessionModel session;
  final bool isPublished;

  const SessionCardWidget({super.key, required this.session, required this.isPublished});

  @override
  Widget build(BuildContext context) {
    return AppContainerWidget(
      child: Column(
        children: [
          Row(
            children: [
              AppNetworkImage(
                imagePath: "${session.imagePath}",
                width: AppRatioSize.getRatioWidth() / 4.5,
                height: AppRatioSize.getRatioWidth() / 7.5,
                borderRadius: 12,
              ),
              AppRatioSpaces.horizontalSectionSpaceXS(),
              Expanded(
                  child: _titlePriceTextWidget(context,
                      title: "${session.title}", price: "${session.price}"))
            ],
          ),
          AppRatioSpaces.verticalSectionSpaceXS(),
          _sessionTextInfoSection(context, session: session),
          const Divider(
            color: AppColor.lightGrey,
            thickness: 1.5,
          ),
          _viewCountWidget(context,
              viewCount: "${290 - session.id!.toInt()}"),
        ],
      ),
    );
  }

  Widget _titlePriceTextWidget(BuildContext context,
      {required String title, required String price}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyleX.subHeading3(context),
        ),
        Row(
          children: [
            Text(
              "\$$price".tr,
              textAlign: TextAlign.left,
              style: TextStyleX.subHeading3(context).copyWith(
                  color: AppColor.primary,
                  fontSize: AppTextSizes.titleText6()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }

  Widget _sessionTextInfoSection(BuildContext context,
      {required SessionModel session}) {
    return Obx(() {
      return Row(
        children: [
          controller.selectedItem.value == "lbl_exercises"
              ? Container()
              : _textInfoWidget(context,
                  iconPath: AppIcon.breIcon, value: "${session.bre}", unit: ""),
          controller.selectedItem.value == "lbl_exercises"
              ? Container()
              : AppRatioSpaces.horizontalSectionSpaceXXXS(),
          _textInfoWidget(context,
              iconPath: AppIcon.caloriesIcon,
              value: "${session.caloriesToBurn}",
              unit: "Cal"),
          AppRatioSpaces.horizontalSectionSpaceXXS(),
          _textInfoWidget(context,
              iconPath: AppIcon.clockIcon,
              value: "${session.duration}",
              unit: "Min"),
        ],
      );
    });
  }

  Widget _textInfoWidget(BuildContext context,
      {required String iconPath, required String value, required String unit}) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: AppTextSizes.headerText(),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          "$value $unit".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading2(context)
              .copyWith(fontSize: AppTextSizes.headerText4()),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _viewCountWidget(BuildContext context, {required String viewCount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isPublished == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.primary.withOpacity(0.2)
                            : AppColor.primary.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(1),
                          child: Icon(
                            Icons.remove_red_eye,
                            color: AppColor.primary,
                            size: AppRatioSize.getRatioWidth() / 28,
                          ),
                        ),
                        Text('  $viewCount ${'views_lbl'.tr}',
                            style: TextStyleX.subHeading1(context).copyWith(
                                color: AppColor.primary,
                                fontSize: AppTextSizes.headerText5())),
                      ],
                    ),
                  ),
                ],
              )
            : Container(),
        Row(
          children: [
            _cardActionWidget(context,
                color: AppColor.primary,
                action: controller.onSessionEditClick,
                iconData: Icons.edit_note_rounded),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            _cardActionWidget(context, color: AppColor.red, action: () {
              actionsAlertBox(
                  context: context,
                  title: "delete_session_message",
                  description: "",
                  icon: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.macroGreen.withOpacity(0.2)),
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.check,
                            color: AppColor.macroGreen,
                            size: AppRatioSize.getRatioWidth() / 12,
                          ))
                    ],
                  ),
                  buttonWidget: SizedBox(
                    height: AppRatioSize.getRatioHeight() / 18,
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            action: () {
                              Navigator.pop(context);
                            },
                            text: "cancel_lbl",
                            btnColor: Theme.of(context).brightness ==
                                    Brightness.light
                                ? AppColor.textBlueGrey
                                : AppColor.grey,
                            primary: false,
                            txtColor: Theme.of(context).brightness ==
                                    Brightness.light
                                ? AppColor.textBlueGrey
                                : AppColor.grey,
                          ),
                        ),
                        AppRatioSpaces.horizontalSectionSpaceS(),
                        Expanded(
                          child: AppButton(
                            action: () {
                              SnackBarX.showSuccess(
                                  title: "session_delete_snack_title",
                                  message: "session_delete_snack_message");
                              Navigator.pop(context);
                            },
                            text: "lbl_btn_confirm",
                          ),
                        ),
                      ],
                    ),
                  ));
            }, iconData: Icons.delete_outline_rounded),
          ],
        ),
      ],
    );
  }

  _cardActionWidget(BuildContext context,
      {required Color color,
      required Function() action,
      required IconData iconData}) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width),
          color: Theme.of(context).brightness == Brightness.light
              ? color.withOpacity(0.15)
              : color.withOpacity(0.55),
        ),
        child: Icon(
          iconData,
          color: color,
          size: AppRatioSize.getRatioWidth() / 18,
        ),
      ),
    );
  }
}
