class RegisterData {
  final String name;
  final String email;
  final String phone;
  final String nationalId;
  final String gender;
  final String token;
  final String profileImage;

  RegisterData({
    required this.name,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.gender,
    required this.token,
    required this.profileImage,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      nationalId: json['national_id'] ?? '',
      gender: json['gender'] ?? '',
      token: json['token'] ?? '',
      profileImage: json['profile_image'] ?? '',
    );
  }
}
