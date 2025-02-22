import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealItemDetail extends StatelessWidget {
  const MealItemDetail({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          meal.imageUrl,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Ingredients",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        for (final ingredient in meal.ingredients)
          Text(
            ingredient,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
            textAlign: TextAlign.center,
          ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Steps",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        for (final step in meal.steps)
          Text(
            step,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
            textAlign: TextAlign.center,
          )
      ],
    );
  }
}
