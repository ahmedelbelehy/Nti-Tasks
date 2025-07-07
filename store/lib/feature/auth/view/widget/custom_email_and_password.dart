import 'package:flutter/material.dart';

class CustomEmailAndPassword extends StatefulWidget {
  const CustomEmailAndPassword({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<CustomEmailAndPassword> createState() => _CustomEmailAndPasswordState();
}

class _CustomEmailAndPasswordState extends State<CustomEmailAndPassword> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            filled: true,
            fillColor: Colors.grey[100],
          ),
          validator: (v) => v!.isEmpty ? 'Enter email' : null,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: widget.passwordController,
          obscureText: obscurePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            filled: true,
            fillColor: Colors.grey[100],
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
            ),
          ),
          validator: (v) => v!.isEmpty ? 'Enter password' : null,
        ),
      ],
    );
  }
}
