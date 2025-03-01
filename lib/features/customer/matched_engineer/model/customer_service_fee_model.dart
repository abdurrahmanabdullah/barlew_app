import 'dart:convert';

class ServiceFeeResponseModel {
  List<Datum>? data;
  String? message;
  int? status;

  ServiceFeeResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory ServiceFeeResponseModel.fromRawJson(String str) =>
      ServiceFeeResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceFeeResponseModel.fromJson(Map<String, dynamic> json) =>
      ServiceFeeResponseModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Datum {
  int? id;
  String? fee;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.fee,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        fee: json["fee"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fee": fee,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
