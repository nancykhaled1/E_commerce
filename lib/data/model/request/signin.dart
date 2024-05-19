/// email : "hasaq"
/// password : "982345"

class SigninRequest {
  SigninRequest({
      this.email, 
      this.password,});

  SigninRequest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}