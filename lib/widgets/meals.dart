import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:trial_app/models/mealsmodel.dart';
import 'package:trial_app/screens/additionalInfoScreen.dart';
import 'package:trial_app/widgets/meal_item_trait.dart';

class Meals extends StatelessWidget {
  const Meals(
      {super.key, required this.currMeal, required this.toggleFavourite});
  final Meal currMeal;
  final void Function(Meal thisMeal) toggleFavourite;
  String get formattedAffordability {
    return currMeal.affordability.name[0].toUpperCase() +
        currMeal.affordability.name.substring(1);
  }

  String get formattedComplexity {
    return currMeal.complexity.name[0].toUpperCase() +
        currMeal.complexity.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    void NavigateToDetails() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealInfoScreen(
            toggleFavourite: toggleFavourite,
            currMeal: currMeal,
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        NavigateToDetails();
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(currMeal.imageUrl),
              fit: BoxFit.cover,
              height: 240,
              width: double.infinity,
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(232, 0, 0, 0),
                    const Color.fromARGB(122, 0, 0, 0)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      currMeal.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealTraits(
                          icun: Bootstrap.clock_fill,
                          dayta: '${currMeal.duration} min',
                        ),
                        MealTraits(
                          icun: Bootstrap.cash,
                          dayta: formattedAffordability,
                        ),
                        MealTraits(
                          icun: Icons.handyman_rounded,
                          dayta: formattedComplexity,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
