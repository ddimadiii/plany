import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plany/controllers/auth_controller.dart' show AuthController;

class WideLoginPage extends StatefulWidget {
  const WideLoginPage({super.key});

  @override
  State<WideLoginPage> createState() => _WideLoginPageState();
}

class _WideLoginPageState extends State<WideLoginPage> {
  bool showPassword = false;
  final AuthController authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final Color background = const Color(0xFF78847E); // gray green
    final Color inputColor = const Color(0xFFF1EFD8); // light beige
    final Color buttonColor = const Color(0xFFC1A684); // brownish beige

    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // === Enlarged Logo ===
              Image.asset(
                'assets/images/logo.png',
                height: 180, // bigger
                width: 180,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 60),

              // === Username Field ===
              Container(
                decoration: BoxDecoration(
                  color: inputColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // === Password Field ===
              Container(
                decoration: BoxDecoration(
                  color: inputColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // === Show Password Checkbox ===
              Row(
                children: [
                  Checkbox(
                    value: showPassword,
                    onChanged: (val) {
                      setState(() => showPassword = val!);
                    },
                    activeColor: buttonColor,
                  ),
                  const Text(
                    'Show Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // === Login Button ===
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: authC.auth,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:plany/widgets/custom_textfield.dart';
// import 'package:plany/controllers/auth_controller.dart';

// class WideLoginPage extends StatelessWidget {
//   WideLoginPage({super.key});
//   final AuthController authC = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF79867F),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   "assets/images/logo.png",
//                   height: 500, // Added height
//                   width: 500,  // Added width
//                 ),
//                 const SizedBox(height: 50),
//                 CustomTextfield(
//                   txtController: authC.username,
//                   hinttext: "Username",
//                   obscureText: false,
//                   icon: Icons.person,

//                   floatingLabelBehavior: FloatingLabelBehavior.never,
//                 ),
//                 const SizedBox(height: 20),
//                 Obx(
//                   () => CustomTextfield(
//                     txtController: authC.password,
//                     hinttext: "Password",
//                     obscureText: authC.obscurePassword.value,
//                     icon: Icons.lock,
//                     floatingLabelBehavior: FloatingLabelBehavior.never,
//                   ),
//                 ),
//                 Obx(
//                   () => Row(
//                     children: [
//                       Checkbox(
//                         value: !authC.obscurePassword.value,
//                         onChanged: (value) {
//                           authC.obscurePassword.value = !value!;
//                         },
//                       ),
//                       const Text("Show Password"),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFBBA588),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {
//                       authC.auth();
//                     },
//                     child: const Text(
//                       "wide Login",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
