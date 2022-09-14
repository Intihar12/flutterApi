// To parse this JSON data, do
//
//     final sellerUserPlanModal = sellerUserPlanModalFromJson(jsonString);

import 'dart:convert';

SellerUserPlanModal sellerUserPlanModalFromJson(String str) => SellerUserPlanModal.fromJson(json.decode(str));

String sellerUserPlanModalToJson(SellerUserPlanModal data) => json.encode(data.toJson());

class SellerUserPlanModal {
  SellerUserPlanModal({
    this.message,
    this.status,
    this.data,
    this.errors,
  });

  String ?message;
  String ?status;
  Data ?data;
  String? errors;

  factory SellerUserPlanModal.fromJson(Map<String, dynamic> json) => SellerUserPlanModal(
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
    this.id,
    this.title,
    this.price,
    this.buyDate,
    this.expireDate,
    this.days,
    this.features,
  });

  String? id;
  String ?title;
  String ?price;
  String ?buyDate;
  String ?expireDate;
  String ?days;
  List<String>? features;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    buyDate: json["buyDate"],
    expireDate: json["expireDate"],
    days: json["days"],
    features: List<String>.from(json["features"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "buyDate": buyDate,
    "expireDate": expireDate,
    "days": days,
    "features": List<dynamic>.from(features!.map((x) => x)),
  };
}
