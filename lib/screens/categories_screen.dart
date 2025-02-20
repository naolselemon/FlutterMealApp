import 'package:flutter/material.dart';

import 'package:meal_app/data/data.dart';
import 'package:meal_app/widgets/catergory_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
            CatergoryItem(category: categoryitem)
        ],
      ),
    );
  }
}
