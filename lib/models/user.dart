//Model for each user

class Users {
  Users(
      {required this.id,
      required this.name,
      this.imagePath = 'lib/assets/okei.jpg'});
  final String id;
  String name;
  final String imagePath;
}
