import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/widgets/custom_textfield.dart';
import 'package:plany/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF79867F),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", height: 120),
                const SizedBox(height: 50),
                CustomTextfield(
                  txtController: authC.username,
                  hinttext: "Username",
                  obscureText: false,
                  icon: Icons.person,

                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => CustomTextfield(
                    txtController: authC.password,
                    hinttext: "Password",
                    obscureText: authC.obscurePassword.value,
                    icon: Icons.lock,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: !authC.obscurePassword.value,
                        onChanged: (value) {
                          authC.obscurePassword.value = !value!;
                        },
                      ),
                      const Text("Show Password"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                      authC.auth();
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
