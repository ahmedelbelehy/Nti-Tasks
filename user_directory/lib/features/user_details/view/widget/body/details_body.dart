import 'package:flutter/material.dart';
import 'package:user_directory/features/user_details/view/widget/widget/user_info.dart';
import 'package:user_directory/features/users/model/user_model.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.user});

  final User user;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue,
          child: Text(
            user.name.isNotEmpty ? user.name[0] : '?',
            style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 12),
        Divider(color: Colors.blue, thickness: 1),
        const SizedBox(height: 12),
        UserInfo(icon: Icons.person, label: 'Username', value: user.username),
        const SizedBox(height: 10),
        UserInfo(icon: Icons.email, label: 'Email', value: user.email),

        const SizedBox(height: 10),
        UserInfo(icon: Icons.phone, label: 'Phone', value: user.phone),
        const SizedBox(height: 10),
        UserInfo(
          icon: Icons.location_on,
          label: 'Address',
          value: user.address,
        ),
      ],
    );
  }
}
