import 'package:b_sims/src/config/getx/auth_getx.dart';
import 'package:b_sims/src/config/getx/onboarding_getx.dart';
import 'package:b_sims/src/screen/auth/auth_helper.dart';
import 'package:b_sims/src/widget/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final OnBoardingController onBoardingController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthFormField(
            'Email',
            hint: 'john@gmail.com',
            controller: authController.emailController.value,
          ),
          const SizedBox(
            height: 20,
          ),
          AuthFormField(
            'Password',
            hint: 'john@gmail.com',
            password: true,
            controller: authController.passwordController.value,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelperAuth(),
                  ),
                ),
                borderRadius: BorderRadius.circular(8.0),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Kesulitan untuk masuk ?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              authController.login();
              // Get.to(const Root());
            },
            child: const Text("Masuk"),
          ),
          TextButton(
            onPressed: () async {
              if (!await launch("https://devb-sims.bpbatam.go.id/")) {
                throw 'Could not launch https://devb-sims.bpbatam.go.id/';
              }
            },
            child: const Text(
              "Forgot password ?",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
