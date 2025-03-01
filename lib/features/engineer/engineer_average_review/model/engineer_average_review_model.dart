class EngineerAverageReviewModel {
  Data? data;
  String? message;
  int? status;

  EngineerAverageReviewModel({this.data, this.message, this.status});

  EngineerAverageReviewModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? averageRating;
  int? reviewsCount;

  Data({this.averageRating, this.reviewsCount});

  Data.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    reviewsCount = json['reviews_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average_rating'] = this.averageRating;
    data['reviews_count'] = this.reviewsCount;
    return data;
  }
}
