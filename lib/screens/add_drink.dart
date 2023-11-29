import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lokaverkefni/models/categories.dart';
import 'package:lokaverkefni/models/user.dart';
import 'package:lokaverkefni/providers/user_drinks.dart';
import 'package:lokaverkefni/widgets/image_input.dart';

//Add Drink Screen a screen specially to accept information from a user
//where user can add a review/rating and some information about a drink

class AddDrinkScreen extends ConsumerStatefulWidget {
  const AddDrinkScreen({
    super.key,
    required this.selectedUser,
  });

  final Users selectedUser;

  @override
  ConsumerState<AddDrinkScreen> createState() {
    return _AddDrinkScreen();
  }
}

class _AddDrinkScreen extends ConsumerState<AddDrinkScreen> {
  File? takenPicture;
  final _nameController = TextEditingController();
  final _aboutController = TextEditingController();
  final _ratingController = TextEditingController();

  void _saveReview() {
    final enteredName = _nameController.text;
    final enteredAbout = _aboutController.text;
    final enteredRating = _ratingController.text;

    var fixedRating = double.tryParse(enteredRating);

    if (fixedRating == null) {
      return;
    }

    if (enteredName.isEmpty || enteredAbout.isEmpty || takenPicture == null) {
      return;
    }

    ref.read(userDrinksProvide.notifier).addPlace(
          title: enteredName,
          about: enteredAbout,
          rating: fixedRating,
          image: takenPicture!,
          userId: widget.selectedUser.id,
          username: widget.selectedUser.name,
        );

    setState(() {
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _aboutController.dispose();
    _ratingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color.fromARGB(116, 255, 13, 13),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text(
          'Add a Review',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
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

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: _aboutController,
                      maxLength: 200,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: _ratingController,
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Rating 0-10',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Please Select a Category',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  //SKOÐA!
                  DropdownButtonFormField(items: [
                    for (final category in Categories.values)
                      DropdownMenuItem(
                        value: category.name,
                        child: Row(
                          children: [
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
                  ], onChanged: (name) {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ImageInput(
                onPickImage: (image) {
                  takenPicture = image;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton.icon(
                onPressed: _saveReview,
                icon: const Icon(Icons.add),
                label: Text(
                  'Add Review',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
