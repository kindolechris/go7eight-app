import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/modules/panels/global_widgets/trainer_container_widget.dart';
import 'package:go7eight/src/modules/panels/student/profile/controllers/profile_controller.dart';
import '../../../global_widgets/app_bar_widget.dart';

class FollowingView extends StatefulWidget {
  const FollowingView({super.key});

  @override
  State<FollowingView> createState() => _FollowingViewState();
}

class _FollowingViewState extends State<FollowingView> {
  final ProfileController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.black,
      appBar: sessionAppBar(
        context,
        showSaveIcon: false,
        title: "lbl_following",
      ),
      body: Container(
          height: Get.height,
          width: Get.width,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.black,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              AppRatioSpaces.verticalSectionSpaceM(),
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: _controller.myFollowingTrainers.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _controller.gotoInstructorPublicView(
                            index % 2 == 0
                                ? SessionType.regular
                                : SessionType.regular,
                            _controller.myFollowingTrainers[index]);
                      },
                      child: TrainerContainer(
                          trainer: _controller.myFollowingTrainers[index],
                          onClickFollow: () {
                            setState(() {
                              _controller.trainerFollowToggle(index);
                            });
                          }),
                    );
                  })
            ],
          )
          // PreferenceView(isEditMode: true,)
          ),
    );
  }
}
