import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/drink.dart';

class DrinksList extends StatelessWidget {
  const DrinksList({super.key, required this.drinks});

  final List<Drink> drinks;

  @override
  Widget build(BuildContext context) {
    if (drinks.isEmpty) {
      return Center(
        child: Text('No reviews added yet',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary),
        ),
      );
    }

    return ListView.builder(
      itemCount: drinks.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(
          drinks[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
