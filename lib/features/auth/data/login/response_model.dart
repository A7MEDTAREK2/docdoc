class ResponseModel {
  final String message;
  final bool status;
  final int code;
  final UserData data;

  ResponseModel({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'],
      status: json['status'],
      code: json['code'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "status": status,
      "code": code,
      "data": data.toJson(),
    };
  }
}

class UserData {
  final String token;
  final String username;

  UserData({
    required this.token,
    required this.username,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "username": username,
    };
  }
}