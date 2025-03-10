class EngineerProfileModel {
  Data? data;
  String? message;
  int? status;

  EngineerProfileModel({this.data, this.message, this.status});

  EngineerProfileModel.fromJson(Map<String, dynamic> json) {
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
  List<Skills>? skills;
  List<Portfolios>? portfolios;

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
      this.skills,
      this.portfolios});

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
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
    if (json['portfolios'] != null) {
      portfolios = <Portfolios>[];
      json['portfolios'].forEach((v) {
        portfolios!.add(Portfolios.fromJson(v));
      });
    }
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
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    if (portfolios != null) {
      data['portfolios'] = portfolios!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
