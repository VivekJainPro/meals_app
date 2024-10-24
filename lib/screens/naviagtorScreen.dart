import 'package:flutter/material.dart';
import 'package:trial_app/models/mealsmodel.dart';
import 'package:trial_app/screens/drawerScreen.dart';
import 'package:trial_app/screens/filterScreen.dart';
import 'package:trial_app/screens/homescreen.dart';
import 'package:trial_app/data/dummy_data.dart';
import 'package:trial_app/screens/mealscreen.dart';

const kinitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _currIndex = 0;
  final List<Meal> _favMeals = [];
  Map<Filter, bool> _selectedFilters = const {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  };

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void toggleFavourite(Meal thisMeal) {
    setState(() {
      if (_favMeals.contains(thisMeal)) {
        _favMeals.remove(thisMeal);
        _showMessage('${thisMeal.title} removed from favourites.');
      } else {
        _favMeals.add(thisMeal);
        _showMessage('${thisMeal.title} added to favourites.');
      }
    });
  }

  screenChanger(int index) {
    setState(() {
      _currIndex = index;
    });
  }

  void _toFilterScreen() async {
    Navigator.of(context).pop();
    final filterResult = await Navigator.of(context).push<Map<Filter, bool>>(
      MaterialPageRoute(
        builder: (context) => FilterScreen(selectedFilters: _selectedFilters),
      ),
    );
    setState(() {
      _selectedFilters = filterResult ?? kinitialFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where(
      (element) {
        if (_selectedFilters[Filter.glutenFree]! && !element.isGlutenFree) {
          return false;
        }
        if (_selectedFilters[Filter.lactoseFree]! && !element.isLactoseFree) {
          return false;
        }
        if (_selectedFilters[Filter.vegetarian]! && !element.isVegetarian) {
          return false;
        }
        if (_selectedFilters[Filter.vegan]! && !element.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();

    Widget currScreen = HomeScreen(
      availableMeals: availableMeals,
      toggleFavourite: toggleFavourite,
    );
    Text titleText = Text('Welcome to the meals app');

    if (_currIndex == 1) {
      titleText = Text('Your favourites');
      currScreen = MealScreen(
        toggleFavourite: toggleFavourite,
        mealsToDisplay: _favMeals,
      );
    } else {
      titleText = Text('Categories');
      currScreen = HomeScreen(
        availableMeals: availableMeals,
        toggleFavourite: toggleFavourite,
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
