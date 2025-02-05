import 'package:carousel_slider/carousel_slider.dart';
import 'package:go7eight/src/core/app_export.dart';

import '../../../../global_widgets/ad_container_widget.dart';
import '../../controllers/home_controller.dart';

class HomeAdBannerWidget extends GetView<HomeController> {
  const HomeAdBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
          autoPlayAnimationDuration: const Duration(seconds: 3),
          aspectRatio: 2.6,
          onPageChanged: (index, reason) {
            //controller.currentChallenge.value = index;
          }),
      itemCount: controller.advertisements.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          AdBannerWidget(
        action: () {
          controller.advertisements[itemIndex].gotoScreen!();
        },
        adImagePath: "${controller.advertisements[itemIndex].imagePath}",
      ),
    );
  }
}
