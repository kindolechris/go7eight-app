class TransactionHistoryModel{
  int? id;
  String? type;
  String? date;
  String? time;
  String? iconPath;
  String? amount;
  bool? successStatus;


  TransactionHistoryModel({
    this.id,
    this.type,
    this.date,
    this.time,
    this.iconPath,
    this.amount,
    this.successStatus,
  });
}