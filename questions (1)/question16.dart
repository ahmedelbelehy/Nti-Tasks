class User {
  String username;
  String email;
  bool isActive;

  User(this.username, this.email, this.isActive);

  void show() {
    print(username);
    print(email);
    if (!isActive) {
      print(' Account is inactive');
    }
  }
}

void main() {
  User user = User('user123', 'user@example.com', true);
  user.show();
}
