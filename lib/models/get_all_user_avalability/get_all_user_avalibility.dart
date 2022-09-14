// To parse this JSON data, do
//
//     final getAllUserAvalibility = getAllUserAvalibilityFromJson(jsonString);

import 'dart:convert';

GetAllUserAvalibility getAllUserAvalibilityFromJson(String str) => GetAllUserAvalibility.fromJson(json.decode(str));

String getAllUserAvalibilityToJson(GetAllUserAvalibility data) => json.encode(data.toJson());

class GetAllUserAvalibility {
  GetAllUserAvalibility({
    this.message,
    this.status,
    this.data,
    this.errors,
  });

  String? message;
  String? status;
  List<Datum>? data;
  String ?errors;

  factory GetAllUserAvalibility.fromJson(Map<String, dynamic> json) => GetAllUserAvalibility(
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
    this.day,
    this.session,
  });

  int ?id;
  String? day;
  List<Session>? session;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    day: json["day"],
    session: List<Session>.from(json["session"].map((x) => Session.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "day": day,
    "session": List<dynamic>.from(session!.map((x) => x.toJson())),
  };
}

class Session {
  Session({
    this.id,
    this.session,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.availablityId,
  });

  int? id;
  String? session;
  bool ?status;
  DateTime? createdAt;
  DateTime ?updatedAt;
  int ?availablityId;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json["id"],
    session: json["session"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    availablityId: json["AvailablityId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "session": session,
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "AvailablityId": availablityId,
  };
}
