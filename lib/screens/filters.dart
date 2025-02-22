import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _Filters();
  }
}

class _Filters extends State<FiltersScreen> {
  var _glutenFreeSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            tileColor:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            value: _glutenFreeSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeSet = isChecked;
              });
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Includes gluten free only.",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.all(20),
          )
        ],
      ),
    );
  }
}
