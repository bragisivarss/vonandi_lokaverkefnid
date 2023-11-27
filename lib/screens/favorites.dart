import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget{
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color.fromARGB(116, 255, 13, 13),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Your Favorites'
        
        ),
      ),
    );
  }
}