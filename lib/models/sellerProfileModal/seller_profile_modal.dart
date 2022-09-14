// To parse this JSON data, do
//
//     final sellerProfileModal = sellerProfileModalFromJson(jsonString);

import 'dart:convert';

SellerProfileModal sellerProfileModalFromJson(String str) => SellerProfileModal.fromJson(json.decode(str));

String sellerProfileModalToJson(SellerProfileModal data) => json.encode(data.toJson());

class SellerProfileModal {
  SellerProfileModal({
    this.message,
    this.status,
    this.data,
    this.errors,
  });

  String ?message;
  String ?status;
  Data ?data;
  String ?errors;

  factory SellerProfileModal.fromJson(Map<String, dynamic> json) => SellerProfileModal(
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
    this.firstName,
    this.lastName,
    this.totalReviews,
    this.totalRating,
    this.profileImage,
    this.businessType,
    this.nSirect,
    this.businessEmail,
    this.businessPhone,
    this.businessWebsite,
    this.businessAddress,
    this.about,
    this.services,
    this.gallery,
    this.reviews,
  });

  int ?id;
  String? firstName;
  String ?lastName;
  String ?totalReviews;
  String ?totalRating;
  String ?profileImage;
  String ?businessType;
  String ?nSirect;
  String ?businessEmail;
  String ?businessPhone;
  String ?businessWebsite;
  String ?businessAddress;
  String? about;
  List<Gallery>? services;
  List<Gallery> ?gallery;
  List<dynamic> ?reviews;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    totalReviews: json["total_reviews"],
    totalRating: json["total_rating"],
    profileImage: json["profileImage"],
    businessType: json["BusinessType"],
    nSirect: json["N-Sirect"],
    businessEmail: json["BusinessEmail"],
    businessPhone: json["BusinessPhone"],
    businessWebsite: json["BusinessWebsite"],
    businessAddress: json["BusinessAddress"],
    about: json["About"],
    services: List<Gallery>.from(json["Services"].map((x) => Gallery.fromJson(x))),
    gallery: List<Gallery>.from(json["Gallery"].map((x) => Gallery.fromJson(x))),
    reviews: List<dynamic>.from(json["Reviews"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "total_reviews": totalReviews,
    "total_rating": totalRating,
    "profileImage": profileImage,
    "BusinessType": businessType,
    "N-Sirect": nSirect,
    "BusinessEmail": businessEmail,
    "BusinessPhone": businessPhone,
    "BusinessWebsite": businessWebsite,
    "BusinessAddress": businessAddress,
    "About": about,
    "Services": List<dynamic>.from(services!.map((x) => x.toJson())),
    "Gallery": List<dynamic>.from(gallery!.map((x) => x.toJson())),
    "Reviews": List<dynamic>.from(reviews!.map((x) => x)),
  };
}

class Gallery {
  Gallery({
    this.id,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.name,
  });

  int? id;
  String ?image;
  bool ?status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int ?userId;
  String ?name;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    id: json["id"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    userId: json["userId"] == null ? null : json["userId"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "userId": userId == null ? null : userId,
    "name": name == null ? null : name,
  };
}
