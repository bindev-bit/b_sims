import 'package:b_sims/src/config/bindings/onboarding_bindings.dart';
import 'package:b_sims/src/config/mixins.dart';
import 'package:b_sims/src/screen/home/document/document_screen.dart';
import 'package:b_sims/src/screen/home/home_screen.dart';
import 'package:b_sims/src/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('onBoarding');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with CustomClass {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBar();
    return GetMaterialApp(
      initialBinding: AppBindings(),
      title: 'B Sims',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme,
      home: const Root(),
    );
  }
}
