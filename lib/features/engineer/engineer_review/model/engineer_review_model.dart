class EngineerReviewModel {
  List<Data>? data;
  String? message;
  int? status;

  EngineerReviewModel({this.data, this.message, this.status});

  EngineerReviewModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  int? reviewerId;
  int? userId;
  int? rating;
  String? review;
  String? createdAt;
  String? updatedAt;
  Reviewer? reviewer;

  Data(
      {this.id,
      this.reviewerId,
      this.userId,
      this.rating,
      this.review,
      this.createdAt,
      this.updatedAt,
      this.reviewer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reviewerId = json['reviewer_id'];
    userId = json['user_id'];
    rating = json['rating'];
    review = json['review'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reviewer =
        json['reviewer'] != null ? Reviewer.fromJson(json['reviewer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reviewer_id'] = reviewerId;
    data['user_id'] = userId;
    data['rating'] = rating;
    data['review'] = review;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (reviewer != null) {
      data['reviewer'] = reviewer!.toJson();
    }
    return data;
  }
}

class Reviewer {
  int? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? name;

  Reviewer({this.id, this.firstName, this.lastName, this.avatar, this.name});

  Reviewer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    data['name'] = name;
    return data;
  }
}
