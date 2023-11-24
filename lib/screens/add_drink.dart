import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/categories.dart';

class AddDrinkScreen extends StatefulWidget {
  const AddDrinkScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddDrinkScreen();
  }
}

class _AddDrinkScreen extends State<AddDrinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Add a Review',
        
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                    child: TextFormField(
                      maxLength: 50,
                      decoration: InputDecoration(
                        labelText: 'Drink Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.background),
                        ),
                      ),
                      validator: (value) {
                        return '';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'About Drink',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.background),
                        ),
                      ),
                      validator: (value) {
                        return '';
                      },
                    ),
                  ),
                  //SKOÐA!
                  DropdownButtonFormField(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                      items: [
                        for (final category in Categories.values)
                          DropdownMenuItem(
                            value: category.name,
                            child: Row(
                              children: [
                                Container(),
                                Text(
                                  category.name,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                                ),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (name) {}),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: Text(
                'Add Review',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            )
          ],
        ),
      ),
    );
  }
}
