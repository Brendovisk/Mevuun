class Usuario {
  String? name;
  String? lastname;
  String? email;
  String? password;

  Usuario({this.name, this.lastname, this.email, this.password});

  Usuario.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lastname'] = lastname;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
