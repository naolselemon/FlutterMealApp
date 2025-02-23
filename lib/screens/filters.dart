import 'package:flutter/material.dart';

import 'package:meal_app/widgets/filter_items.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.setFilterState});

  final Map<Filter, bool> setFilterState;

  @override
  State<FiltersScreen> createState() {
    return _Filters();
  }
}

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class _Filters extends State<FiltersScreen> {
  var glutenFree = false;
  var lactoseFree = false;
  var vegetarian = false;
  var vegan = false;

  Map<Filter, bool> _getFilters() {
    return {
      Filter.glutenFree: glutenFree,
      Filter.lactoseFree: lactoseFree,
      Filter.vegetarian: vegetarian,
      Filter.vegan: vegan,
    };
  }

  bool _onWillPop() {
    Navigator.of(context).pop(_getFilters());
    return false;
  }

  @override
  void initState() {
    super.initState();
    glutenFree = widget.setFilterState[Filter.glutenFree]!;
    lactoseFree = widget.setFilterState[Filter.lactoseFree]!;
    vegetarian = widget.setFilterState[Filter.vegetarian]!;
    vegan = widget.setFilterState[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            _onWillPop();
          },
          child: Column(
            children: [
              FilterItems(
                  title: "Gluten-free",
                  subTitle: "Includes gluten free only.",
                  initialState: glutenFree,
                  onChanged: (newState) => setState(() {
                        glutenFree = newState;
                      })),
              FilterItems(
                  title: "Lactose-free",
                  subTitle: "Includes lactose free only.",
                  initialState: lactoseFree,
                  onChanged: (newState) => setState(() {
                        lactoseFree = newState;
                      })),
              FilterItems(
                  title: "Vegeterian",
                  subTitle: "Includes vegeterian only.",
                  initialState: vegetarian,
                  onChanged: (newState) => setState(() {
                        vegetarian = newState;
                      })),
              FilterItems(
                  title: "Vegan",
                  subTitle: "Includes vegan only.",
                  initialState: vegan,
                  onChanged: (newState) => setState(() {
                        vegan = newState;
                      })),
            ],
          )),
    );
  }
}
