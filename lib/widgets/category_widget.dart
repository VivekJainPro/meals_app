import 'package:flutter/material.dart';
import 'package:trial_app/models/catergorey.dart';
import 'package:trial_app/models/mealsmodel.dart';
import 'package:trial_app/screens/mealscreen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key,
      required this.categorey,
      required this.toggleFavourite,
      required this.availableMeals});

  final List<Meal> availableMeals;
  final Categorey categorey;
  final void Function(Meal thisMeal) toggleFavourite;

  @override
  Widget build(BuildContext context) {
    void navigateToMeals(BuildContext context, Categorey categorey) {
      var filteredMeals = availableMeals
          .where(
            (meal) => meal.categories.contains(categorey.id),
          )
          .toList();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MealScreen(
              toggleFavourite: toggleFavourite,
              mealsToDisplay: filteredMeals,
              title: categorey.title),
        ),
      );
    }

    return InkWell(
      splashColor: categorey.color,
      onTap: () {
        navigateToMeals(context, categorey);
      },
      borderRadius: BorderRadius.circular(23),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [categorey.color, categorey.color.withOpacity(0.2)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categorey.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
