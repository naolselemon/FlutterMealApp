import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detial.dart';

import 'package:meal_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void _selectedMeal(BuildContext context, Meal meal) {
    // TODO: Implement navigation to MealDetails page
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Oh..no there is no data here",
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

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
