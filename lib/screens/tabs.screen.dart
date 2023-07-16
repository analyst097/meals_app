import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.screen.dart';
import 'package:meals_app/screens/meals.screen.dart';

import '../data/data.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _activeTab = 0;

  _selectPage(int index){
    setState(() {
      _activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen();
    String activePageTitle = "Categories";
    if(_activeTab == 1) {
      activePage = const MealsScreen(title: "Favorites", meals: []);
      activePageTitle = "My Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeTab,
        onTap: (index){_selectPage(index);},
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
          ]
      ),
    );
  }
}
