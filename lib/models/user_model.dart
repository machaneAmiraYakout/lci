class User {
  String email;
  String password;
  String uid;

  User({required this.email, required this.password, required this.uid});

  Map<String, dynamic> toJson() {
    return {
      'uid':uid,
      'email': email,
      'password': password,
    };
  }
}
