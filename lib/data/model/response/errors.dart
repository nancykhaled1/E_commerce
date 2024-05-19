/// message : "error"
/// err : "Email is found"

class Errors {
  Errors({
      this.message, // statusmsg
      this.err,});   // msg

  Errors.fromJson(dynamic json) {
    message = json['message'];
    err = json['err'];
  }
  String? message;
  String? err;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['err'] = err;
    return map;
  }

}