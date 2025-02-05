class AdvertisementModel{
  int? id;
  String? title;
  String? imagePath;
  void Function()? gotoScreen;
  bool isSelected;


  AdvertisementModel({
    this.id,
    this.title,
    this.imagePath,
    this.gotoScreen,
    this.isSelected=false
  });
}