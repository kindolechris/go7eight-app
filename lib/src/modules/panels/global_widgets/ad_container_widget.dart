import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_export.dart';

class AdBannerWidget extends StatelessWidget {
  final String adImagePath;
  final void Function() action;
  final double? bannerHeight;
  final double? bannerWidth;
  const AdBannerWidget(
      {super.key,
      required this.adImagePath,
      this.bannerHeight,
      this.bannerWidth,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: bannerHeight ?? AppRatioSize.getRatioHeight() / 4.4,
        width: bannerWidth ?? Get.width,
        margin: EdgeInsets.symmetric(
          horizontal: AppRatioSize.getRatioWidth() / 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // image: DecorationImage(
          //     image: NetworkImage(adImagePath), fit: BoxFit.cover),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: adImagePath,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColor.grey.withOpacity(0.2),
              highlightColor: AppColor.lightGrey.withOpacity(0.4),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.image_not_supported_rounded,
              color: AppColor.grey.withOpacity(0.5),
              size: AppRatioSize.getRatioWidth() / 8,
            ),
          ),
        ),
      ),
    );
  }
}
