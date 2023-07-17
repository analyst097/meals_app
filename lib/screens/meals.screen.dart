import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meals.model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    required this.title,
    required this.meals,
    super.key
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if(meals.isEmpty){
      content = const Center(child: Text("Nothing here."),);
    } else {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(meal: meals[index])
      );
    }
    if(title.toLowerCase() == 'favourites'){
      return Scaffold(
        body: Container(
            child: content
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: content
      ),
    );
  }
}
