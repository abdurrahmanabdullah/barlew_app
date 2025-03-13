import 'dart:convert';

class MatchEngineerProfileModel {
  Data? data;
  String? message;
  int? status;

  MatchEngineerProfileModel({
    this.data,
    this.message,
    this.status,
  });

  factory MatchEngineerProfileModel.fromRawJson(String str) =>
      MatchEngineerProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatchEngineerProfileModel.fromJson(Map<String, dynamic> json) =>
      MatchEngineerProfileModel(
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
  Engineer? engineer;
  Service? service;

  Data({
    this.engineer,
    this.service,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        engineer: json["engineer"] == null
            ? null
            : Engineer.fromJson(json["engineer"]),
        service:
            json["service"] == null ? null : Service.fromJson(json["service"]),
      );

  Map<String, dynamic> toJson() => {
        "engineer": engineer?.toJson(),
        "service": service?.toJson(),
      };
}

class Engineer {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? service;
  String? about;
  String? avatar;
  String? address;
  String? role;
  String? ratting;
  int? totalReviews;
  String? name;
  List<Skill>? skills;
  List<Portfolio>? portfolios;

  Engineer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.service,
    this.about,
    this.avatar,
    this.address,
    this.role,
    this.ratting,
    this.totalReviews,
    this.name,
    this.skills,
    this.portfolios,
  });

  factory Engineer.fromRawJson(String str) =>
      Engineer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Engineer.fromJson(Map<String, dynamic> json) => Engineer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        service: json["service"],
        about: json["about"],
        avatar: json["avatar"],
        address: json["address"],
        role: json["role"],
        ratting: json["ratting"],
        totalReviews: json["total_reviews"],
        name: json["name"],
        skills: json["skills"] == null
            ? []
            : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
        portfolios: json["portfolios"] == null
            ? []
            : List<Portfolio>.from(
                json["portfolios"]!.map((x) => Portfolio.fromJson(x))),
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
        "ratting": ratting,
        "total_reviews": totalReviews,
        "name": name,
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
        "portfolios": portfolios == null
            ? []
            : List<dynamic>.from(portfolios!.map((x) => x.toJson())),
      };
}

class Portfolio {
  int? id;
  String? image;

  Portfolio({
    this.id,
    this.image,
  });

  factory Portfolio.fromRawJson(String str) =>
      Portfolio.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Skill {
  int? id;
  String? name;

  Skill({
    this.id,
    this.name,
  });

  factory Skill.fromRawJson(String str) => Skill.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
