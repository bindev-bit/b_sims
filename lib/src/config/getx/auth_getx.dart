import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import '../../root.dart';
import '../const.dart';

class AuthController extends GetxController {
  var nameController = TextEditingController().obs;
  var usernameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  RxString errorMessage = "".obs;

  GetStorage authStorage = GetStorage('authStorage');
  var isLogin = false.obs;

  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  checkAuth() {
    if (authStorage.read('isLogin') == null || !authStorage.read('isLogin')) {
      isLogin.value = false;
      authStorage.write('isLogin', false);
    } else {
      isLogin.value = true;
      authStorage.write('isLogin', true);
    }
    update();
  }

  Future login() async {
    try {
      var resp = await http.post(Uri.parse('$URL/login'), body: {
        'email': emailController.value.text,
        'password': passwordController.value.text,
      }, headers: {
        'Accept': 'application/json'
      });

      log(resp.statusCode.toString());

      if (resp.statusCode == 500) {
        authStorage.write('isLogin', true);
        isLogin.value = true;
        errorMessage.value = "";

        _clearData();
        await Future.delayed(
          const Duration(milliseconds: 800),
          () => Get.offAll(const Root()),
        );
      } else {
        errorMessage.value = "email dan password salah";
      }
    } catch (e) {
      errorMessage.value = "email dan password salah";
      log(e.toString());
      return null;
    }
  }

  Future register() async {
    try {
      var resp = await http.post(Uri.parse('$URL/register'), body: {
        'name': nameController.value.text,
        'username': usernameController.value.text,
        'email': emailController.value.text,
        'password': passwordController.value.text,
      }, headers: {
        'Accept': 'application/json'
      });

      if (resp.statusCode == 500) {
        authStorage.write('isLogin', true);
        isLogin.value = true;
        errorMessage.value = "";

        _clearData();
        await Future.delayed(
          const Duration(milliseconds: 800),
          () => Get.offAll(const Root()),
        );
      } else {
        errorMessage.value = "kolom tidak boleh kosong";
      }
    } catch (e) {
      errorMessage.value = "kolom tidak boleh kosong";
      log(e.toString());
      return null;
    }
  }

  logOut() {
    authStorage.write('isLogin', false);
    authStorage.remove('user');
    isLogin.value = false;
  }

  void _clearData() {
    usernameController.value.clear();
    nameController.value.clear();
    emailController.value.clear();
    passwordController.value.clear();
  }

  @override
  void dispose() {
    _clearData();
    super.dispose();
  }
}
