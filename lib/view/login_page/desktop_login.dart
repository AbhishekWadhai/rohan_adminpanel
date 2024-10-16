import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsivedashboard/controller/login_controller.dart';
import 'package:responsivedashboard/routes/routes_string.dart';
import 'package:responsivedashboard/widgets/custom_textfield.dart';

class LoginPageDesktop extends StatelessWidget {
  final loginController = Get.put(LoginController());

  LoginPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenWidth * 0.05), // Padding based on screen size
        child: Center(
          child: Container(
            width: screenWidth * 0.9, // Width adjusts with screen size
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue.shade50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left Section
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/rohan_logo.png",
                        width: screenWidth *
                            0.15, // Logo size scales with screen size
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Rohan Atmaraksha",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "By clicking continue, you agree to our Terms of Service and Privacy Policy.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.09,
                ),
                // Right Section (Login Form)
                Container(
                  height:
                      screenHeight * 0.7, // Adjust height based on screen size
                  width: screenWidth * 0.35, // Responsive width for form
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                        screenWidth * 0.03), // Responsive padding
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome To Atmaraksha!",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Login to Continue...",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20.0),
                        Form(
                          key: loginController.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CustomTextField(
                                fieldName: 'Username',
                                controller: loginController.usernameController,
                                labelText: 'Enter Username',
                                validator: loginController.validateUsername,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                fieldName: 'Password',
                                controller: loginController.passwordController,
                                labelText: 'Enter Password',
                                isPassword: true,
                                validator: loginController.validatePassword,
                              ),
                              const SizedBox(height: 20),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Forgot Password?"),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: screenWidth *
                                    0.4, // Button width scales with screen
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  // onPressed: () {
                                  //   Get.toNamed(Routes.homePage);
                                  // },
                                  onPressed: loginController.handleLogin,
                                  child: const Text('Login'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
