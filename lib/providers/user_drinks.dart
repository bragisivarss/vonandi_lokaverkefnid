import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'package:lokaverkefni/models/drink.dart';

class UserDrinksNotifier extends StateNotifier<List<Drink>> {
  UserDrinksNotifier() : super(const []);

  void addPlace({required String title, required String about, required double rating, required File image, required String userId, required String username}) {
    final newDrink = Drink(title: title, about: about, rating: rating, image: image, userId: userId, username: username);
    state = [newDrink, ...state];
  }
}

final userDrinksProvide = StateNotifierProvider<UserDrinksNotifier, List<Drink>>(
  (ref) => UserDrinksNotifier(),
);
