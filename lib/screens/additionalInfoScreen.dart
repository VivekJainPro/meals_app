import 'package:flutter/material.dart';
import 'package:trial_app/models/mealsmodel.dart';

class MealInfoScreen extends StatelessWidget {
  const MealInfoScreen(
      {super.key, required this.currMeal, required this.toggleFavourite});
  final Meal currMeal;
  final void Function(Meal thisMeal) toggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currMeal.title),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {
              toggleFavourite(currMeal);
            },
            icon: Icon(Icons.star),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                currMeal.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ingredients:",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              for (int i = 0; i < currMeal.ingredients.length; i++)
                Text(
                  '${i + 1})${currMeal.ingredients[i]}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  textAlign: TextAlign.left,
                ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Recipe:",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              for (int i = 0; i < currMeal.steps.length; i++)
                Text(
                  '${i + 1})${currMeal.steps[i]}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  textAlign: TextAlign.left,
                )
            ],
          ),
        ),
      ),
    );
  }
}
