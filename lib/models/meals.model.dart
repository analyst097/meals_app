enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}


class MealCategory{
  MealCategory({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryDescription,
    required this.strCategoryThumb,
  });

  final String idCategory;
  final String strCategory;
  final String strCategoryDescription;
  final String strCategoryThumb;

  factory MealCategory.fromJson(Map<String, dynamic> json){
    return MealCategory(
        idCategory: json["idCategory"] as String,
        strCategory: json["strCategory"] as String,
        strCategoryDescription: json["strCategoryDescription"] as String,
        strCategoryThumb: json["strCategoryThumb"] as String);
  }
}