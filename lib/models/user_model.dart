class User {
  final String name;
  final String subname;
  final String email;
  final String createAt;

  User(
      {required this.name,
      required this.subname,
      required this.email,
      required this.createAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        subname: json['subname'],
        email: json['email'],
        createAt: json['createAt']);
  }
}
