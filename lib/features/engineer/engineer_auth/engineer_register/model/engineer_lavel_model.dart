class engineerlavelmodel {
  List<lavelData>? data;
  String? message;
  int? status;

  engineerlavelmodel({this.data, this.message, this.status});

  engineerlavelmodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <lavelData>[];
      json['data'].forEach((v) {
        data!.add(new lavelData.fromJson(v));
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

class lavelData {
  String? id;
  String? name;

  lavelData({this.id, this.name});

  lavelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
