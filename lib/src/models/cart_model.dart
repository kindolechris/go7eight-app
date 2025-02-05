

class CartModel{
  int? id;
  String? imagePath;
  String? name;
  String? desc;
  String? price;
  List<CartMacroModel>? macros;
  bool isFavorite;

  CartModel({
    this.id,
    this.imagePath,
    this.name,
    this.desc,
    this.price,
    this.macros,
    this.isFavorite=false
  });
}

class CartMacroModel{
  int? id;
  String? value;
  String? iconPath;
  String? unit;

  CartMacroModel({
    this.id,
    this.value,
    this.unit,
    this.iconPath,
  });
}