import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromMap(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toMap());

class LoginResponse {
  String? username;
  String? message;
  int? statusCode;

//<editor-fold desc="Data Methods">
  LoginResponse({
    this.username,
    this.message,
    this.statusCode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginResponse &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          message == other.message &&
          statusCode == other.statusCode);

  @override
  int get hashCode => username.hashCode ^ message.hashCode ^ statusCode.hashCode;

  @override
  String toString() {
    return 'LoginResponse{ username: $username, message: $message, status: $statusCode,}';
  }

  LoginResponse copyWith({
    String? username,
    String? message,
    int? status,
  }) {
    return LoginResponse(
      username: username ?? this.username,
      message: message ?? this.message,
      statusCode: status ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'message': this.message,
      'status': this.statusCode,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      username: map['username'] as String,
      message: map['message'] as String,
      statusCode: map['status'] as int,
    );
  }

//</editor-fold>
}
