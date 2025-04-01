
var thisYear = DateTime.now().year.toString();

class AppResponseCode {

  static const SUCCESS = 7000;
  static const RECORD_DOES_NOT_EXISTS = 7001;
  static const VALIDATION_ERROR = 7003;
  static const INTERNAL_SERVER_ERROR = 7004;
  static const FAILURE = 7005;
  static const SESSION_EXPIRED = 401;
  static const EXCEPTION = 500;
}