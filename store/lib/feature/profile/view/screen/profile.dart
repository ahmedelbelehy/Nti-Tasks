import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/auth/model/user_model.dart';
import 'package:store/feature/home_page/view/screens/home_screen.dart';
import 'package:store/feature/profile/cubit/cubit/profile_state.dart';
import 'package:store/feature/profile/cubit/cubit/profile_cubit.dart';
import 'package:store/feature/profile/services/profile_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final nationalIdController = TextEditingController();

  Future<void> updateProfile() async {
    try {
      await ProfileServices().updateProfile(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        gender: genderController.text,
        nationalId: nationalIdController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text('Profile updated successfully!'),
            ],
          ),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.fromLTRB(24, 12, 24, 80),
          duration: const Duration(seconds: 2),
        ),
      );

      passwordController.clear();
      context.read<ProfileCubit>().getProfile();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text('Update failed: $e')),
            ],
          ),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.fromLTRB(24, 12, 24, 80),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> deleteProfile() async {
    try {

      await ProfileServices().deleteProfile();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.delete, color: Colors.white),
              SizedBox(width: 12),
              Text('Profile deleted successfully!'),
            ],
          ),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.fromLTRB(24, 12, 24, 80),
          duration: const Duration(seconds: 2),
        ),
      );
     
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text('Delete failed: $e')),
            ],
          ),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.fromLTRB(24, 12, 24, 80),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..getProfile(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6D5BFF), Color(0xFF46C2CB)],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Tooltip(
                            message: 'Go Home',
                            child: IconButton(
                              icon: const Icon(
                                Icons.home,
                                color: Color(0xFF6D5BFF),
                                size: 32,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (_) => const HomeScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is ProfileLoaded) {
                            final UserModel user = state.user;
                            nameController.text = user.name;
                            emailController.text = user.email;
                            phoneController.text = user.phone;
                            genderController.text = user.gender;
                            nationalIdController.text = user.nationalId;

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                    user.profileImage,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                _buildTextField(
                                  "Name",
                                  Icons.person,
                                  nameController,
                                ),
                                const SizedBox(height: 12),
                                _buildTextField(
                                  "Email",
                                  Icons.email,
                                  emailController,
                                ),
                                const SizedBox(height: 12),
                                _buildTextField(
                                  "Phone",
                                  Icons.phone,
                                  phoneController,
                                ),
                                const SizedBox(height: 12),
                                _buildTextField(
                                  "Gender",
                                  Icons.wc,
                                  genderController,
                                ),
                                const SizedBox(height: 12),
                                _buildTextField(
                                  "National ID",
                                  Icons.credit_card,
                                  nationalIdController,
                                ),
                                const SizedBox(height: 12),
                                _buildTextField(
                                  "New Password",
                                  Icons.lock,
                                  passwordController,
                                  isPassword: true,
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton.icon(
                                  onPressed: updateProfile,
                                  icon: const Icon(Icons.save),
                                  label: const Text(
                                    'Save',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6D5BFF),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    minimumSize: const Size.fromHeight(48),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    elevation: 4,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      final confirm = await showDialog<bool>(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('Delete Profile'),
                                          content: const Text(
                                            'Are you sure you want to delete your profile? This action cannot be undone.',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.of(
                                                context,
                                              ).pop(false),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.of(
                                                context,
                                              ).pop(true),
                                              child: const Text(
                                                'Delete',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                      if (confirm == true) {
                                        await deleteProfile();
                                      }
                                    },
                                    icon: const Icon(Icons.delete),
                                    label: const Text('Delete Profile'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red.shade700,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      elevation: 4,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (state is ProfileError) {
                            return Center(
                              child: Text('Error:  ${state.message}'),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    IconData icon,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF6D5BFF)),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
