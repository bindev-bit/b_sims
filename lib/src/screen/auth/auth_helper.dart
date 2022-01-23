import 'package:animations/animations.dart';
import 'package:b_sims/src/config/const.dart';
import 'package:b_sims/src/config/getx/onboarding_getx.dart';
import 'package:b_sims/src/root.dart';
import 'package:b_sims/src/widget/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperAuth extends StatefulWidget {
  const HelperAuth({Key? key}) : super(key: key);

  @override
  State<HelperAuth> createState() => _HelperAuthState();
}

class _HelperAuthState extends State<HelperAuth> {
  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;

  int _currentIndex = 0;
  final OnBoardingController onBoardingController = Get.find();

  final List<Widget> _listScreen = const [
    EmailScreen(),
    ConfirmEmail(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.lock,
                          color: primaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                    PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 1200),
                      transitionBuilder: (child, primary, secondary) =>
                          SharedAxisTransition(
                        fillColor: Colors.transparent,
                        animation: primary,
                        secondaryAnimation: secondary,
                        transitionType: _transitionType,
                        child: child,
                      ),
                      child: _listScreen[_currentIndex],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _currentIndex == 1
                              ? InkWell(
                                  onTap: () => setState(() {
                                    _currentIndex = 0;
                                  }),
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    child: Text(
                                      "Kembali",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          ElevatedButton(
                            onPressed: () async {
                              if (_currentIndex == 1) {
                                onBoardingController.removeFirstBuild();
                                Get.to(const Root());
                              } else {
                                setState(() {
                                  _currentIndex = 1;
                                });
                              }
                            },
                            child: const Text("Selanjutnya"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Tidak memiliki data ?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(8.0),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      "Masuk",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Kesulitan untuk masuk ?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              "Masukkan Email anda dan kode akan dikirim melalui E-mail anda",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: AuthFormField(
              'Email',
              hint: 'Masukkan alamat email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ConfirmEmail extends StatelessWidget {
  const ConfirmEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Kode konfirmasi",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              "Kami mengirimkan  sebuah email kepada i********g@gmail.com dengan sebuah tautan untuk kembali ke akun anda",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: AuthFormField(
              'Kode konfirmasi',
              hint: 'Masukkan kode konfirmasi email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
