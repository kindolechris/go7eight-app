import 'package:prime_social_media_flutter_ui_kit/config/app_image.dart';
import 'package:prime_social_media_flutter_ui_kit/config/app_string.dart';

class SocialMediaPostModel {
  final String username;
  final String location;
  final String timeAgo;
  final String profileImage;
  final String profileID;
  final String postImage;
  final String postDescription;
  final bool showTagUserIcon;
  final bool showVolumeIcon;
  final bool verifiedUserIcon;
  final bool showActionsOnImage;

  SocialMediaPostModel({
    required this.username,
    required this.location,
    required this.timeAgo,
    required this.profileImage,
    required this.profileID,
    required this.postImage,
    required this.postDescription,
    this.showTagUserIcon = false,
    this.showVolumeIcon = false,
    this.verifiedUserIcon = false,
    this.showActionsOnImage = false,
  });
}

List<SocialMediaPostModel> posts = [
  SocialMediaPostModel(
    username: AppString.davidMorel,
    location: AppString.daressalaam,
    timeAgo: AppString.min33,
    profileImage: AppImage.profile1,
    profileID: AppString.davidMorelID,
    postImage: AppImage.post2,
    postDescription: AppString.loremString,
    showTagUserIcon: true,
    showVolumeIcon: true,
    verifiedUserIcon: false,
    showActionsOnImage: false,
  ),
  SocialMediaPostModel(
    username: AppString.rojModel,
    location: AppString.indonesia,
    timeAgo: AppString.min2,
    profileImage: AppImage.profile2,
    profileID: AppString.rojModelID,
    postImage: AppImage.reelVideoImage,
    postDescription: AppString.loremString,
    showTagUserIcon: false,
    showVolumeIcon: true,
    verifiedUserIcon: true,
    showActionsOnImage: true,
  ),
];