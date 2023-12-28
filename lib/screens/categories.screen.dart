import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals.screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../data/data.dart';
import '../models/categories.model.dart';
import '../models/meals.model.dart';
import '../services/api.service.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.allCategories, super.key});

  final List<Category> allCategories;

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
        for (final el in allCategories)
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

  List<MealCategory> _parseCategories(String responseBody){
    final parsed = jsonDecode(responseBody)["categories"];
    return parsed.map<MealCategory>((json) => MealCategory.fromJson(json)).toList();
  }

  Future<List<MealCategory>> _getAllMealCategories() async {
     final response = await ApiService.getAllCategories();
     final list = _parseCategories(response.body);
     return list;
  }

}
