import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_dart.dart';

import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  int selectedIndex = 0;
  final List<Meal> favoritesMeal = [];
  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _setDrawerScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "Filters") {
      final result = await Navigator.push<Map<Filter, bool>>(
          context,
          MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                    setFilterState: _selectedFilters,
                  )));
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
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
    final availableMeals = dummyMeals.where((meal) {
      // how this magic works:
      // false -  make the meal do not added to the list so initially selectedFilters set to false
      // there is no way for if block to execute which means where() returns TRUE so there is no data that drop out.
      // but if one of filter set to true then if block executes which means false returned( the meal drop out).
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      onSelectMeal: _toggleMealFavoritesStatus,
      availableMeals: availableMeals,
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
