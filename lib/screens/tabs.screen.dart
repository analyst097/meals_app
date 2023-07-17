import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/categories.provider.dart';
import 'package:meals_app/providers/favourites.provider.dart';
import 'package:meals_app/screens/categories.screen.dart';
import 'package:meals_app/screens/meals.screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  int _activeTab = 0;

  _selectPage(int index){
    setState(() {
      _activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allCategories = ref.watch(categoriesProvider);
    Widget activePage = CategoriesScreen(allCategories: allCategories,);
    String activePageTitle = "Categories";
    if(_activeTab == 1) {
      final favMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(title: "Favourites", meals: favMeals);
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
