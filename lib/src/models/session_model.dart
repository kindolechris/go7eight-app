
import 'challenge_model.dart';

class SessionModel{
  int? id;
  String? title;
  String? desc;
  List<ProductTagModel>? tags;
  String? imagePath;
  String? videoUrl;
  String? caloriesToBurn;
  String? duration;
  String? bre;
  String? price;
  int? recipeCount;
  SessionRatingModel? rating;
  TrainerModel? trainer;
  bool? isBookmarked;

  SessionModel({
    this.id,
    this.title,
    this.desc,
    this.tags,
    this.imagePath,
    this.caloriesToBurn,
    this.videoUrl,
    this.duration,
    this.bre,
    this.price,
    this.recipeCount,
    this.rating,
    this.isBookmarked,
    this.trainer
  });
}


class ProductTagModel{
  int? id;
  String? tag;

  ProductTagModel({
    this.id,
    this.tag,
  });
}

class SessionRatingModel{
  int? id;
  String? rating;
  String? totalCount;

  SessionRatingModel({
    this.id,
    this.rating,
    this.totalCount
  });
}