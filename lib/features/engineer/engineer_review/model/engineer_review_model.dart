class EngineerReviewModel {
  List<Data>? data;
  String? message;
  int? status;

  EngineerReviewModel({this.data, this.message, this.status});

  EngineerReviewModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
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
    reviewer = json['reviewer'] != null
        ? new Reviewer.fromJson(json['reviewer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reviewer_id'] = this.reviewerId;
    data['user_id'] = this.userId;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.reviewer != null) {
      data['reviewer'] = this.reviewer!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    return data;
  }
}
