import 'dart:convert';

class BankDetailsResponseModel {
  List<Datum>? data;
  String? message;
  int? status;

  BankDetailsResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory BankDetailsResponseModel.fromRawJson(String str) =>
      BankDetailsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BankDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      BankDetailsResponseModel(
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
  String? bankName;
  String? accountNumber;
  String? accountHolderName;
  String? branchName;
  String? swiftCode;
  String? ifscCode;

  Datum({
    this.id,
    this.bankName,
    this.accountNumber,
    this.accountHolderName,
    this.branchName,
    this.swiftCode,
    this.ifscCode,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        bankName: json["bank_name"],
        accountNumber: json["account_number"],
        accountHolderName: json["account_holder_name"],
        branchName: json["branch_name"],
        swiftCode: json["swift_code"],
        ifscCode: json["ifsc_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bank_name": bankName,
        "account_number": accountNumber,
        "account_holder_name": accountHolderName,
        "branch_name": branchName,
        "swift_code": swiftCode,
        "ifsc_code": ifscCode,
      };
}
