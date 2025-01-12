import 'package:flutter/material.dart';
import 'package:trial_app/models/catergorey.dart';
import 'package:trial_app/models/mealsmodel.dart';
import 'package:trial_app/widgets/meals.dart';

class MealScreen extends StatelessWidget {
  final List<Meal> mealsToDisplay;
  final Categorey categorey;

  const MealScreen({
    super.key,
    required this.mealsToDisplay,
    required this.categorey,
  });

  @override
  Widget build(BuildContext context) {
    Widget currScreen = mealsToDisplay.isEmpty
        ? Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nothing to display",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  )
                ],
              ),
            ),
          )
        : ListView.builder(
            itemCount: mealsToDisplay.length,
            itemBuilder: (context, index) {
              return Meals(currMeal: mealsToDisplay[index]);
            });

    return Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: categorey.id,
            child: Text(
              categorey.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        body: currScreen);
  }
}
