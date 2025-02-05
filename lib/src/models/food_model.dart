
class FoodModel{
  int? id;
  String? title;
  String? desc;
  String? imagePath;
  String? mealType;
  String? totalCalories;
  String? totalProteins;
  String? totalFats;
  String? totalCarbs;
  String? duration;
  bool? isBookmarked;

  FoodModel({
    this.id,
    this.title,
    this.desc,
    this.imagePath,
    this.totalCalories,
    this.totalProteins,
    this.mealType,
    this.totalFats,
    this.totalCarbs,
    this.duration,
    this.isBookmarked
  });
}
