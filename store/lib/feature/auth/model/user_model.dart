class UserModel {
  final String name;
  final String email;
  final String phone;
  final String nationalId;
  final String gender;
  final String profileImage;
  final String? token;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.gender,
    required this.profileImage,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      nationalId: json['national_id'] ?? '',
      gender: json['gender'] ?? '',
      profileImage: json['profile_image'] ?? '',
    );
  }
}
