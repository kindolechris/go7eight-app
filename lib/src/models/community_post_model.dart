
import 'package:go7eight/src/models/user_model.dart';

class CommunityPostModel{
  int? id;
  UserModel? user;
  String? title;
  String? imagePath;
  String? description;
  String? date;
  String? time;
  bool? isNotificationTurnedOn;
  int? commentCount;
  int? favCount;
  bool? showMore;


  CommunityPostModel({
    this.id,
    this.user,
    this.title,
    this.description,
    this.imagePath,
    this.commentCount,
    this.favCount,
    this.showMore,
    this.date,
    this.time,
    this.isNotificationTurnedOn
  });
}
