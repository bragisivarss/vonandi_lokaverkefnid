import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lokaverkefni/models/drink.dart';

final favoriteDrinksProvider = Provider<List<Drink>>((ref) {
  return [];
});

final favoriteDrinksNotifierProvider =
    StateNotifierProvider<FavoriteDrinksNotifier, List<Drink>>(
  (ref) => FavoriteDrinksNotifier(),
);

class FavoriteDrinksNotifier extends StateNotifier<List<Drink>> {
  FavoriteDrinksNotifier() : super(const []);

  void addFavoriteDrink(Drink drink) {
    state = [drink, ...state];
  }

  void removeFavoriteDrink(Drink drink) {
    state = state.where((favoriteDrink) => favoriteDrink != drink).toList();
  }

  bool isFavorite(Drink drink) {
    return state.contains(drink);
  }
}
