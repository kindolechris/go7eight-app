import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/global_widgets/general_app_bar.dart';
import '../controllers/gym_advertisement_controller.dart';
import 'widgets/trainer_ad_accept_alertbox.dart';
import 'widgets/trainer_ad_remove_alertbox.dart';

class GYMAdvertisementRequestView extends StatefulWidget {
  const GYMAdvertisementRequestView({super.key});

  @override
  State<GYMAdvertisementRequestView> createState() =>
      _GYMAdvertisementRequestViewState();
}

class _GYMAdvertisementRequestViewState
    extends State<GYMAdvertisementRequestView> {
  final GYMAdvertisementController _controller =
      Get.put(GYMAdvertisementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: fitnofyGeneralAppBar(
        context,
        showAddIcon: false,
        title: "trainer_ad_request_title",
        showLeading: true,
      ),
      body: Container(
          height: Get.height,
          width: Get.width,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              AppRatioSpaces.verticalSectionSpaceM(),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppRatioSize.getRatioWidth() / 24),
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: _controller.adImageList.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: AppContainerWidget(
                              disableDefaultHPadding: true,
                              disableDefaultVPadding: true,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(
                                        AppRatioSize.getRatioWidth() / 44),
                                    child: AppNetworkImage(
                                      height:
                                          AppRatioSize.getRatioHeight() / 5.5,
                                      width: double.infinity,
                                      imagePath:
                                          "${_controller.adImageList[index].imagePath}",
                                      borderRadius: 12,
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              AppRatioSize.getRatioWidth() /
                                                  44),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: AppButton(
                                              action: () {
                                                trainerAdRemoveAlertBox(
                                                    context);
                                              },
                                              text: "remove_title",
                                              buttonHeight: AppRatioSize
                                                      .getRatioHeight() /
                                                  20,
                                              fontSize:
                                                  AppTextSizes.headerText2(),
                                              primary: false,
                                              btnColor: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? AppColor.blackShade
                                                  : AppColor.grey,
                                              txtColor: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? AppColor.blackShade
                                                  : AppColor.grey,
                                            ),
                                          ),
                                          AppRatioSpaces
                                              .horizontalSectionSpaceXXS(),
                                          Expanded(
                                            child: AppButton(
                                              action: () {
                                                trainerAdAcceptAlertBox(
                                                    context);
                                              },
                                              text: "accept_lbl",
                                              buttonHeight: AppRatioSize
                                                      .getRatioHeight() /
                                                  20,
                                              fontSize:
                                                  AppTextSizes.headerText2(),
                                              primary: false,
                                              btnColor: AppColor.primary,
                                              txtColor: AppColor.primary,
                                            ),
                                          ),
                                        ],
                                      )),
                                  AppRatioSpaces.verticalSectionSpaceXS(),
                                ],
                              ),
                            ),
                          ));
                    }),
              ),
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }
}
