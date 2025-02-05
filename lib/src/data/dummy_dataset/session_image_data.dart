import 'package:go7eight/src/core/constants/images.dart';

String sessionTrainingImageGet({required int id}){
  switch (id) {
    case 0:
      return AppImage.post1Image;
    case 1:
      return AppImage.post2Image;
    default:
      return AppImage.post3Image;
  }
}

String sessionNutritionImageGet({required int id}){
  switch (id) {
    case 0:
      return AppImage.post1Image;
    case 1:
      return AppImage.post2Image;
    default:
      return AppImage.post3Image;
  }
}