import 'package:flutter/material.dart';

import '../models/categories.model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    required this.category,
    required this.selectCategory,
    super.key
  });

  final Category category;
  final void Function(BuildContext context, Category category) selectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectCategory(context, category);
        },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.55),
                category.color.withOpacity(0.9)
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Text(category.title),
      ),
    );
  }
}
