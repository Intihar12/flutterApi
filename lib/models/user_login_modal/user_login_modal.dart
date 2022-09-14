// To parse this JSON data, do
//
//     final userLoginModal = userLoginModalFromJson(jsonString);

import 'dart:convert';

UserLoginModal userLoginModalFromJson(String str) => UserLoginModal.fromJson(json.decode(str));

String userLoginModalToJson(UserLoginModal data) => json.encode(data.toJson());

class UserLoginModal {
  UserLoginModal({
    this.message,
    this.status,
    this.data,
    this.errors,
  });

  String? message;
  String? status;
  Data ?data;
  String? errors;

  factory UserLoginModal.fromJson(Map<String, dynamic> json) => UserLoginModal(
    message: json["message"],
    status: json["status"],
    data: Data.fromJson(json["data"]),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data!.toJson(),
    "errors": errors,
  };
}

class Data {
  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isAvailable,
    this.accessToken,
  });

  String ?firstName;
  String ?lastName;
  String ?email;
  String ?phone;
  bool ?isAvailable;
  String ?accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    isAvailable: json["isAvailable"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "isAvailable": isAvailable,
    "access_token": accessToken,
  };
}
