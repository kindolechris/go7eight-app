
import 'package:go7eight/src/models/session_model.dart';

import 'challenge_model.dart';

class CategoryModel{
  int? id;
  String? name;
  String? desc;
  String? iconPath;
  List<ChallengeModel>? challengeList;
  List<SessionModel>? sessionList;

  CategoryModel({
    this.id,
    this.name,
    this.desc,
    this.iconPath,
    this.challengeList,
    this.sessionList
  });
}