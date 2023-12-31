import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lokaverkefni/models/drink.dart';
import 'package:lokaverkefni/models/user.dart';

//Provider for favorites for user 1

final favoriteDrinksProvider1 = Provider<List<Drink>>((ref) {
  return [];
});

final favoriteDrinksNotifierProvider1 =
    StateNotifierProvider<FavoriteDrinksNotifier1, List<Drink>>(
  (ref) => FavoriteDrinksNotifier1(),
);

class FavoriteDrinksNotifier1 extends StateNotifier<List<Drink>> {
  FavoriteDrinksNotifier1() : super(const []);

  void addFavoriteDrink(Drink drink, Users userId) {
    state = [drink, ...state];
  }

  void removeFavoriteDrink(Drink drink, Users userId) {
    state = state.where((favoriteDrink) => favoriteDrink != drink).toList();
  }
}

final favoriteDrinksProvider2 = Provider<List<Drink>>((ref) {
  return [];
});

final favoriteDrinksNotifierProvider2 =
    StateNotifierProvider<FavoriteDrinksNotifier2, List<Drink>>(
  (ref) => FavoriteDrinksNotifier2(),
);

class FavoriteDrinksNotifier2 extends StateNotifier<List<Drink>> {
  FavoriteDrinksNotifier2() : super(const []);

  void addFavoriteDrink(Drink drink, Users userId) {
    state = [drink, ...state];
  }

  void removeFavoriteDrink(Drink drink, Users userId) {
    state = state.where((favoriteDrink) => favoriteDrink != drink).toList();
  }
}
