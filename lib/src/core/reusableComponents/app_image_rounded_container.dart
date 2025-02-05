


import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../app_export.dart';
import '../constants/colors.dart';
import '../constants/ratio_size.dart';

class AppLocalImage extends StatelessWidget{
  final String imagePath;
  final double height;
  final double width;
  final double boarderWidth;
  final double borderRadius;
  final bool? showBoarder;
  final Color? boarderColorLight;
  final Color? boarderColorDark;


  const AppLocalImage({super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.borderRadius=1000,
    this.boarderWidth=1,
    this.showBoarder=false,
    this.boarderColorLight=AppColor.grey,
    this.boarderColorDark=AppColor.grey,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Theme.of(context).brightness == Brightness.light
            ? boarderColorLight!
            :boarderColorDark!, width: showBoarder==true?boarderWidth:0),
        color: AppColor.lightGrey,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}