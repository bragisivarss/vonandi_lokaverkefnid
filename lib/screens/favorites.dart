import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lokaverkefni/providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favorites = ref.watch(favoriteDrinksNotifierProvider);

    

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color.fromARGB(116, 255, 13, 13),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Your Favorites'),
      ),
      body: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) => Column(
            children: [ 
              ListTile(
                leading: Image.file(favorites[index].image),
                title: Text(favorites[index].title),
                subtitle: Text( 
                  'Rating: ${favorites[index].rating}'
                ),
              ),
            ],
          ),),
    );
  }
}
