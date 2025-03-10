class CustomerHomeProfileModel {
  Data? data;
  String? message;
  int? status;

  CustomerHomeProfileModel({this.data, this.message, this.status});

  CustomerHomeProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['service'] = service;
    data['about'] = about;
    data['avatar'] = avatar;
    data['address'] = address;
    data['role'] = role;
    data['level'] = level;
    data['name'] = name;
    return data;
  }
}
