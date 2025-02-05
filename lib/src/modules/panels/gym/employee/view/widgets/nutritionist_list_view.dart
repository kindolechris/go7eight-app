import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/actions_alertbox.dart';

import '../../controllers/employee_controller.dart';
import 'employee_card_widget.dart';

class NutritionistListView extends StatefulWidget {
  const NutritionistListView({super.key});

  @override
  State<NutritionistListView> createState() => _NutritionistListViewState();
}

class _NutritionistListViewState extends State<NutritionistListView> {
  final GYMEmployeeController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      children: [
        AppRatioSpaces.verticalSectionSpaceS(),
        ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: _controller.myNutritionists.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _controller.onEmployeeClick(SessionType.nutrition);
                },
                child: EmployeeCardWidget(
                  trainer: _controller.myNutritionists[index],
                  onBlockClick: () {
                    actionsAlertBox(
                        context: context,
                        title: _controller.myNutritionists[index].isFollowed ==
                                false
                            ? "active_trainer_message"
                            : "block_trainer_message",
                        description: "",
                        icon: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _controller.myNutritionists[index].isFollowed ==
                                    false
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColor.macroGreen
                                            .withOpacity(0.2)),
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.check,
                                      color: AppColor.macroGreen,
                                      size: AppRatioSize.getRatioWidth() / 12,
                                    ))
                                : Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColor.grey.withOpacity(0.2)),
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.block_outlined,
                                      color: AppColor.darkGrey,
                                      size: AppRatioSize.getRatioWidth() / 12,
                                    )),
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
                                  btnColor: Theme.of(context).brightness==Brightness.light?AppColor.textBlueGrey:AppColor.grey,
                                  primary: false,
                                  txtColor: Theme.of(context).brightness==Brightness.light?AppColor.textBlueGrey:AppColor.grey,
                                ),
                              ),
                              AppRatioSpaces.horizontalSectionSpaceS(),
                              Expanded(
                                child: AppButton(
                                  action: () {
                                    setState(() {
                                      _controller.myNutritionists[index]
                                              .isFollowed =
                                          !_controller.myNutritionists[index]
                                              .isFollowed!;
                                    });
                                    if (_controller.myNutritionists[index]
                                            .isFollowed ==
                                        false) {
                                      SnackBarX.showSuccess(
                                          title: "user_access_snack_title",
                                          message:
                                              "user_access_snack_block_message");
                                    } else {
                                      SnackBarX.showSuccess(
                                          title: "user_access_snack_title",
                                          message:
                                              "user_access_snack_active_message");
                                    }
                                    Navigator.pop(context);
                                  },
                                  text: "lbl_btn_confirm",
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                  isBlocked: !_controller.myNutritionists[index].isFollowed!,
                  onDeleteClick: () {
                    actionsAlertBox(
                        context: context,
                        title: "trainer_delete_confirmation_message",
                        description: "",
                        icon: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(2),
                                child: Image.asset(
                                  AppIcon.deleteAlertIcon,
                                  scale: 2.5,
                                )),
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
                                  btnColor: Theme.of(context).brightness==Brightness.light?AppColor.textBlueGrey:AppColor.grey,
                                  primary: false,
                                  txtColor: Theme.of(context).brightness==Brightness.light?AppColor.textBlueGrey:AppColor.grey,
                                ),
                              ),
                              AppRatioSpaces.horizontalSectionSpaceS(),
                              Expanded(
                                child: AppButton(
                                  action: () {
                                    setState(() {
                                      _controller.myNutritionists.remove(
                                          _controller.myNutritionists[index]);
                                    });

                                    SnackBarX.showSuccess(
                                        title: "user_access_snack_title",
                                        message:
                                            "trainer_delete_snack_message");
                                    Navigator.pop(context);
                                  },
                                  text: "lbl_btn_confirm",
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              );
            }),
        AppRatioSpaces.verticalSectionSpaceM(),
      ],
    );
  }
}
