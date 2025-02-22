import 'package:flutter/material.dart';
import 'package:meal_app/widgets/sub_drawer.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onDrawerItemSelect});

  final void Function(String identifier) onDrawerItemSelect;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Text('Cooking up!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        )),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SubDrawer(
            icon: Icons.restaurant,
            label: "Meals",
            onDrawerItemClick: (identifier) => onDrawerItemSelect("Meals"),
          ),
          SubDrawer(
            icon: Icons.settings,
            label: "Filters",
            onDrawerItemClick: (identifier) => onDrawerItemSelect("Filters"),
          )
        ],
      ),
    );
  }
}
