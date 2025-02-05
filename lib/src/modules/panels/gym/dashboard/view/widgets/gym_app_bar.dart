import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/modules/panels/gym/root/controllers/root_controller.dart';

class GYMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GYMAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.primary
              : AppColor.primary,
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
              ? AppColor.primary
              : AppColor.primary,
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
            GYMRootController controller = Get.find();
            controller.selectedIndex.value = 2;
          },
          child: Hero(
            tag: "profileImage_user",
            child: AppNetworkImage(
                width: AppRatioSize.getRatioWidth() / 8,
                height: AppRatioSize.getRatioWidth() / 8,
                showBoarder: true,
                imagePath:
                    "https://res.cloudinary.com/ds9ufzny1/image/upload/v1697113995/gym/Rectangle_4522_dlhmzj.png"),
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
          "hello_admin_lbl".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading3(context).copyWith(
            color: AppColor.white,
          ),
        ),
        Text(
          "welcome_to_app".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading1(context)
              .copyWith(color: AppColor.white, height: 1.2),
        ),
      ],
    );
  }
}
