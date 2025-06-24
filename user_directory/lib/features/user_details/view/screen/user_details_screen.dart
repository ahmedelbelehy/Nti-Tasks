import 'package:flutter/material.dart';
import 'package:user_directory/features/user_details/view/widget/body/details_body.dart';
import 'package:user_directory/features/users/model/user_model.dart';
import 'package:user_directory/features/users/view/widget/appbar.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key, required this.user});

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreen(
        title: "User Details",
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.blue[900],
        child: Center(
          child: Card(
            color: Colors.white.withOpacity(0.95),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: DetailsBody(user: user),
            ),
          ),
        ),
      ),
    );
  }
}
