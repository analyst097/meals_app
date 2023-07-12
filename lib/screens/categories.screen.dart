import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals.screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../data/data.dart';
import '../models/categories.model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      children: [
        for (final el in availableCategories)
          CategoryGridItem(category: el, selectCategory: _selectCategory,)
      ],
    );
  }

  void _selectCategory(BuildContext context, Category category){
    final meals = dummyMeals.where((el) => el.categories.contains(category.id)).toList();
    Navigator.push(
        context, 
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(title: category.title, meals: meals)
        )
    );
  }
}
