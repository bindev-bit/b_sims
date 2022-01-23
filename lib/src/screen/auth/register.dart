import 'package:b_sims/src/config/getx/onboarding_getx.dart';
import 'package:b_sims/src/widget/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../root.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final OnBoardingController onBoardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: AuthFormField('Nama', hint: 'johnson')),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: AuthFormField('Username', hint: 'username'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: AuthFormField('Email', hint: 'john@gmail.com'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: AuthFormField(
              'Password',
              hint: 'john@gmail.com',
              password: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              onBoardingController.removeFirstBuild();
              Get.to(const Root());
            },
            child: const Text("Daftar"),
          ),
        ],
      ),
    );
  }
}
