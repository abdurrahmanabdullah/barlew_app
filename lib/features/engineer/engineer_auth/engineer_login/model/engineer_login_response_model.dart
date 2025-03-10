// ignore: camel_case_types
// ignore_for_file: prefer_collection_literals

// ignore: camel_case_types
class engineer_login_response_model {
  bool? status;
  String? message;
  String? tokenType;
  String? token;
  Data? data;

  engineer_login_response_model(
      {this.status, this.message, this.tokenType, this.token, this.data});

  engineer_login_response_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    tokenType = json['token_type'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['token_type'] = tokenType;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
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
  List<Portfolios>? portfolios;
  List<Skills>? skills;

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
      this.name,
      this.portfolios,
      this.skills});

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
    if (json['portfolios'] != null) {
      portfolios = <Portfolios>[];
      json['portfolios'].forEach((v) {
        portfolios!.add(Portfolios.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    if (portfolios != null) {
      data['portfolios'] = portfolios!.map((v) => v.toJson()).toList();
    }
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Portfolios {
  int? id;
  String? image;

  Portfolios({this.id, this.image});

  Portfolios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}

class Skills {
  int? id;
  String? name;

  Skills({this.id, this.name});

  Skills.fromJson(Map<String, dynamic> json) {
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
