import 'package:b_sims/src/config/const.dart';
import 'package:b_sims/src/config/getx/auth_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';
import 'register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _currentIndex = 0;

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: primaryColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  color: const Color(0xff7A8AFF),
                  child: Image.asset(
                    'assets/images/onboarding_login.png',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "SISTEM INFORMASI KEPELABUHAN ONLINE",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1.5,
                          color: Colors.white54,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Merupakan Sistem Informasi Kepelabuhan Online dimana Pengajuan Permohonan Izin Kepelabuhan di Layani Secara Online di Lingkungan Badan Pengusahaan Batam ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _btnAuth('Login', 0),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  _btnAuth('Register', 1),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Offstage(
                              offstage: authController.errorMessage.value == "",
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: const Text(
                                  "* email dan password salah",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            _currentIndex == 0
                                ? LoginScreen()
                                : RegisterScreen()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _btnAuth(String title, int id) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: _currentIndex == id ? Colors.white : primaryColor,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            setState(() {
              _currentIndex = id;
            });
          },
          borderRadius: BorderRadius.circular(5.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10.0,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: _currentIndex == id ? primaryColor : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
