import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/models/meal.dart';
import 'package:meal_app/provider/filters_provider.dart';
import 'package:meal_app/provider/meals_provider.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // specify what this state will handle
  FavoriteMealsNotifier() : super([]);

  bool toggleFavoriteMealsStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
      // where is immutable. Which means it create new list.
    }

    state = [...state, meal];

    return true;
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());

final availableMealsProvider = Provider((ref) {
  final meals = ref.read(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    // how this magic works:
    // false -  make the meal do not added to the list so initially selectedFilters set to false
    // there is no way for if block to execute which means where() returns TRUE so there is no data that drop out.
    // but if one of filter set to true then if block executes which means false returned( the meal drop out).
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
