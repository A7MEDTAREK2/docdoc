class SignupModel {
  final String message;
  final SignupData data;
  final bool status;
  final int code;

  SignupModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      message: json['message'],
      data: SignupData.fromJson(json['data']),
      status: json['status'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(),
      'status': status,
      'code': code,
    };
  }
}

class SignupData {
  final String token;
  final String username;

  SignupData({
    required this.token,
    required this.username,
  });

  factory SignupData.fromJson(Map<String, dynamic> json) {
    return SignupData(
      token: json['token'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'username': username,
    };
  }
}