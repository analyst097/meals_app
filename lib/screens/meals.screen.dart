import 'package:flutter/material.dart';

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
      content = const Center(child: Text("No Meals."),);
    } else {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => Text(meals[index].title)
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
