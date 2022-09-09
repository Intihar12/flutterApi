import 'dart:convert';

class PaymentSuccessfulModal {
  PaymentSuccessfulModal({
    this.message,
    this.status,
  });

  String? message;
  bool? status;

  factory PaymentSuccessfulModal.fromRawJson(String str) => PaymentSuccessfulModal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentSuccessfulModal.fromJson(Map<String, dynamic> json) => PaymentSuccessfulModal(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}