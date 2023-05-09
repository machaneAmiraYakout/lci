class User {
  String email;
  String password;
  String uid;
  String role;

  User({required this.email, required this.password, required this.uid, required this.role});

  Map<String, dynamic> toJson() {
    return {
      'uid':uid,
      'email': email,
      'password': password,
      'role': role,

    };
  }
}
