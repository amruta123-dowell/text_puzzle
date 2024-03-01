import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_test/controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash_screen.jpg"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            child: const Text(
              "PLAY WORD GAME...",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}
