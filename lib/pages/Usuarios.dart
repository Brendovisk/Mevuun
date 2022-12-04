import 'dart:convert';

class Usuario {
  Id? id;
  String? name;
  String? lastname;
  String? email;
  String? password;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;
  V? vV;

  Usuario(
      {this.id,
      this.name,
      this.lastname,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.vV});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'] != null
        ? new CreatedAt.fromJson(json['createdAt'])
        : null;
    updatedAt = json['updatedAt'] != null
        ? new CreatedAt.fromJson(json['updatedAt'])
        : null;
    vV = json['__v'] != null ? new V.fromJson(json['__v']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['_id'] = this.id!.toJson();
    }
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt!.toJson();
    }
    if (this.updatedAt != null) {
      data['updatedAt'] = this.updatedAt!.toJson();
    }
    if (this.vV != null) {
      data['__v'] = this.vV!.toJson();
    }
    return data;
  }

  String? getName() {
    return this.name;
  }

  String? getLastName() {
    return this.lastname;
  }

  String? getEmail() {
    return this.email;
  }

  String? getPassword() {
    return this.password;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}

class CreatedAt {
  Date? date;

  CreatedAt({this.date});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    date = json['$date'] != null ? new Date.fromJson(json['$date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.date != null) {
      data['$date'] = this.date!.toJson();
    }
    return data;
  }
}

class Date {
  String? numberLong;

  Date({this.numberLong});

  Date.fromJson(Map<String, dynamic> json) {
    numberLong = json['$numberLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberLong'] = this.numberLong;
    return data;
  }
}

class V {
  String? numberInt;

  V({this.numberInt});

  V.fromJson(Map<String, dynamic> json) {
    numberInt = json['$numberInt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberInt'] = this.numberInt;
    return data;
  }
}
