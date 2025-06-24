class User {
  final int id;
  final String email;
  final String username;
  final String name;
  final String phone;
  final String address;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.name,
    required this.phone,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final address = json['address'];
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      name: name != null ? "${name['firstname']} ${name['lastname']}" : '',
      phone: json['phone'] ?? '',
      address: address != null
          ? "${address['city']}, ${address['street']}"
          : '',
    );
  }
}
