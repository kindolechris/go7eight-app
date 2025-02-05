import 'session_model.dart';

class ChallengeModel{
  int? id;
  String? title;
  String? desc;
  TrainerModel? trainer;
  String? imagePath;
  bool? isBookMarked;
  String? totalMembers;
  String? duration;
  String? timeRange;
  List<ProductTagModel>? tags;
  String? workoutFocus;
  String? workoutType;
  String? price;
  ChallengeRatingModel? rating;

  ChallengeModel({
    this.id,
    this.title,
    this.desc,
    this.imagePath,
    this.trainer,
    this.isBookMarked,
    this.totalMembers,
    this.duration,
    this.tags,
    this.timeRange,
    this.workoutFocus,
    this.workoutType,
    this.price,
    this.rating
  });
}


class ChallengeRatingModel{
  int? id;
  String? rating;
  String? totalCount;

  ChallengeRatingModel({
    this.id,
    this.rating,
    this.totalCount
  });
}
class TrainerModel{
  int? id;
  String? name;
  String? imagePath;
  String? type;
  bool? isFollowed;

  TrainerModel({
    this.id,
    this.name,
    this.imagePath,
    this.type,
    this.isFollowed=false
  });
}
