import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/user.dart';
import 'package:lokaverkefni/screens/favorites.dart';
import 'package:lokaverkefni/screens/login_screen.dart';
import 'package:lokaverkefni/screens/profile_detail.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key, required this.selectedUser});

  final Users selectedUser;

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  onViewFavorite() {
    setState(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => FavoritesScreen(
            selectedUser: selectedUser,
          ),
        ),
      );
    });
  }

  onViewProfile() {
    setState(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const ProfileScreen(),
        ),
      );
    });
  }

  onSelectUser() {
    setState(() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (ctx) => const LoginScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 45),
          ),
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'What would you like to do?',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text(
              'View Profile',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 18),
            ),
            onTap: onViewProfile,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(
              'Favorites',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 18),
            ),
            onTap: onViewFavorite,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                size: 26,
              ),
              title: Text(
                'Switch User',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 18),
              ),
              onTap: onSelectUser),
        ],
      ),
    );
  }
}
