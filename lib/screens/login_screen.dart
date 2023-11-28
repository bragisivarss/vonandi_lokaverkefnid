import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/user.dart';
import 'package:lokaverkefni/models/users.dart';
import 'package:lokaverkefni/screens/drinks.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Users? selectedUser;

  void _selectUser(Users user) {
    setState(() {
      selectedUser = user;

      if (selectedUser != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => DrinksScreen(selectedUser: selectedUser!),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color.fromARGB(116, 255, 13, 13),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          'Welcome Please Select a User',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: ListView(
          children: users
              .map(
                (user) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSecondary,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(user.imagePath),
                      radius: 25,
                    ),
                    title: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          user.name,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    onTap: () {
                      _selectUser(user);
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
