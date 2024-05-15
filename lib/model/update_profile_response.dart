import 'dart:convert';

UpdateProfileResponse updateProfileResponseFromJson(String str) =>
    UpdateProfileResponse.fromMap(json.decode(str));

String updateProfileResponseToJson(UpdateProfileResponse data) =>
    json.encode(data.toMap());

class UpdateProfileResponse {
  String? username;
  String? message;
  int? status;

//<editor-fold desc="Data Methods">
  UpdateProfileResponse({
    this.username,
    this.message,
    this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpdateProfileResponse &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          message == other.message &&
          status == other.status);

  @override
  int get hashCode => username.hashCode ^ message.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'UpdateProfileResponse{ username: $username, message: $message, status: $status,}';
  }

  UpdateProfileResponse copyWith({
    String? username,
    String? message,
    int? status,
  }) {
    return UpdateProfileResponse(
      username: username ?? this.username,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'message': message,
      'status': status,
    };
  }

  factory UpdateProfileResponse.fromMap(Map<String, dynamic> map) {
    return UpdateProfileResponse(
      username: map['username'] as String,
      message: map['message'] as String,
      status: map['status'] as int,
    );
  }

//</editor-fold>
}
