import 'dart:convert';

class EngineerTaskResponseModel {
  int? status;
  String? message;
  List<Datum>? data;
  Pagination? pagination;

  EngineerTaskResponseModel({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  factory EngineerTaskResponseModel.fromRawJson(String str) =>
      EngineerTaskResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EngineerTaskResponseModel.fromJson(Map<String, dynamic> json) =>
      EngineerTaskResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Datum {
  int? id;
  int? requestId;
  int? engineerId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DiscussionRequest? discussionRequest;

  Datum({
    this.id,
    this.requestId,
    this.engineerId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.discussionRequest,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        requestId: json["request_id"],
        engineerId: json["engineer_id"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        discussionRequest: json["discussion_request"] == null
            ? null
            : DiscussionRequest.fromJson(json["discussion_request"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "request_id": requestId,
        "engineer_id": engineerId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "discussion_request": discussionRequest?.toJson(),
      };
}

class DiscussionRequest {
  int? id;
  int? userId;
  dynamic engineerId;
  int? serviceId;
  String? serviceTitle;
  String? price;
  String? status;
  List<QuestionAnswer>? questionAnswer;
  dynamic images;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  DiscussionRequest({
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
  });

  factory DiscussionRequest.fromRawJson(String str) =>
      DiscussionRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiscussionRequest.fromJson(Map<String, dynamic> json) =>
      DiscussionRequest(
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
        images: json["images"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
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
        "images": images,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class QuestionAnswer {
  String? question;
  Answer? answer;

  QuestionAnswer({
    this.question,
    this.answer,
  });

  factory QuestionAnswer.fromRawJson(String str) =>
      QuestionAnswer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) => QuestionAnswer(
        question: json["question"],
        answer: answerValues.map[json["answer"]]!,
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answerValues.reverse[answer],
      };
}

enum Answer { ANSWER_1, FUNCTIONAL, WITHIN_THE_LAST_YEAR }

final answerValues = EnumValues({
  "answer 1": Answer.ANSWER_1,
  "Functional": Answer.FUNCTIONAL,
  "Within the last year": Answer.WITHIN_THE_LAST_YEAR
});

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

class Pagination {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;
  String? firstPageUrl;
  String? lastPageUrl;
  String? nextPageUrl;
  String? prevPageUrl;
  int? from;
  int? to;
  String? path;

  Pagination({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.prevPageUrl,
    this.from,
    this.to,
    this.path,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        perPage: json["per_page"],
        total: json["total"],
        firstPageUrl: json["first_page_url"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        prevPageUrl: json["prev_page_url"],
        from: json["from"],
        to: json["to"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "last_page": lastPage,
        "per_page": perPage,
        "total": total,
        "first_page_url": firstPageUrl,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
        "from": from,
        "to": to,
        "path": path,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
