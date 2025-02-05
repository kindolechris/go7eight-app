import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/community_post_model.dart';

import 'comment_bottomsheet.dart';

class PostInteractionWidget extends StatefulWidget {
  final CommunityPostModel communityPost;

  const PostInteractionWidget({super.key, required this.communityPost});

  @override
  State<PostInteractionWidget> createState() => _PostInteractionWidgetState();
}

class _PostInteractionWidgetState extends State<PostInteractionWidget> {
  late bool _isLiked;
  late Offset _initialOffset;
  @override
  void initState() {
    _isLiked = false;
    _initialOffset = Offset.zero;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _interactionWidget(context, action: () {
          setState(() {
            _isLiked = !_isLiked;
          });
        },
            iconData: _isLiked ? Icons.favorite : Icons.favorite_border_rounded,
            data: "${(widget.communityPost.id! + 1) * 5}"),
        AppRatioSpaces.horizontalSectionSpaceXS(),
        _interactionWidget(context, action: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) {
              return Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const CommentBottomsheet());
            },
          );
        },
            iconData: Icons.comment_outlined,
            data: "${(widget.communityPost.id! + 1) * 5 + 3}"),
        const Spacer(),
        GestureDetector(
          onTapDown: (TapDownDetails details) {
            final tapPosition = details.globalPosition;
            final x = tapPosition.dx;
            final y = tapPosition.dy;
            _initialOffset = Offset(x, y);
          },
          onTap: () async {
            await showMenu(
              context: context,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              position: RelativeRect.fromLTRB(_initialOffset.dx,
                  _initialOffset.dy, _initialOffset.dx, _initialOffset.dy),
              items: [
                PopupMenuItem(
                  value: 1,
                  onTap: () {},
                  child: Text(
                    "option_one_lbl".tr,
                    style: TextStyleX.subHeading2BlueGrey(context),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  onTap: () {},
                  child: Text(
                    "option_two_lbl".tr,
                    style: TextStyleX.subHeading2BlueGrey(context),
                  ),
                ),
              ],
              shadowColor: Theme.of(context).brightness == Brightness.light
                  ? AppColor.lightGrey
                  : AppColor.grey,
              elevation: 4.0,
            );
          },
          child: Icon(Icons.more_horiz_rounded,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.grey
                  : AppColor.darkGrey),
        )
      ],
    );
  }

  Widget _interactionWidget(BuildContext context,
      {required Function() action,
      required IconData iconData,
      required String data}) {
    return GestureDetector(
      onTap: action,
      child: Row(
        children: [
          Icon(
            iconData,
            color: AppColor.primary,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            data.tr,
            textAlign: TextAlign.left,
            style: TextStyleX.subHeading3(context).copyWith(
              color: AppColor.primary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
