import 'dart:convert';

class QuestionModel {
  Data? data;
  String? message;
  int? status;

  QuestionModel({
    this.data,
    this.message,
    this.status,
  });

  factory QuestionModel.fromRawJson(String str) =>
      QuestionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
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
  int? serviceId;
  String? service;
  List<Question>? questions;

  Data({
    this.serviceId,
    this.service,
    this.questions,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        serviceId: json["service_id"],
        service: json["service"],
        questions: json["questions"] == null
            ? []
            : List<Question>.from(
                json["questions"]!.map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "service": service,
        "questions": questions == null
            ? []
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}

class Question {
  int? id;
  String? questionText;
  List<Answer>? answers;

  Question({
    this.id,
    this.questionText,
    this.answers,
  });

  factory Question.fromRawJson(String str) =>
      Question.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        questionText: json["question_text"],
        answers: json["answers"] == null
            ? []
            : List<Answer>.from(
                json["answers"]!.map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_text": questionText,
        "answers": answers == null
            ? []
            : List<dynamic>.from(answers!.map((x) => x.toJson())),
      };
}

class Answer {
  int? id;
  String? answerText;

  Answer({
    this.id,
    this.answerText,
  });

  factory Answer.fromRawJson(String str) => Answer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        answerText: json["answer_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer_text": answerText,
      };
}
