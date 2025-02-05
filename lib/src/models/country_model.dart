// country_model.dart
class CountryModel {
  final String? name;
  final String? code;
  final String? flag;
  final String? mask;
  final String? dialCode;

  CountryModel({
    this.name,
    this.code,
    this.flag,
    this.mask,
    this.dialCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      code: json['code'],
      flag: json['flag'],
      mask: json['mask'],
      dialCode: json['code'], // Assuming the dial code is in the 'code' field
    );
  }

  static List<CountryModel> listFromJson(List<Map<String, String>> list) {
    return list.map((json) => CountryModel(
      name: json['name'],
      code: json['code'],
      flag: json['flag'],
      mask: json['mask'],
      dialCode: json['code'], // Assuming the dial code is in the 'code' field
    )).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'flag': flag,
      'mask': mask,
      'dialCode': dialCode,
    };
  }
}