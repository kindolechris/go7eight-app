class DropDownValueModel {
  final String name;
  final dynamic value;


  const DropDownValueModel(
      {required this.name, required this.value});

  factory DropDownValueModel.fromJson(Map<String, dynamic> json) =>
      DropDownValueModel(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
  };

}