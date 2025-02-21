import 'package:flutter/material.dart';

import 'package:meal_app/data/dummy_dart.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/catergory_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    // TODO: Navigate to the corresponding screen when a category is selected
    final filteredMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: filteredMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Category"),
      ),
      body: GridView(
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
            )
        ],
      ),
    );
  }
}
