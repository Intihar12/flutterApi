
import 'dart:convert';

ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel {
  ChangePasswordModel({
    this.responseCode,
    this.responseMessage,
    this.response,
    this.errors,
  });

  String? responseCode;
  String ?responseMessage;
  List<String>? response;
  String ?errors;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
    responseCode: json["ResponseCode"],
    responseMessage: json["ResponseMessage"],
    response: List<String>.from(json["Response"].map((x) => x)),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "ResponseCode": responseCode,
    "ResponseMessage": responseMessage,
    "Response": List<dynamic>.from(response!.map((x) => x)),
    "errors": errors,
  };
}
