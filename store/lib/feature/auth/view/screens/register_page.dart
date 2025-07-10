import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/auth/cubit/cubit/auth_cubit.dart';
import 'package:store/feature/auth/cubit/cubit/auth_state.dart';
import 'package:store/feature/auth/view/widget/custom_elevated_button.dart';
import 'package:store/feature/auth/view/widget/custom_email_and_password.dart';
import 'package:store/feature/auth/view/widget/custom_text_field.dart';
import 'package:store/feature/auth/view/widget/register.dart';
import 'package:store/feature/auth/view/widget/show_snackbar.dart';
import 'package:store/feature/home_page/view/screens/home_screen.dart';
import 'package:store/feature/auth/view/screens/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nationalIdController = TextEditingController();
  final genderController = TextEditingController();
  final passwordController = TextEditingController();
  String? profileImageBase64;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
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
                  child: BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        if (state.data.status == "error") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            showCustomSnackBar(
                              text: state.data.message,
                              color: Colors.redAccent,
                            ),
                          );
                          return;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            showCustomSnackBar(
                              text: 'Registration successful!',
                              color: Colors.green,
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      } else if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Registration failed: ${state.error}',
                            ),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.all(
                              16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      }
                    },
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImagePickerWidget(
                            onImageSelected: (base64) {
                              setState(() {
                                profileImageBase64 = base64;
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          CustomTextField(
                            controller: nameController,
                            label: 'Name',
                            icon: Icons.person,
                            validator: (v) => v!.isEmpty ? 'Enter name' : null,
                          ),
                          const SizedBox(height: 12),
                          CustomEmailAndPassword(
                            emailController: emailController,
                            passwordController: passwordController,
                          ),
                          const SizedBox(height: 12),
                          CustomTextField(
                            controller: phoneController,
                            label: 'Phone',
                            icon: Icons.phone,
                            keyboardType: TextInputType.phone,
                            validator: (v) => v!.isEmpty ? 'Enter phone' : null,
                          ),
                          const SizedBox(height: 12),
                          CustomTextField(
                            controller: nationalIdController,
                            label: 'National ID',
                            icon: Icons.credit_card,
                            validator: (v) => v!.isEmpty ? 'Enter ID' : null,
                          ),
                          const SizedBox(height: 12),
                          CustomTextField(
                            controller: genderController,
                            label: 'Gender',
                            icon: Icons.wc,
                            validator: (v) =>
                                v!.isEmpty ? 'Enter gender' : null,
                          ),
                          const SizedBox(height: 24),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return CustomElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().register(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      nationalId: nationalIdController.text,
                                      gender: genderController.text,
                                      password: passwordController.text,
                                      profileImage: profileImageBase64 ?? '',
                                    );
                                  }
                                },
                                state: state,
                                text: 'Register',
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nationalIdController.dispose();
    genderController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
