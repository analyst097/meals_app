import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals.screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../data/data.dart';
import '../models/categories.model.dart';
import '../models/meals.model.dart';
import '../services/api.service.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({required this.allCategories, super.key});

  final List<Category> allCategories;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          children: [
            for (final el in widget.allCategories)
              CategoryGridItem(
                category: el,
                selectCategory: _selectCategory,
              )
          ],
        ),
        builder: (context, child) => SlideTransition(
            position:
                Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
                    .animate(CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut)),
            child: child));
  }

  void _selectCategory(BuildContext context, Category category) {
    final meals =
        dummyMeals.where((el) => el.categories.contains(category.id)).toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                MealsScreen(title: category.title, meals: meals)));
  }

  List<MealCategory> _parseCategories(String responseBody) {
    final parsed = jsonDecode(responseBody)["categories"];
    return parsed
        .map<MealCategory>((json) => MealCategory.fromJson(json))
        .toList();
  }

  Future<List<MealCategory>> _getAllMealCategories() async {
    final response = await ApiService.getAllCategories();
    final list = _parseCategories(response.body);
    return list;
  }
}
