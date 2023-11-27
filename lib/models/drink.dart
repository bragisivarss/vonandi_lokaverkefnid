import 'dart:io';


class Drink{
  Drink({required this.title, required this.about, required this.rating, required this.image, required this.userId, required this.username});

  final String userId;
  final String title;
  final String about;
  final double rating;
  final File image;
  final String username;
}