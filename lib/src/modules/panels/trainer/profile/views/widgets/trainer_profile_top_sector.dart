import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';

class TrainerProfileTopSection extends StatelessWidget {
  const TrainerProfileTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _coverImageWidget(),
            _profileImageWidget(context),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppRatioSpaces.verticalSectionSpaceXS(),
            Text(
              "Orko MS",
              textAlign: TextAlign.start,
              style: TextStyleX.subHeading1(context).copyWith(
                fontSize: AppTextSizes.headerText(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _coverImageWidget() {
    return Container(
      margin: EdgeInsets.only(
        left: AppRatioSize.getRatioWidth() / 24,
        right: AppRatioSize.getRatioWidth() / 24,
        bottom: AppRatioSize.getRatioWidth() / 12,
      ),
      child: AspectRatio(
        aspectRatio: 16 / 7.5,
        child: AppNetworkImage(
          width: Get.width,
          height: Get.height / 3,
          borderRadius: 12,
          imagePath:
              "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697115941/gym/Rectangle_22498_rwl1g4.png",
        ),
      ),
    );
  }

  Widget _profileImageWidget(BuildContext context) {
    return Hero(
      tag: "profileImage_user",
      child: AppNetworkImage(
          width: AppRatioSize.getRatioWidth() / 5,
          height: AppRatioSize.getRatioWidth() / 5,
          showBoarder: true,
          boarderWidth: 6,
          boarderColorLight: AppColor.white,
          boarderColorDark: AppColor.black,
          imagePath: trainerImageGet(id: 8)),
    );
  }
}
