import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detial.dart';

import 'package:meal_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _selectedMeal(BuildContext context, Meal meal) {
    // Implement navigation to MealDetails page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetial(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      widthFactor: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "There is no data here!",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "please try other category",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onMealSelected: (meal) {
                _selectedMeal(context, meal);
              }));
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
