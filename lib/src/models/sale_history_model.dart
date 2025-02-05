
import 'package:go7eight/src/models/session_model.dart';

import 'challenge_model.dart';

class SaleHistoryModel{
  int? id;
  bool? isSessionType;
  String? date;
  String? time;
  String? amount;
  bool? successStatus;
  SessionModel? session;
  ChallengeModel? challenge;
  TrainerModel? trainer;


  SaleHistoryModel({
    this.id,
    this.isSessionType,
    this.date,
    this.time,
    this.amount,
    this.successStatus,
    this.challenge,
    this.session,
    this.trainer,
  });
}