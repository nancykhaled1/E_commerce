/// name : "hasan"
/// email : "hasan7@gmail.com"
/// password : "9823451"
/// phone : "089327912141"
/// role : "admin"

class SignupRequest {
  SignupRequest({
      this.name, 
      this.email, 
      this.password, 
      this.phone, 
      });


  String? name;
  String? email;
  String? password;
  String? phone;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;

    return map;
  }

}