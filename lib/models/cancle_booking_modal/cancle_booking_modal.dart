// To parse this JSON data, do
//
//     final canceldBookingModal = canceldBookingModalFromJson(jsonString);

import 'dart:convert';

CanceldBookingModal canceldBookingModalFromJson(String str) => CanceldBookingModal.fromJson(json.decode(str));

String canceldBookingModalToJson(CanceldBookingModal data) => json.encode(data.toJson());

class CanceldBookingModal {
  CanceldBookingModal({
    this.message,
    this.status,
    this.data,
    this.errors,
  });

  String ?message;
  String ?status;
  Data ?data;
  String ?errors;

  factory CanceldBookingModal.fromJson(Map<String, dynamic> json) => CanceldBookingModal(
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
    this.date,
    this.time,
    this.bookingStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.serviceId,
    this.userId,
    this.sellerId,
  });

  int ?id;
  DateTime? date;
  String ?time;
  String? bookingStatus;
  bool ?status;
  DateTime? createdAt;
  DateTime ?updatedAt;
  int ?serviceId;
  int ?userId;
  int ?sellerId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    bookingStatus: json["bookingStatus"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    serviceId: json["ServiceId"],
    userId: json["userId"],
    sellerId: json["sellerId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date!.toIso8601String(),
    "time": time,
    "bookingStatus": bookingStatus,
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "ServiceId": serviceId,
    "userId": userId,
    "sellerId": sellerId,
  };
}
