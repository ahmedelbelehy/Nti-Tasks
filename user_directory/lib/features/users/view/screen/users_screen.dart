import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_directory/features/users/cubit/users_cubit.dart';
import 'package:user_directory/features/users/view/widget/appbar.dart';
import 'package:user_directory/features/users/view/widget/user_body.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersCubit()..fetchUsers(),
      child: Scaffold(appBar: const AppbarScreen(title: "Users",), body: const UserBody()),
    );
  }
}
