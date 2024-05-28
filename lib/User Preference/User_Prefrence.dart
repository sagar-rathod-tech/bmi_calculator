import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class AppStartupScreen extends StatelessWidget {
  const AppStartupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();

    return Scaffold(
      body: Center(
        child: Obx(() {
          if (userController.username.isEmpty) {
            return CircularProgressIndicator(); // Show a loading indicator while checking user login status
          } else {
            // This will not be visible as the user will be redirected
            return Text('Redirecting...');
          }
        }),
      ),
    );
  }
}
