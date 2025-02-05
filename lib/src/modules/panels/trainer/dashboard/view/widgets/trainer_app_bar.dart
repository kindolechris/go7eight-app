import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_image_data.dart';

import '../../../root/controllers/trainer_root_controller.dart';

class TrainerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrainerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.primaryLight
              : AppColor.primaryLight,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.only(
          top: AppRatioSize.getRatioHeight() / 200,
        ),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColor.primaryLight
              : AppColor.primaryLight,
          elevation: 0.0,
          primary: true,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: _customappBarTitle(context),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size(Get.width, 66);
  }

  Widget _customappBarTitle(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            TrainerRootController controller = Get.find();
            controller.selectedIndex.value = 4;
          },
          child: Hero(
            tag: "profileImage_user",
            child: AppNetworkImage(
                width: AppRatioSize.getRatioWidth() / 8,
                height: AppRatioSize.getRatioWidth() / 8,
                showBoarder: true,
                imagePath: trainerImageGet(id: 8)),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(child: _appBarProfileName(context))
      ],
    );
  }

  Widget _appBarProfileName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "hello_trainer_lbl".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading3(context).copyWith(
            color: AppColor.blackShade,
          ),
        ),
        Text(
          "welcome_to_app".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading1(context).copyWith(
            color: AppColor.textBlueGrey,
          ),
        ),
      ],
    );
  }
}
