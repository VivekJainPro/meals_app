import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_app/models/mealsmodel.dart';
import 'package:trial_app/providers/favourites_provider.dart';

class MealInfoScreen extends ConsumerWidget {
  const MealInfoScreen({super.key, required this.currMeal});
  final Meal currMeal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favMeals = ref.watch(FavouritesProvider);
    final isFav = favMeals.contains(currMeal);

    return Scaffold(
      appBar: AppBar(
        title: Text(currMeal.title),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {
              bool wasAdded =
                  ref.read(FavouritesProvider.notifier).toggleFavMeal(currMeal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded
                      ? 'Added to Favourites'
                      : 'Removed from Favourites'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
              child: Icon(
                isFav ? Icons.star : Icons.star_border_outlined,
                key: ValueKey(isFav),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: currMeal.id,
                child: Image.network(
                  currMeal.imageUrl,
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
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
