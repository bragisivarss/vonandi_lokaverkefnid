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
        title: Text(
          'Welcome Please Select a User',
          style:
              TextStyle(color: Theme.of(context).colorScheme.primaryContainer),
        ),
      ),
      body: ListView(
        children: user
            .map(
              (user) => ListTile(
                title: Text(user.name),
                onTap: () {
                  _selectUser();
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
