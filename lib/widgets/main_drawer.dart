import 'package:flutter/material.dart';
import 'package:lokaverkefni/screens/login_screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key, });

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
   onSelectUser() {
    setState(() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => const LoginScreen(), ), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 70),),
          Text('What would you like to do?',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer
          )
          ),
          const SizedBox(height: 30,),
          ListTile(
            leading: const Icon(Icons.exit_to_app,
            size: 26,
            ),
            title: const Text('Switch User'),
            onTap: onSelectUser
          ),
        ],
      ),
    );
  }
}
