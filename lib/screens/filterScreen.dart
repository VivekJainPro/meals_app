import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key, required this.selectedFilters});
  Map<Filter, bool> selectedFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFreeVal = false;
  bool _isLactoseFreeVal = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {
    _isGlutenFreeVal = widget.selectedFilters[Filter.glutenFree]!;
    _isLactoseFreeVal = widget.selectedFilters[Filter.lactoseFree]!;
    _isVegetarian = widget.selectedFilters[Filter.vegetarian]!;
    _isVegan = widget.selectedFilters[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          // Navigator.of(context).pop();
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFreeVal,
            Filter.lactoseFree: _isLactoseFreeVal,
            Filter.vegetarian: _isVegetarian,
            Filter.vegan: _isVegan,
          });
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Filter Screen'),
          ),
          body: Column(
            children: [
              SwitchListTile(
                value: _isGlutenFreeVal,
                onChanged: (isChecked) {
                  setState(() {
                    _isGlutenFreeVal = isChecked;
                  });
                },
                title: Text(
                  'Gluten-Free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 25),
                ),
                subtitle: Text(
                  'The meal contains no gluten.',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20),
                ),
              ),
              SwitchListTile(
                value: _isLactoseFreeVal,
                onChanged: (isChecked) {
                  setState(() {
                    _isLactoseFreeVal = isChecked;
                  });
                },
                title: Text(
                  'Lactose-Free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 25),
                ),
                subtitle: Text(
                  'Only include lactose-free meal.',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20),
                ),
              ),
              SwitchListTile(
                value: _isVegetarian,
                onChanged: (isChecked) {
                  setState(() {
                    _isVegetarian = isChecked;
                  });
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 25),
                ),
                subtitle: Text(
                  'The meal is purely vegetarian.',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20),
                ),
              ),
              SwitchListTile(
                value: _isVegan,
                onChanged: (isChecked) {
                  setState(() {
                    _isVegan = isChecked;
                  });
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 25),
                ),
                subtitle: Text(
                  'Vegan meals only.',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ));
  }
}
