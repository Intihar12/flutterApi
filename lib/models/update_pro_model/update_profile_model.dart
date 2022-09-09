// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    this.responseCode,
    this.responseMessage,
    this.response,
    this.errors,
  });

  String? responseCode;
  String? responseMessage;
  List<Response> ?response;
  String? errors;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
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
    this.firstName,
    this.lastName,
    this.countryCode,
    this.phoneNum,
  });

  String? firstName;
  String ?lastName;
  String ?countryCode;
  String ?phoneNum;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    firstName: json["firstName"],
    lastName: json["lastName"],
    countryCode: json["countryCode"],
    phoneNum: json["phoneNum"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "countryCode": countryCode,
    "phoneNum": phoneNum,
  };
}
