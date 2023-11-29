import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lokaverkefni/models/drink.dart';
import 'package:lokaverkefni/models/user.dart';
import 'package:lokaverkefni/screens/drink_details.dart';

class DrinksList extends ConsumerWidget {
  const DrinksList(
      {super.key, required this.drinks, required this.selectedUser});

  final Users selectedUser;

  final List<Drink> drinks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (drinks.isEmpty) {
      return Center(
        child: Text(
          'No reviews added yet',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      );
    }

    return ListView.builder(
      itemCount: drinks.length,
      itemBuilder: (ctx, index) => ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: FileImage(drinks[index].image),
        ),
        title: Text(
          drinks[index].title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(
          'Rating: ${drinks[index].rating}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => DrinkDetailScreen(
                drink: drinks[index],
                selectedUser: selectedUser,
              ),
            ),
          );
        },
      ),
    );
  }
}
