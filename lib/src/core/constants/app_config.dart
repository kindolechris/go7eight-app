
var thisYear = DateTime.now().year.toString();

class AppConfig {

  static String defaultLanguage = "en";

   static const bool https = true;

  static const domainPath = "fitnofy.com/backend";

  static const String apiEndPath = "api/";

  static const String protocol = https ? "https://" : "http://";
  static const String rawBaseUrl = "$protocol$domainPath";
  static const String baseUrl = "$rawBaseUrl/$apiEndPath";
}