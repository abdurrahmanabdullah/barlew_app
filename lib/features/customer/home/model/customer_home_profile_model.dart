class CustomerHomeProfileModel {
  Data? data;
  String? message;
  int? status;

  CustomerHomeProfileModel({this.data, this.message, this.status});

  CustomerHomeProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? name;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.service,
      this.about,
      this.avatar,
      this.address,
      this.role,
      this.level,
      this.name});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    service = json['service'];
    about = json['about'];
    avatar = json['avatar'];
    address = json['address'];
    role = json['role'];
    level = json['level'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['service'] = this.service;
    data['about'] = this.about;
    data['avatar'] = this.avatar;
    data['address'] = this.address;
    data['role'] = this.role;
    data['level'] = this.level;
    data['name'] = this.name;
    return data;
  }
}
