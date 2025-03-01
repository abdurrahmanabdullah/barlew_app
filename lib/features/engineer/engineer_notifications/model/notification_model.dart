import 'dart:convert';

class NotificationModel {
  List<Datum>? data;
  String? message;
  int? status;

  NotificationModel({
    this.data,
    this.message,
    this.status,
  });

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
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
  String? message;
  String? subject;
  UserData? userData;
  String? time;
  Engineer? engineer;

  Datum({
    this.message,
    this.subject,
    this.userData,
    this.time,
    this.engineer,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        message: json["message"],
        subject: json["subject"],
        userData: json["user_data"] == null
            ? null
            : UserData.fromJson(json["user_data"]),
        time: json["time"],
        engineer: json["engineer"] == null
            ? null
            : Engineer.fromJson(json["engineer"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "subject": subject,
        "user_data": userData?.toJson(),
        "time": time,
        "engineer": engineer?.toJson(),
      };
}

class Engineer {
  int? engId;
  String? name;

  Engineer({
    this.engId,
    this.name,
  });

  factory Engineer.fromRawJson(String str) =>
      Engineer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Engineer.fromJson(Map<String, dynamic> json) => Engineer(
        engId: json["eng_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "eng_id": engId,
        "name": name,
      };
}

class UserData {
  int? userId;
  int? discussion_request_id;

  String? userName;
  String? avatar;
  String? description;
  List<Answer>? answers;
  List<String>? images;

  UserData({
    this.userId,
    this.discussion_request_id,
    this.userName,
    this.avatar,
    this.description,
    this.answers,
    this.images,
  });

  factory UserData.fromRawJson(String str) =>
      UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["user_id"],
        discussion_request_id: json["discussion_request_id"],
        userName: json["user_name"],
        avatar: json["avatar"],
        description: json["description"],
        answers: json["answers"] == null
            ? []
            : List<Answer>.from(
                json["answers"]!.map((x) => Answer.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "discussion_request_id": discussion_request_id,
        "user_name": userName,
        "avatar": avatar,
        "description": description,
        "answers": answers == null
            ? []
            : List<dynamic>.from(answers!.map((x) => x.toJson())),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class Answer {
  String? question;
  String? answer;

  Answer({
    this.question,
    this.answer,
  });

  factory Answer.fromRawJson(String str) => Answer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}
