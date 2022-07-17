class User {
  final int id;
  final String email;
  final String password;

  const User({
    required this.id,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}

