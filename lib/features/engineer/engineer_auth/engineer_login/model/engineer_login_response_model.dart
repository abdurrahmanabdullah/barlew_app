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
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token_type'] = this.tokenType;
    data['token'] = this.token;
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
        portfolios!.add(new Portfolios.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
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
    if (this.portfolios != null) {
      data['portfolios'] = this.portfolios!.map((v) => v.toJson()).toList();
    }
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
