import 'dart:convert';

class HistoryDetailsResponseModel {
  Data? data;
  String? message;
  int? status;

  HistoryDetailsResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory HistoryDetailsResponseModel.fromRawJson(String str) =>
      HistoryDetailsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      HistoryDetailsResponseModel(
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
  int? id;
  int? userId;
  String? engineerId;
  int? serviceId;
  String? serviceTitle;
  String? price;
  String? status;
  List<QuestionAnswer>? questionAnswer;
  List<String>? images;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  Service? service;
  String? engineer;
  String? payment;

  Data({
    this.id,
    this.userId,
    this.engineerId,
    this.serviceId,
    this.serviceTitle,
    this.price,
    this.status,
    this.questionAnswer,
    this.images,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.service,
    this.engineer,
    this.payment,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        engineerId: json["engineer_id"],
        serviceId: json["service_id"],
        serviceTitle: json["service_title"],
        price: json["price"],
        status: json["status"],
        questionAnswer: json["question_answer"] == null
            ? []
            : List<QuestionAnswer>.from(json["question_answer"]!
                .map((x) => QuestionAnswer.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
        engineer: json["engineer"],
        payment: json["payment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "engineer_id": engineerId,
        "service_id": serviceId,
        "service_title": serviceTitle,
        "price": price,
        "status": status,
        "question_answer": questionAnswer == null
            ? []
            : List<dynamic>.from(questionAnswer!.map((x) => x.toJson())),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "service": service?.toJson(),
        "engineer": engineer,
        "payment": payment,
      };
}

class QuestionAnswer {
  String? question;
  String? answer;

  QuestionAnswer({
    this.question,
    this.answer,
  });

  factory QuestionAnswer.fromRawJson(String str) =>
      QuestionAnswer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) => QuestionAnswer(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}

class Service {
  int? id;
  String? title;
  String? thumbnail;
  String? price;

  Service({
    this.id,
    this.title,
    this.thumbnail,
    this.price,
  });

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "price": price,
      };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? service;
  String? about;
  String? avatar;
  String? address;
  String? role;
  String? name;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.service,
    this.about,
    this.avatar,
    this.address,
    this.role,
    this.name,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        service: json["service"],
        about: json["about"],
        avatar: json["avatar"],
        address: json["address"],
        role: json["role"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "service": service,
        "about": about,
        "avatar": avatar,
        "address": address,
        "role": role,
        "name": name,
      };
}
