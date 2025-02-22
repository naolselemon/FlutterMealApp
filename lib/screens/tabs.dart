import 'package:flutter/material.dart';

import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
  final List<Meal> favoritesMeal = [];
  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _setDrawerScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "Filters") {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(label: 'Undo', onPressed: () {}),
    ));
  }

  void _toggleMealFavoritesStatus(Meal meal) {
    // Update meal's favorite status
    final isExisting = favoritesMeal.contains(meal);

    if (isExisting) {
      setState(() {
        favoritesMeal.remove(meal);
      });
      _showMessage("Favorites removed successfully");
    } else {
      setState(() {
        favoritesMeal.add(meal);
      });
      _showMessage("Favorites added!");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onSelectMeal: _toggleMealFavoritesStatus,
    );
    String activePageTitle = "Categories";

    if (selectedIndex == 1) {
      activePage = Meals(
        onSelectMeal: _toggleMealFavoritesStatus,
        meals: favoritesMeal,
      );
      activePageTitle = "Your Favorites";
    }

    return Scaffold(
      drawer: MainDrawer(
        onDrawerItemSelect: _setDrawerScreen,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}
