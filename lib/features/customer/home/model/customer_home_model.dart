// class CustomerHomeServiceModel {
//   int? status;
//   String? message;
//   List<Data>? data;
//   Pagination? pagination;

//   CustomerHomeServiceModel(
//       {this.status, this.message, this.data, this.pagination});

//   CustomerHomeServiceModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     pagination = json['pagination'] != null
//         ? Pagination.fromJson(json['pagination'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (pagination != null) {
//       data['pagination'] = pagination!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? title;
//   String? thumbnail;

//   Data({this.id, this.title, this.thumbnail, required String price});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     thumbnail = json['thumbnail'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['thumbnail'] = thumbnail;
//     return data;
//   }
// }

// class Pagination {
//   int? currentPage;
//   int? lastPage;
//   int? perPage;
//   int? total;
//   String? firstPageUrl;
//   String? lastPageUrl;
//   Null nextPageUrl;
//   Null prevPageUrl;
//   int? from;
//   int? to;
//   String? path;

//   Pagination(
//       {this.currentPage,
//       this.lastPage,
//       this.perPage,
//       this.total,
//       this.firstPageUrl,
//       this.lastPageUrl,
//       this.nextPageUrl,
//       this.prevPageUrl,
//       this.from,
//       this.to,
//       this.path});

//   Pagination.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     lastPage = json['last_page'];
//     perPage = json['per_page'];
//     total = json['total'];
//     firstPageUrl = json['first_page_url'];
//     lastPageUrl = json['last_page_url'];
//     nextPageUrl = json['next_page_url'];
//     prevPageUrl = json['prev_page_url'];
//     from = json['from'];
//     to = json['to'];
//     path = json['path'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['current_page'] = currentPage;
//     data['last_page'] = lastPage;
//     data['per_page'] = perPage;
//     data['total'] = total;
//     data['first_page_url'] = firstPageUrl;
//     data['last_page_url'] = lastPageUrl;
//     data['next_page_url'] = nextPageUrl;
//     data['prev_page_url'] = prevPageUrl;
//     data['from'] = from;
//     data['to'] = to;
//     data['path'] = path;
//     return data;
//   }
// }
///----------
import 'dart:convert';

class CustomerHomeServiceModel {
  int? status;
  String? message;
  List<Datum>? data;
  Pagination? pagination;

  CustomerHomeServiceModel({
    this.status,
    this.message,
    this.data,
    this.pagination,
  });

  factory CustomerHomeServiceModel.fromRawJson(String str) =>
      CustomerHomeServiceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerHomeServiceModel.fromJson(Map<String, dynamic> json) =>
      CustomerHomeServiceModel(
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
  String? title;
  String? thumbnail;
  String? price;

  Datum({
    this.id,
    this.title,
    this.thumbnail,
    this.price,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
