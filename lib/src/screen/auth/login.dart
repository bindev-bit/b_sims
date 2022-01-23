import 'package:b_sims/src/config/getx/onboarding_getx.dart';
import 'package:b_sims/src/screen/auth/auth_helper.dart';
import 'package:b_sims/src/widget/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../root.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final OnBoardingController onBoardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AuthFormField('Email', hint: 'john@gmail.com'),
          const SizedBox(
            height: 20,
          ),
          const AuthFormField(
            'Password',
            hint: 'john@gmail.com',
            password: true,
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
              onBoardingController.removeFirstBuild();
              Get.to(const Root());
            },
            child: const Text("Masuk"),
          ),
        ],
      ),
    );
  }
}
