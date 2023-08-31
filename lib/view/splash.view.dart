import "dart:async";
import "package:fitness2/view/dashboard.view.dart";
import 'package:get/get.dart';
import "package:fitness2/utils/global.colors.dart";
import "package:fitness2/view/login.view.dart";
import "package:flutter/material.dart";

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    ///this section takes the opens a new screen after a specific duration
    Timer(const Duration(seconds: 5), () {
      Get.to(() => LoginView());
      // Get.to(() => DashboardView());
    });
    return Scaffold(
        backgroundColor: GlobalColors.mainColor,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              'SWEATSQUAD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
