// To parse this JSON data, do
//
//     final forgetPasswordModel = forgetPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgetPasswordModel forgetPasswordModelFromJson(String str) => ForgetPasswordModel.fromJson(json.decode(str));

String forgetPasswordModelToJson(ForgetPasswordModel data) => json.encode(data.toJson());

class ForgetPasswordModel {
  ForgetPasswordModel({
    this.responseCode,
    this.responseMessage,
    this.response,
    this.errors,
  });

  String? responseCode;
  String? responseMessage;
  List<Response>? response;
  String ?errors;

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) => ForgetPasswordModel(
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
    this.userId,
    this.forgetRequestId,
  });

  String ?userId;
  String ?forgetRequestId;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    userId: json["userId"],
    forgetRequestId: json["forgetRequestId"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "forgetRequestId": forgetRequestId,
  };
}
