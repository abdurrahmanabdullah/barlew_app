// ignore: camel_case_types
// ignore_for_file: prefer_collection_literals

// ignore: camel_case_types
class engineerlavelmodel {
  List<lavelData>? data;
  String? message;
  int? status;

  engineerlavelmodel({this.data, this.message, this.status});

  engineerlavelmodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <lavelData>[];
      json['data'].forEach((v) {
        data!.add(lavelData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

// ignore: camel_case_types
class lavelData {
  String? id;
  String? name;

  lavelData({this.id, this.name});

  lavelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
