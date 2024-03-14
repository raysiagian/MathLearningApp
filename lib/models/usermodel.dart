class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String gender;

  final String createdAt;
  final String? updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      createdAt: json['created_at'].toString(), // Convert to String
      updatedAt: json['updated_at'] != null ? json['updated_at'].toString() : null, // Convert to String if not null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
