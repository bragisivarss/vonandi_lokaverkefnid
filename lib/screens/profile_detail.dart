import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/users.dart';
import 'package:lokaverkefni/models/user.dart';

//Profile screen where user can view information about his/her profile
//here user can see his/her avg rating and how many reviews they have made
//and change theyre username

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
        centerTitle: true,
        elevation: 5,
        shadowColor: const Color.fromARGB(116, 255, 13, 13),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          selectedUser.name,
          style: TextStyle(fontSize: 26),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.3,
              child: Image.asset(
                'lib/assets/drink.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color.fromARGB(73, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      'Username',
                      style:
                          Theme.of(context).textTheme.displayLarge!.copyWith(),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    selectedUser.name,
                    style:
                        Theme.of(context).textTheme.displayMedium!.copyWith(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Change Username'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
