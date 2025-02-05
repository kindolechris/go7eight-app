class BaseResponseModel{
  int? code;
  bool? status;
  String? message;
  Object? data;

  BaseResponseModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

}