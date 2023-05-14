class Inscription {
  final String id;
  final String fullName;
  final int age;
  final String fonction;
  final String formation;
  final String email;
  final String mobile;
  final String commentaire;

  Inscription({
    required this.id,
    required this.fullName,
    required this.age,
    required this.fonction,
    required this.formation,
    required this.email,
    required this.mobile,
    required this.commentaire,
  });

  factory Inscription.fromJson(Map<String, dynamic> json) {
    return Inscription(
      id: json['id'],
      fullName: json['fullName'],
      age: json['age'],
      fonction: json['fonction'],
      formation: json['formation'],
      email: json['email'],
      mobile: json['mobile'],
      commentaire: json['commentaire'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'age': age,
      'fonction': fonction,
      'formation': formation,
      'email': email,
      'mobile': mobile,
      'commentaire': commentaire,
    };
  }
}
