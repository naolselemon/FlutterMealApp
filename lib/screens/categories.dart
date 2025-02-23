import 'package:flutter/material.dart';

import 'package:meal_app/data/dummy_dart.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/catergory_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key, required this.onSelectMeal, required this.availableMeals});

  final void Function(Meal meal) onSelectMeal;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    //Navigate to the corresponding screen when a category is selected
    final filteredMeal = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Meals(
          title: category.title,
          meals: filteredMeal,
          onSelectMeal: onSelectMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        //availableCategories.map(category=> CategoryItem(category: category)) -- this is alternative for for loop
        for (final categoryitem in availableCategories)
          CatergoryItem(
            category: categoryitem,
            onSelectCategory: () {
              _selectCategory(context, categoryitem);
            },
          ),
      ],
    );
  }
}
