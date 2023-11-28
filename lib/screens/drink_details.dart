import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lokaverkefni/models/drink.dart';
import 'package:lokaverkefni/models/users.dart';
import 'package:lokaverkefni/providers/favorites_provider.dart';

class DrinkDetailScreen extends ConsumerWidget {
  const DrinkDetailScreen({
    super.key,
    required this.drink,
    required this.selectedUser,
  });

  final Users selectedUser;

  final Drink drink;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite =
        ref.watch(favoriteDrinksNotifierProvider).contains(drink);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (isFavorite) {
                ref
                    .read(favoriteDrinksNotifierProvider.notifier)
                    .removeFavoriteDrink(drink);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(milliseconds: 350),
                    content: const Text('Removed From Favorites'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        ref
                            .read(favoriteDrinksNotifierProvider.notifier)
                            .addFavoriteDrink(drink);
                      },
                    ),
                  ),
                );
              } else {
                ref
                    .read(favoriteDrinksNotifierProvider.notifier)
                    .addFavoriteDrink(drink);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(milliseconds: 350),
                    content: const Text('Added to Favorites'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        ref
                            .read(favoriteDrinksNotifierProvider.notifier)
                            .removeFavoriteDrink(drink);
                      },
                    ),
                  ),
                );
              }
            },
            icon: Icon(isFavorite ? Icons.star : Icons.star_outline),
          ),
        ],
        elevation: 5,
        shadowColor: const Color.fromARGB(116, 255, 13, 13),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          drink.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.file(
              drink.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          ListView(
            padding: const EdgeInsets.only(top: 50),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.black.withOpacity(0.4),
                          width: 1),
                    ),
                    child: Text(
                      'Drink Name',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    drink.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.black.withOpacity(0.4),
                          width: 1),
                    ),
                    child: Text(
                      'Drink Review',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    drink.about,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.black.withOpacity(0.4),
                          width: 1),
                    ),
                    child: Text(
                      'Drink Rating',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    drink.rating.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 210,
                  ),
                  Text(
                    'Review Posted by:\n ${drink.username}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
