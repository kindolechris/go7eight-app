import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/actions_alertbox.dart';

import '../../controllers/employee_controller.dart';
import 'employee_card_widget.dart';

class TrainerListView extends StatefulWidget {
  const TrainerListView({super.key});

  @override
  State<TrainerListView> createState() => _TrainerListViewState();
}

class _TrainerListViewState extends State<TrainerListView> {
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
            itemCount: _controller.myFitnessTrainers.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _controller.onEmployeeClick(SessionType.regular);
                },
                child: EmployeeCardWidget(
                  trainer: _controller.myFitnessTrainers[index],
                  onBlockClick: () {
                    actionsAlertBox(
                        context: context,
                        title:
                            _controller.myFitnessTrainers[index].isFollowed ==
                                    false
                                ? "active_trainer_message"
                                : "block_trainer_message",
                        description: "",
                        icon: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _controller.myFitnessTrainers[index].isFollowed ==
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
                                    setState(() {
                                      _controller.myFitnessTrainers[index]
                                              .isFollowed =
                                          !_controller.myFitnessTrainers[index]
                                              .isFollowed!;
                                    });
                                    if (_controller.myFitnessTrainers[index]
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
                  isBlocked: !_controller.myFitnessTrainers[index].isFollowed!,
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
                                    setState(() {
                                      _controller.myFitnessTrainers.remove(
                                          _controller.myFitnessTrainers[index]);
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
