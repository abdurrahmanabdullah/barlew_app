import 'dart:convert';

class EngineerDetailsPageModel {
  Data? data;
  String? message;
  int? status;

  EngineerDetailsPageModel({
    this.data,
    this.message,
    this.status,
  });

  factory EngineerDetailsPageModel.fromRawJson(String str) =>
      EngineerDetailsPageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EngineerDetailsPageModel.fromJson(Map<String, dynamic> json) =>
      EngineerDetailsPageModel(
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
  int? averageRating;
  int? reviewCount;
  List<Review>? reviews;

  Data({
    this.engineer,
    this.averageRating,
    this.reviewCount,
    this.reviews,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        engineer: json["engineer"] == null
            ? null
            : Engineer.fromJson(json["engineer"]),
        averageRating: json["average_rating"],
        reviewCount: json["review_count"],
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "engineer": engineer?.toJson(),
        "average_rating": averageRating,
        "review_count": reviewCount,
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
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
  String? level;
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
    this.level,
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
        level: json["level"],
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
        "level": level,
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

class Review {
  Reviewer? reviewer;
  int? rating;
  String? review;

  Review({
    this.reviewer,
    this.rating,
    this.review,
  });

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewer: json["reviewer"] == null
            ? null
            : Reviewer.fromJson(json["reviewer"]),
        rating: json["rating"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "reviewer": reviewer?.toJson(),
        "rating": rating,
        "review": review,
      };
}

class Reviewer {
  int? id;
  String? firstName;
  String? lastName;
  String? service;
  String? about;
  String? avatar;
  String? address;

  Reviewer({
    this.id,
    this.firstName,
    this.lastName,
    this.service,
    this.about,
    this.avatar,
    this.address,
  });

  factory Reviewer.fromRawJson(String str) =>
      Reviewer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reviewer.fromJson(Map<String, dynamic> json) => Reviewer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        service: json["service"],
        about: json["about"],
        avatar: json["avatar"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "service": service,
        "about": about,
        "avatar": avatar,
        "address": address,
      };
}
