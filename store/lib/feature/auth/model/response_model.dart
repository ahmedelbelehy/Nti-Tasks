import 'package:store/feature/auth/model/user_model.dart';

class ResponseModel {
  final String message;
  final String status;
  final UserModel? user;

  ResponseModel(this.user, {required this.message, required this.status});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      json['user'] != null ? UserModel.fromJson(json['user']) : null,
      message: json['message'] ?? '',
      status: json['status'] ?? 'error',
    );
  }
}
