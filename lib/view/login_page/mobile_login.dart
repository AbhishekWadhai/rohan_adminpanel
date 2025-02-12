import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsivedashboard/controller/login_controller.dart';
import 'package:responsivedashboard/widgets/custom_textfield.dart';


class LoginPageMobile extends StatelessWidget {
  final loginController = Get.put(LoginController());

  LoginPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/rohan_logo.png",
                  width: 50,
                ),
                const Text(
                  "Rohan Atmaraksha",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 80.0),
                const Text(
                  "Welcome To Atmaraksha!",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Login to Continue...",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20.0),
              Form(
              key: loginController.formKey,
              child: Column(
               
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
                    child: Text("Forgot Password ?"),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: 50,
            
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.black
                      ),
                      onPressed: loginController.handleLogin,
                      child: const Text('Login', style: TextStyle(),),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "By clicking continue, you agree to our Terms of Service and Privacy Policy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
