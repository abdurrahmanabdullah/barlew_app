// import 'dart:convert';

// class MatchEngineerResponseModel {
//   List<Datum>? data;
//   String? message;
//   int? status;

//   MatchEngineerResponseModel({
//     this.data,
//     this.message,
//     this.status,
//   });

//   factory MatchEngineerResponseModel.fromRawJson(String str) =>
//       MatchEngineerResponseModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory MatchEngineerResponseModel.fromJson(Map<String, dynamic> json) =>
//       MatchEngineerResponseModel(
//         data: json["data"] == null
//             ? []
//             : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//         message: json["message"],
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "message": message,
//         "status": status,
//       };
// }

// class Datum {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? service;
//   String? about;
//   String? avatar;
//   String? address;
//   String? role;
//   String? level;
//   int? skillsCount;
//   String? name;
//   List<Skill>? skills;

//   Datum({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.service,
//     this.about,
//     this.avatar,
//     this.address,
//     this.role,
//     this.level,
//     this.skillsCount,
//     this.name,
//     this.skills,
//   });

//   factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         email: json["email"],
//         service: json["service"],
//         about: json["about"],
//         avatar: json["avatar"],
//         address: json["address"],
//         role: json["role"],
//         level: json["level"],
//         skillsCount: json["skills_count"],
//         name: json["name"],
//         skills: json["skills"] == null
//             ? []
//             : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "first_name": firstName,
//         "last_name": lastName,
//         "email": email,
//         "service": service,
//         "about": about,
//         "avatar": avatar,
//         "address": address,
//         "role": role,
//         "level": level,
//         "skills_count": skillsCount,
//         "name": name,
//         "skills": skills == null
//             ? []
//             : List<dynamic>.from(skills!.map((x) => x.toJson())),
//       };
// }

// class Skill {
//   int? id;
//   String? name;

//   Skill({
//     this.id,
//     this.name,
//   });

//   factory Skill.fromRawJson(String str) => Skill.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Skill.fromJson(Map<String, dynamic> json) => Skill(
//         id: json["id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }
import 'dart:convert';

class MatchEngineerResponseModel {
  List<Datum>? data;
  String? message;
  int? status;

  MatchEngineerResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory MatchEngineerResponseModel.fromRawJson(String str) =>
      MatchEngineerResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatchEngineerResponseModel.fromJson(Map<String, dynamic> json) =>
      MatchEngineerResponseModel(
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
  String? firstName;
  String? lastName;
  String? email;
  String? service;
  String? about;
  String? avatar;
  String? address;
  String? role;
  String? level;
  int? skillsCount;
  String? name;
  List<Skill>? skills;
  int? averageRating;
  int? reviewCount;

  Datum({
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
    this.skillsCount,
    this.name,
    this.skills,
    this.averageRating,
    this.reviewCount,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        skillsCount: json["skills_count"],
        name: json["name"],
        skills: json["skills"] == null
            ? []
            : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
        averageRating: json["average_rating"],
        reviewCount: json["review_count"],
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
        "skills_count": skillsCount,
        "name": name,
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
        "average_rating": averageRating,
        "review_count": reviewCount,
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
