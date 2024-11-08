import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String email;
  String username;
  String standard;
  String role;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.username,
    required this.standard,
    required this.role,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        username: json["username"],
        standard: json["standard"] ?? "0",
        role: json["role"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "username": username,
        "standard": standard,
        "role": role,
        "password": password,
      };
}
