import 'package:b_sims/src/config/getx/auth_getx.dart';
import 'package:b_sims/src/widget/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../root.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AuthFormField(
              'Nama',
              hint: 'johnson',
              controller: authController.nameController.value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AuthFormField(
              'Username',
              hint: 'username',
              controller: authController.usernameController.value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AuthFormField(
              'Email',
              hint: 'john@gmail.com',
              controller: authController.emailController.value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AuthFormField(
              'Password',
              hint: 'john@gmail.com',
              password: true,
              controller: authController.passwordController.value,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              authController.register();
            },
            child: const Text("Daftar"),
          ),
        ],
      ),
    );
  }
}
