import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dummy_dataset/session_image_data.dart';
import 'package:go7eight/src/data/dummy_dataset/session_title_data.dart';
import 'package:go7eight/src/data/dummy_dataset/trainer_name_data.dart';
import 'package:go7eight/src/data/dummy_dataset/user_image_data.dart';
import 'package:go7eight/src/models/community_post_model.dart';
import 'package:go7eight/src/models/user_model.dart';

class CommunityProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isPostSelected = true.obs;


  final List<CommunityPostModel> communityPostList = List.generate(
    32,
    (index) => CommunityPostModel(
      id: index,
      imagePath: sessionTrainingImageGet(id: 3 + index),
      user: UserModel(
          id: index,
          name: trainerNameGet(id: index + 5),
          imagePath: userImageGet(id: index)),
      date: "23 Nov 2023",
      time: "05:${index + 10}PM",
      title: sessionTrainingTitleGet(id: index + 3),
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. \n\nLorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown \n\nprinter took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      commentCount: index + index + 1,
      favCount: index + (4 * index),
      isNotificationTurnedOn: false,
      showMore: false,
    ),
  );
}
