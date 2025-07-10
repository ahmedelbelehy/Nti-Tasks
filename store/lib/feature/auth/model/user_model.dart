class UserModel {
  final String name;
  final String email;
  final String nationalId;
  final String phone;
  final String gender;
  final String profileImage;
  final String? token;

  UserModel({
    required this.name,
    required this.email,
    required this.nationalId,
    required this.phone,
    required this.gender,
    required this.profileImage,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      nationalId: json['nationalId'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'national_id': nationalId,
      'phone': phone,
      'gender': gender,
      'profile_image': profileImage,
      if (token != null) 'token': token,
    };
  }
}