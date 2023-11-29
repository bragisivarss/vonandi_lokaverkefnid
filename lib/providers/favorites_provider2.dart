import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lokaverkefni/models/drink.dart';
import 'package:lokaverkefni/models/user.dart';

//Provider for favorites for user 2

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
