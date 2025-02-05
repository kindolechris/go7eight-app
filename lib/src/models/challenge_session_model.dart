

import 'package:go7eight/src/models/session_model.dart';

class ChallengeSessionModel{
  int? id;
  SessionModel? sessionModel;
  bool? isCompleted;

  ChallengeSessionModel({
    this.id,
    this.sessionModel,
    this.isCompleted=false
  });
}