import '../../controllers/home_controller.dart';
import 'package:go7eight/src/core/app_export.dart';

class CategoryListWidget extends GetView<HomeController> {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const AppSectionTitle(
          title: "categories_lbl",
          disableDefaultVPadding: true,
        ),
        AppRatioSpaces.verticalSectionSpaceXXS(),
        SizedBox(
            height: AppRatioSize.getRatioHeight() / 17,
            width: Get.width,
            child: Obx(() {
              return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: controller.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.categoryClick(
                            category: controller.categories[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          AppRatioSize.getRatioWidth() / 44,
                        ),
                        margin: EdgeInsets.only(
                            left: index == 0
                                ? AppRatioSize.getRatioWidth() / 24
                                : 0,
                            right: (index + 1) == (controller.categories.length)
                                ? AppRatioSize.getRatioWidth() / 24
                                : AppRatioSize.getRatioWidth() / 38),
                        decoration: BoxDecoration(
                          color: AppColor.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              height: AppRatioSize.getRatioWidth() / 14,
                              width: AppRatioSize.getRatioWidth() / 14,
                              controller.categories[index].iconPath!,
                            ),
                            AppRatioSpaces.horizontalSectionSpaceXXSS(),
                            Text(
                              "${controller.categories[index].name}".tr,
                              textAlign: TextAlign.start,
                              style: TextStyleX.subHeading3(context),
                            ),
                            AppRatioSpaces.horizontalSectionSpaceXXSS(),
                          ],
                        ),
                      ),
                    );
                  });
            })),
      ],
    );
  }
}
