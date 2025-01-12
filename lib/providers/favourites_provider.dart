import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_app/models/mealsmodel.dart';

class FavouritesNotifier extends StateNotifier<List<Meal>> {
  FavouritesNotifier() : super([]);

  bool toggleFavMeal(Meal meal) {
    if (state.contains(meal)) {
      state = state
          .where(
            (element) => element.id != meal.id,
          )
          .toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final FavouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<Meal>>((ref) {
  return FavouritesNotifier();
});
