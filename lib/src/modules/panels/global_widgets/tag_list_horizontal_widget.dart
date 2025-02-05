
import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';
import '../../../data/dummy_dataset/session_tags.dart';
import '../../../models/session_model.dart';

class TagListWidget extends StatelessWidget {
  final bool? disableDefaultHPadding;
  final List<ProductTagModel> tags;

  const TagListWidget(
      {super.key, this.disableDefaultHPadding, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppRatioSize.getRatioHeight() / 48,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(
        horizontal: disableDefaultHPadding == true
            ? 0
            : AppRatioSize.getRatioWidth() / 24,
      ),
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: tags.isEmpty ? 3 : tags.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.primary.withOpacity(0.20),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppRatioSize.getRatioWidth() / 88,
                ),
                margin:
                    EdgeInsets.only(right: AppRatioSize.getRatioWidth() / 66),
                alignment: Alignment.center,
                child: Text(
                  tags.isEmpty
                      ? getSessionTagNames(id: index)
                      : "${tags[index].tag}",
                  textAlign: TextAlign.left,
                  style: TextStyleX.subHeading6(context).copyWith(
                    color: AppColor.primary,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }),
    );
  }
}
