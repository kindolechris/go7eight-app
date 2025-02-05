
import 'package:go7eight/src/core/app_export.dart';

class ChallengeImageWidget extends StatelessWidget {
  final String challengeThumbnail;

  const ChallengeImageWidget({super.key, required this.challengeThumbnail});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppRatioSize.getRatioWidth() / 24),
      child: AspectRatio(
          aspectRatio: 16 / 9,
          child: AppNetworkImage(
            width: Get.width,
            height: Get.height / 3,
            imagePath: challengeThumbnail,
            borderRadius: 12,
          )),
    );
  }
}
