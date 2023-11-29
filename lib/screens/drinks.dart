import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lokaverkefni/models/user.dart';
import 'package:lokaverkefni/providers/user_drinks.dart';
import 'package:lokaverkefni/screens/add_drink.dart';
import 'package:lokaverkefni/widgets/drinks_list.dart';
import 'package:lokaverkefni/widgets/main_drawer.dart';

//This is the main page where you go from login page
//from here you can view your favorite drinks view reviews from other users
//and navigate to the drink detail screen

class DrinksScreen extends ConsumerWidget {
  const DrinksScreen({super.key, required this.selectedUser});

  final Users selectedUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDrinks = ref.watch(userDrinksProvide);

    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color.fromARGB(116, 255, 13, 13),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          'Drinks Overview - ${selectedUser.name}',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddDrinkScreen(selectedUser: selectedUser),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DrinksList(
          drinks: userDrinks,
          selectedUser: selectedUser,
        ),
      ),
    );
  }
}
