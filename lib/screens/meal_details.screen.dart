import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourites.provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meals.model.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Details"),
        actions: [
          IconButton(
              onPressed: (){
                final isAdded = ref.read(favouriteMealsProvider.notifier)
                    .toggleFavMealStatus(meal);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(isAdded ? 'Added to favourites' : 'Removed from favourites'))
                );
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage) ,
                  image: NetworkImage(meal.imageUrl)
              ),
              const SizedBox(height: 12,),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Row(
                    children: [
                      const Text("Duration: "),
                      Text("${meal.duration} min")
                    ],
                  )
              ),Container(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Row(
                    children: [
                      Text(meal.isVegetarian ? "Vegetarian" : "Non-vegetarian"),
                    ],
                  )
              ),Container(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Text(("Ingredients: ${meal.ingredients.join(",")}")))
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
