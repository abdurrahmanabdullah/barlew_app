import 'dart:convert';

class BankDetailsResponseModel {
  String? data;
  List<Message>? message;
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
        data: json["data"],
        message: json["message"] == null
            ? []
            : List<Message>.from(
                json["message"]!.map((x) => Message.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message == null
            ? []
            : List<dynamic>.from(message!.map((x) => x.toJson())),
        "status": status,
      };
}

class Message {
  int? id;
  String? bankName;
  String? accountNumber;
  String? accountHolderName;
  String? branchName;
  String? swiftCode;
  String? ifscCode;

  Message({
    this.id,
    this.bankName,
    this.accountNumber,
    this.accountHolderName,
    this.branchName,
    this.swiftCode,
    this.ifscCode,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
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
