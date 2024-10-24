import 'package:flutter/material.dart';
import 'package:trial_app/data/dummy_data.dart';
import 'package:trial_app/models/mealsmodel.dart';
import 'package:trial_app/widgets/category_widget.dart';

import '../models/catergorey.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.toggleFavourite, required this.availableMeals});
  final void Function(Meal thisMeal) toggleFavourite;
  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (Categorey availableCategory in availableCategories)
          CategoryWidget(
              availableMeals: availableMeals,
              toggleFavourite: toggleFavourite,
              categorey: availableCategory),
      ],
    );
  }
}
