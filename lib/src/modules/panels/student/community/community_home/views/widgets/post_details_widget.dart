import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/community_post_model.dart';


class PostDetailsWidget extends StatefulWidget {
  final CommunityPostModel communityPost;

  const PostDetailsWidget({super.key, required this.communityPost});

  @override
  State<PostDetailsWidget> createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget> {
  bool _showMore = false;

  @override
  void initState() {
    _showMore = widget.communityPost.showMore ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Text(
          "${widget.communityPost.title}".tr,
          textAlign: TextAlign.left,
          style: TextStyleX.subHeading3(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.communityPost.description}".tr,
              style: TextStyleX.subHeading3(context)
                  .copyWith(fontSize: AppTextSizes.headerText4()),
              maxLines: _showMore == true ? 150 : 5,
              overflow: TextOverflow.ellipsis,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showMore = !_showMore;
                });
              },
              child: Text(
                _showMore == true
                    ? 'less_lbl'.tr.toLowerCase()
                    : 'lbl_more'.tr.toLowerCase(),
                style: TextStyleX.subHeading2(context)
                    .copyWith(color: AppColor.primary),
              ),
            ),
          ],
        )
      ],
    );
  }
}
