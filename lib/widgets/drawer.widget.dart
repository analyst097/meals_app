import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.primaryContainer,
                        Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
                      ]
                  )
                ),
                child: const Row(
                  children: [
                    Icon(Icons.fastfood, size: 40,),
                    SizedBox(width: 20,),
                    Text("Meals App", style: TextStyle(fontSize: 20),)
                  ],
                )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 10,),
                  Text("Home", style: TextStyle(fontSize: 16),),
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Icon(Icons.category),
                  SizedBox(width: 10,),
                  Text("Categories", style: TextStyle(fontSize: 16),),
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Icon(Icons.star),
                  SizedBox(width: 10,),
                  Text("Favorites", style: TextStyle(fontSize: 16),),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
