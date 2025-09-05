import 'package:flutter/material.dart';

// CustomTextfield
class CustomTextfield extends StatelessWidget {
  final TextEditingController txtController;
  final String label;
  final bool obscureText;
  final IconData icon;

  const CustomTextfield({
    super.key,
    required this.txtController,
    required this.label,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFEDEDDD),
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.black87),
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

// LoginPage
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF79867F), // abu hijau background
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo image
                Image.asset(
                  "assets/images/logo.png", // ganti sesuai path logo
                  height: 120,
                ),
                const SizedBox(height: 50),

                // Username
                CustomTextfield(
                  txtController: _usernameController,
                  label: "Username",
                  obscureText: false,
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),

                // Password
                CustomTextfield(
                  txtController: _passwordController,
                  label: "Password",
                  obscureText: _obscurePassword,
                  icon: Icons.lock,
                ),

                // Show password
                Row(
                  children: [
                    Checkbox(
                      value: !_obscurePassword,
                      onChanged: (value) {
                        setState(() {
                          _obscurePassword = !value!;
                        });
                      },
                    ),
                    const Text("Show Password"),
                  ],
                ),
                const SizedBox(height: 20),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBBA588),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // aksi login
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
