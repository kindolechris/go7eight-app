
import '../app_export.dart';
import '../constants/app_spaces.dart';
import '../constants/colors.dart';
import '../constants/ratio_size.dart';

class AppDivider extends StatelessWidget{
  final Color? color;
  final bool? disablePadding;

  const AppDivider({super.key,
    this.color=AppColor.white,
    this.disablePadding=false
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        disablePadding==true?Container():AppRatioSpaces.verticalSectionSpaceM(),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppRatioSize.getRatioWidth() / 24),
            child: Divider(
              color: color!.withOpacity(0.6),
            )),
        disablePadding==true?Container():AppRatioSpaces.verticalSectionSpaceM(),
      ],
    );
  }



}