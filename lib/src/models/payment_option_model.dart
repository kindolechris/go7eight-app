
class PaymentOptionModel{
  int? id;
  String? iconPath;
  String? name;
  String? desc;
  bool isSelected;

  PaymentOptionModel({
    this.id,
    this.iconPath,
    this.name,
    this.desc,
    this.isSelected=false
  });
}