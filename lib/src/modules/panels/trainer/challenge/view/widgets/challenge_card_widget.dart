import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/modules/panels/global_widgets/actions_alertbox.dart';

import '../../controllers/trainer_challenge_controller.dart';

class ChallengeCardWidget extends GetView<TrainerChallengeListController> {
  final ChallengeModel challenge;
  final bool isPublished;

  const ChallengeCardWidget({super.key, required this.challenge, required this.isPublished});
  @override
  Widget build(BuildContext context) {
    return AppContainerWidget(
      child: Column(
        children: [
          Row(
            children: [
              AppNetworkImage(
                imagePath: "${challenge.imagePath}",
                width: AppRatioSize.getRatioWidth() / 4.5,
                height: AppRatioSize.getRatioWidth() / 7.5,
                borderRadius: 12,
              ),
              AppRatioSpaces.horizontalSectionSpaceXS(),
              Expanded(
                  child: _titlePriceTextWidget(context,
                      title: "${challenge.title}", price: "${challenge.price}"))
            ],
          ),
          AppRatioSpaces.verticalSectionSpaceXS(),
          isPublished == true
              ? _challengesTextInfoSection(context, challenge: challenge)
              : Container(),
          const Divider(
            color: AppColor.lightGrey,
            thickness: 1.5,
          ),
          _viewCountWidget(context,
              viewCount: "${290 - challenge.id!.toInt()}"),
        ],
      ),
    );
  }

  Widget _challengesTextInfoSection(BuildContext context,
      {required ChallengeModel challenge}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _textInfoWidget(context,
              iconPath: AppIcon.challengesMemberIcon,
              value: "${challenge.totalMembers}",
              unit: ""),
        ),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Expanded(
          flex: 1,
          child: _textInfoWidget(context,
              iconPath: AppIcon.challengesRatingIcon,
              value: "${challenge.rating!.rating}",
              unit: "(${challenge.rating!.totalCount})+"),
        ),
        AppRatioSpaces.horizontalSectionSpaceXXS(),
        Expanded(
          flex: 1,
          child: _textInfoWidget(context,
              iconPath: AppIcon.challengesTimeIcon,
              value: "${challenge.timeRange}",
              unit: "min"),
        ),
      ],
    );
  }

  Widget _textInfoWidget(BuildContext context,
      {required String iconPath, required String value, required String unit}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            width: AppTextSizes.titleText8(),
            height: AppTextSizes.titleText8(),
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text.rich(
            textAlign: TextAlign.center,
            style: TextStyleX.subHeading2BlueGrey(context),
            maxLines: 1,
            TextSpan(
              children: [
                TextSpan(
                  text: value,
                ),
                TextSpan(
                  text: ' $unit'.tr,
                  style: TextStyleX.subHeading2BlueGrey(context).copyWith(
                    color: AppColor.lightBlueGrey,
                  ),
                )
              ],
            ),
          )
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
                action: controller.onAddSessionClick,
                iconData: Icons.add),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            _cardActionWidget(context,
                color: AppColor.primary,
                action: controller.onChallengeEditClick,
                iconData: Icons.edit_note_rounded),
            AppRatioSpaces.horizontalSectionSpaceXXS(),
            _cardActionWidget(context, color: AppColor.red, action: () {
              actionsAlertBox(
                  context: context,
                  title: "delete_challenge_message",
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
                                  title: "challenge_delete_snack_title",
                                  message: "challenge_delete_snack_message");
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
