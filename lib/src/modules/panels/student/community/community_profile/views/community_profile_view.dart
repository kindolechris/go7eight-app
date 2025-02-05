import 'package:go7eight/src/core/reusableComponents/app_sliver_delegate.dart';
import 'package:go7eight/src/modules/panels/student/community/community_home/views/widgets/post_widget.dart';
import 'package:go7eight/src/modules/panels/student/community/community_profile/controllers/community_profile_controller.dart';

import '../../../../../../core/app_export.dart';
import '../../community_home/views/widgets/comment_widget.dart';
import 'widgets/community_profile_top_section.dart';

class CommunityProfileView extends GetView<CommunityProfileController> {
  const CommunityProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.offWhite
            : AppColor.blackShade,
        body: SafeArea(
          top: true,
          child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: DefaultTabController(
                length: 4,
                child: Builder(builder: (BuildContext context) {
                  return NestedScrollView(
                    physics: const BouncingScrollPhysics(),
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverToBoxAdapter(
                          child: _unpinnedSliverAppBar(context),
                        ),
                        SliverPersistentHeader(
                          pinned: true,
                          floating: false,
                          delegate: SliverAppBarDelegate(
                              minHeight: 56,
                              maxHeight: 56,
                              child: _tabWidget(context)),
                        ),
                      ];
                    },
                    body: Container(
                      margin: EdgeInsets.only(
                          top: AppRatioSize.getRatioHeight() / 120),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppRatioSize.getRatioWidth() / 24),
                      child: CustomScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                Obx(() {
                                  return controller.isPostSelected.value
                                      ? _postListWidget()
                                      : _commentListWidget();
                                })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              )),
        ));
  }

  _unpinnedSliverAppBar(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _backButtonWidget(context),
          const CommunityProfileTopSection(),
          AppRatioSpaces.verticalSectionSpaceL(),
        ],
      ),
    );
  }

  Widget _backButtonWidget(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            width: 50,
            height: 50,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.blackShade
                  : AppColor.offWhite,
            ),
          ),
        )
      ],
    );
  }

  Widget _tabWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppRatioSize.getRatioHeight() / 120),
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offWhite
          : AppColor.blackShade,
      child: Obx(() {
        return AppTabBar(
          onChange: (value) {
            controller.isPostSelected.value = value;
          },
          isFirstOptionSelected: controller.isPostSelected.value,
          optionOneText: "post_lbl",
          optionTwoText: "comments_lbl",
          horizontalMargin: AppRatioSize.getRatioWidth() / 24,
        );
      }),
    );
  }

  Widget _postListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 4,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 88, vertical: 4),
            child: PostWidget(
              communityPost: controller.communityPostList[index],
              borderRadius: 18,
            ));
      },
    );
  }

  Widget _commentListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 7,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppRatioSize.getRatioWidth() / 88, vertical: 4),
          child: CommentWidget(index: index),
        );
      },
    );
  }
}
