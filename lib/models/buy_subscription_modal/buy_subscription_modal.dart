// To parse this JSON data, do
//
//     final buySubscriptionsModal = buySubscriptionsModalFromJson(jsonString);

import 'dart:convert';

GetPlanModal buySubscriptionsModalFromJson(String str) => GetPlanModal.fromJson(json.decode(str));

String buySubscriptionsModalToJson(GetPlanModal data) => json.encode(data.toJson());

class GetPlanModal {
  GetPlanModal({
    this.message,
    this.status,
    this.data,
    this.errors,
  });

  String? message;
  String ?status;
  List<Datum> ?data;
  String ?errors;

  factory GetPlanModal.fromJson(Map<String, dynamic> json) => GetPlanModal(
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
    this.title,
    this.price,
    this.days,
    this.features,
  });

  int? id;
  String? title;
  String? price;
  String? days;
  List<Feature> ?features;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    days: json["days"] == null ? null : json["days"],
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "days": days == null ? null : days,
    "features": List<dynamic>.from(features!.map((x) => x.toJson())),
  };
}

class Feature {
  Feature({
    this.id,
    this.featureName,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.planId,
  });

  int? id;
  String ?featureName;
  bool ?status;
  DateTime? createdAt;
  DateTime ?updatedAt;
  int ?planId;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    id: json["id"],
    featureName: json["feature_name"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    planId: json["PlanId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "feature_name": featureName,
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "PlanId": planId,
  };
}
