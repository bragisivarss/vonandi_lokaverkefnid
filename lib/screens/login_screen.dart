import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/user.dart';
import 'package:lokaverkefni/screens/drinks.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _selectUser() {
    setState(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const DrinksScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                (user) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(user.imagePath),
                  ),
                  title: Text(
                    user.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  onTap: () {
                    _selectUser();
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}