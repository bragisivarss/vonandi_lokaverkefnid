import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/user.dart';
import 'package:lokaverkefni/models/users.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Users selectedUser = users[0];

  final _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color.fromARGB(116, 255, 13, 13),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  labelText: "Username",
                ),
              ),
            ),
            const SizedBox(width: 8,),
            ElevatedButton(
              onPressed: () {

              }, 
              child: const Text('Change Username')
              ),
          ],
        ),
      ),
    );
  }
}
