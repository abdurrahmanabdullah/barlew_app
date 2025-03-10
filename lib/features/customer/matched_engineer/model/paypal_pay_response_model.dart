import 'dart:convert';

class PaypalpayResponseModel {
  Data? data;
  String? message;
  int? status;

  PaypalpayResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory PaypalpayResponseModel.fromRawJson(String str) =>
      PaypalpayResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaypalpayResponseModel.fromJson(Map<String, dynamic> json) =>
      PaypalpayResponseModel(
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
  String? paymentUrl;

  Data({
    this.paymentUrl,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentUrl: json["payment_url"],
      );

  Map<String, dynamic> toJson() => {
        "payment_url": paymentUrl,
      };
}
