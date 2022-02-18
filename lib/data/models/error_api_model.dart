
class ErrorApiModel {
  Error? error;

  ErrorApiModel.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ?  Error.fromJson(json['error']) : null;
  }

}

class Error {
  String? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

}