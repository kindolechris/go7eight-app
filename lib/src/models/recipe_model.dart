class RecipeModel{
  int? id;
  String? title;
  String? desc;
  String? imagePath;
  String? totalCalories;
  String? totalProteins;
  String? totalFats;
  String? totalCarbs;
  String? duration;
  bool? isBookmarked;

  RecipeModel({
    this.id,
    this.title,
    this.desc,
    this.imagePath,
    this.totalCalories,
    this.totalProteins,
    this.totalFats,
    this.totalCarbs,
    this.duration,
    this.isBookmarked
  });
}
