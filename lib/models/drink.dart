import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Drink{
  Drink({required this.title, required this.about, required this.rating}) : id = uuid.v4();

  final String id;
  final String title;
  final String about;
  final int rating;
}