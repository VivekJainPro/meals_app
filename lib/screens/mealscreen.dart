import 'package:flutter/material.dart';
import 'package:trial_app/models/mealsmodel.dart';
import 'package:trial_app/widgets/meals.dart';

class MealScreen extends StatelessWidget {
  final List<Meal> mealsToDisplay;
  final String? title;
  final void Function(Meal thisMeal) toggleFavourite;

  const MealScreen(
      {super.key,
      required this.mealsToDisplay,
      this.title,
      required this.toggleFavourite});

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
              return Meals(
                  toggleFavourite: toggleFavourite,
                  currMeal: mealsToDisplay[index]);
            });

    if (title == null) {
      return currScreen;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: currScreen);
  }
}
