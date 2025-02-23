import 'package:flutter/material.dart';

class FilterItems extends StatelessWidget {
  const FilterItems({
    super.key,
    required this.title,
    required this.subTitle,
    required this.initialState,
    required this.onChanged,
  });

  final String title;
  final String subTitle;
  final bool initialState;
  final ValueChanged<bool>? onChanged;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: initialState,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 20),
    );
  }
}
