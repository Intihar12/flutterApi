// To parse this JSON data, do
//
//     final serviceSellerModal = serviceSellerModalFromJson(jsonString);

import 'dart:convert';

ServiceSellerModal serviceSellerModalFromJson(String str) => ServiceSellerModal.fromJson(json.decode(str));

String serviceSellerModalToJson(ServiceSellerModal data) => json.encode(data.toJson());

class ServiceSellerModal {
  ServiceSellerModal({
    this.message,
    this.status,
    this.data,
    this.errors,
  });

  String? message;
  String? status;
  Data? data;
  String? errors;

  factory ServiceSellerModal.fromJson(Map<String, dynamic> json) => ServiceSellerModal(
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
    this.company,
    this.individual,
  });

  List<CompanyElement>? company;
  List<Individual>? individual;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    company: List<CompanyElement>.from(json["company"].map((x) => CompanyElement.fromJson(x))),
    individual: List<Individual>.from(json["individual"].map((x) => Individual.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "company": List<dynamic>.from(company!.map((x) => x.toJson())),
    "individual": List<dynamic>.from(individual!.map((x) => x.toJson())),
  };
}

class CompanyElement {
  CompanyElement({
    this.company,
    this.totalRating,
    this.totalReviews,
  });

  IndividualClass? company;
  String? totalRating;
  String? totalReviews;

  factory CompanyElement.fromJson(Map<String, dynamic> json) => CompanyElement(
    company: IndividualClass.fromJson(json["company"]),
    totalRating: json["total_rating"],
    totalReviews: json["total_reviews"],
  );

  Map<String, dynamic> toJson() => {
    "company": company!.toJson(),
    "total_rating": totalRating,
    "total_reviews": totalReviews,
  };
}

class IndividualClass {
  IndividualClass({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profileImage,
    this.businessAddress,
    this.description,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? profileImage;
  String? businessAddress;
  String? description;

  factory IndividualClass.fromJson(Map<String, dynamic> json) => IndividualClass(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    profileImage: json["profileImage"],
    businessAddress: json["BusinessAddress"],
    description: json["Description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "profileImage": profileImage,
    "BusinessAddress": businessAddress,
    "Description": description,
  };
}

class Individual {
  Individual({
    this.individual,
    this.totalRating,
    this.totalReviews,
  });

  IndividualClass? individual;
  String? totalRating;
  String? totalReviews;

  factory Individual.fromJson(Map<String, dynamic> json) => Individual(
    individual: IndividualClass.fromJson(json["individual"]),
    totalRating: json["total_rating"],
    totalReviews: json["total_reviews"],
  );

  Map<String, dynamic> toJson() => {
    "individual": individual!.toJson(),
    "total_rating": totalRating,
    "total_reviews": totalReviews,
  };
}
