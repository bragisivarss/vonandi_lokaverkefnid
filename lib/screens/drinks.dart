import 'package:flutter/material.dart';
import 'package:lokaverkefni/screens/add_drink.dart';
import 'package:lokaverkefni/widgets/drinks_list.dart';
import 'package:lokaverkefni/widgets/main_drawer.dart';

class DrinksScreen extends StatelessWidget {
  const DrinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text(
          'Drinks Overview',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AddDrinkScreen(),),);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: DrinksList(
        drinks: [],
      ),
    );
  }
}
