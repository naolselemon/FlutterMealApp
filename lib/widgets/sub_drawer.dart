import 'package:flutter/material.dart';

class SubDrawer extends StatelessWidget {
  const SubDrawer(
      {super.key,
      required this.icon,
      required this.label,
      required this.onDrawerItemClick});
  final IconData icon;
  final String label;
  final void Function(String identifier) onDrawerItemClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24,
            ),
      ),
      onTap: () {
        onDrawerItemClick(label);
      },
    );
  }
}
