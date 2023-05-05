import 'package:ambulance/src/global/global.dart';
import 'package:ambulance/src/pages/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  static String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Ambulancer',
              style: Get.textTheme.bodyLarge?.copyWith(fontSize: 38),
            ),
            Image.asset('images/splash.jpg'),
            RichText(
              text: TextSpan(
                text: 'We\'re here ',
                style: Get.textTheme.bodyMedium?.copyWith(fontSize: 20),
                children: <TextSpan>[
                  TextSpan(
                      text: 'to help you',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: redColor,
                          fontSize: 20)),
                ],
              ),
            ),
            const SizedBox(height: 4),
            const Text('Do you need to call ambulance ?'),
            const SizedBox(height: 18),
            Container(
              height: 80,
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: foregroundColor),
                onPressed: () {
                  controller.checkForAuth();
                },
                child: const Text('Call Ambulance Now'),
              ),
            ),
            const SizedBox(height: 14),
            GestureDetector(
              onTap: () {
                controller.checkForAuth();
              },
              child: const Text(
                'I don\'t need ambulance right now',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationThickness: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
