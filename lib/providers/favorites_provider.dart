import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lokaverkefni/models/drink.dart';
import 'package:lokaverkefni/models/user.dart';

//Provide for the consumer widget so i dont have to move every information around all screens to acces it
//where i need it and makes it easier to save data and access it anywhere

final favoriteDrinksProvider = Provider<List<Drink>>((ref) {
  return [];
});

final favoriteDrinksNotifierProvider =
    StateNotifierProvider<FavoriteDrinksNotifier, List<Drink>>(
  (ref) => FavoriteDrinksNotifier(),
);

class FavoriteDrinksNotifier extends StateNotifier<List<Drink>> {
  FavoriteDrinksNotifier() : super(const []);

  void addFavoriteDrink(Drink drink, Users userId) {
    state = [drink, ...state];
  }

  void removeFavoriteDrink(Drink drink, Users userId) {
    state = state.where((favoriteDrink) => favoriteDrink != drink).toList();
  }
}
