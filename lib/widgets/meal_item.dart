import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details.screen.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meals.model.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    required this.meal,
    super.key
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => MealDetailsScreen(meal)
              )
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage) ,
              image: NetworkImage(meal.imageUrl)
            ),
            Positioned(
              bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                          fontSize: 18,
                        ),
                      ),

                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
