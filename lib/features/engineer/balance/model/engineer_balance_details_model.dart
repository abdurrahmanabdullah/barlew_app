import 'dart:convert';

class BalanceDetailsResponseModel {
  Data? data;
  String? message;
  int? status;

  BalanceDetailsResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory BalanceDetailsResponseModel.fromRawJson(String str) =>
      BalanceDetailsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BalanceDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      BalanceDetailsResponseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  String? totalCompletedTaskCount;
  String? availableForWithDraw;
  String? currentMonthEarning;
  String? avgSellingPrice;
  String? paymentBeingCleared;

  Data({
    this.totalCompletedTaskCount,
    this.availableForWithDraw,
    this.currentMonthEarning,
    this.avgSellingPrice,
    this.paymentBeingCleared,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalCompletedTaskCount: json["totalCompletedTaskCount"],
        availableForWithDraw: json["availableForWithDraw"],
        currentMonthEarning: json["currentMonthEarning"],
        avgSellingPrice: json["avgSellingPrice"],
        paymentBeingCleared: json["paymentBeingCleared"],
      );

  Map<String, dynamic> toJson() => {
        "totalCompletedTaskCount": totalCompletedTaskCount,
        "availableForWithDraw": availableForWithDraw,
        "currentMonthEarning": currentMonthEarning,
        "avgSellingPrice": avgSellingPrice,
        "paymentBeingCleared": paymentBeingCleared,
      };
}
