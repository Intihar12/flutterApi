// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.responseCode,
    this.responseMessage,
    this.response,
    this.errors,
  });

  String? responseCode;
  String? responseMessage;
  List<Response>? response;
  String? errors;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    responseCode: json["ResponseCode"],
    responseMessage: json["ResponseMessage"],
    response: List<Response>.from(json["Response"].map((x) => Response.fromJson(x))),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "ResponseCode": responseCode,
    "ResponseMessage": responseMessage,
    "Response": List<dynamic>.from(response!.map((x) => x.toJson())),
    "errors": errors,
  };
}

class Response {
  Response({
    this.name,
    this.displayText,
    this.displayImage,
    this.email,
    this.contact,
    this.activeBookings,
  });

  String? name;
  String? displayText;
  List<String>? displayImage;
  String? email;
  String ?contact;
  List<dynamic> ?activeBookings;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    name: json["name"],
    displayText: json["displayText"],
    displayImage: List<String>.from(json["displayImage"].map((x) => x)),
    email: json["email"],
    contact: json["contact"],
    activeBookings: List<dynamic>.from(json["activeBookings"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "displayText": displayText,
    "displayImage": List<dynamic>.from(displayImage!.map((x) => x)),
    "email": email,
    "contact": contact,
    "activeBookings": List<dynamic>.from(activeBookings!.map((x) => x)),
  };
}
