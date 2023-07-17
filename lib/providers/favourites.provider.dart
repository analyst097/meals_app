
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.model.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier(): super([]);

  bool toggleFavMealStatus(Meal meal){
    final isMealfavourite = state.contains(meal);

    if(isMealfavourite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }

}

final favouriteMealsProvider =
  StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) => FavouriteMealsNotifier());