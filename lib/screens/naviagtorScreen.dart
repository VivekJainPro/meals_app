import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_app/models/catergorey.dart';
import 'package:trial_app/providers/meals_provider.dart';
import 'package:trial_app/screens/drawerScreen.dart';
import 'package:trial_app/screens/filterScreen.dart';
import 'package:trial_app/screens/homescreen.dart';
import 'package:trial_app/screens/mealscreen.dart';
import 'package:trial_app/providers/favourites_provider.dart';
import 'package:trial_app/providers/filters_provider.dart';

class NavigatorScreen extends ConsumerStatefulWidget {
  const NavigatorScreen({super.key});

  @override
  ConsumerState<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends ConsumerState<NavigatorScreen> {
  int _currIndex = 0;

  screenChanger(int index) {
    setState(() {
      _currIndex = index;
    });
  }

  void _toFilterScreen() async {
    Navigator.of(context).pop();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FilterScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilter = ref.watch(FilterProvider);
    final availableMeals = meals.where(
      (element) {
        if (activeFilter[Filter.glutenFree]! && !element.isGlutenFree) {
          return false;
        }
        if (activeFilter[Filter.lactoseFree]! && !element.isLactoseFree) {
          return false;
        }
        if (activeFilter[Filter.vegetarian]! && !element.isVegetarian) {
          return false;
        }
        if (activeFilter[Filter.vegan]! && !element.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();

    Widget currScreen = HomeScreen(
      availableMeals: availableMeals,
    );
    Text titleText = Text('Welcome to the meals app');

    if (_currIndex == 1) {
      final favMeals = ref.watch(FavouritesProvider);
      titleText = Text('Your favourites');
      currScreen = MealScreen(
        categorey: Categorey(
            id: 'favourites', title: 'favourites', color: Colors.pink),
        mealsToDisplay: favMeals,
      );
    } else {
      titleText = Text('Categories');
      currScreen = HomeScreen(
        availableMeals: availableMeals,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: titleText,
      ),
      drawer: DrawerScreen(
        toFilterScreen: _toFilterScreen,
      ),
      body: currScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        onTap: (index) {
          screenChanger(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.rice_bowl), label: "meals"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favs"),
        ],
      ),
    );
  }
}
