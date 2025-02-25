import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

import 'package:meal_app/widgets/filter_items.dart';
import "package:meal_app/provider/filters_provider.dart";

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterStatus = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          FilterItems(
              title: "Gluten-free",
              subTitle: "Includes gluten free only.",
              initialState: filterStatus[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              }),
          FilterItems(
              title: "Lactose-free",
              subTitle: "Includes lactose free only.",
              initialState: filterStatus[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              }),
          FilterItems(
              title: "Vegeterian",
              subTitle: "Includes vegeterian only.",
              initialState: filterStatus[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              }),
          FilterItems(
              title: "Vegan",
              subTitle: "Includes vegan only.",
              initialState: filterStatus[Filter.vegan]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              }),
        ],
      ),
    );
  }
}
