import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_directory/features/user_details/view/screen/user_details_screen.dart';
import 'package:user_directory/features/users/cubit/users_cubit.dart';
import 'package:user_directory/features/users/cubit/users_state.dart';

class UserBody extends StatelessWidget {
  const UserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (state is UsersLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(28),
              itemCount: state.users.length,
              separatorBuilder: (context, i) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final user = state.users[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailsScreen(user: user),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.18),
                          blurRadius: 18,
                          spreadRadius: 2,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 20,
                      ),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.blue[700],
                        child: Text(
                          user.name.isNotEmpty ? user.name[0] : '?',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      title: Text(
                        user.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.blue,
                          letterSpacing: 0.5,
                        ),
                      ),
                      subtitle: Text(
                        user.email,
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 22,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is UsersError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
