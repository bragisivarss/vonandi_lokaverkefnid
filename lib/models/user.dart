//Model for each user

class Users {
  const Users(
      {required this.id,
      required this.name,
      this.imagePath = 'lib/assets/okei.jpg'});
  final String id;
  final String name;
  final String imagePath;
}
