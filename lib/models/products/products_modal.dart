// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.message,
    this.status,
    this.data,
    this.errors,
  });

  String ?message;
  bool ?status;
  List<Datum> ?data;
  String ?errors;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    message: json["message"],
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "errors": errors,
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String ?name;
  String ?image;
  bool ?status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
