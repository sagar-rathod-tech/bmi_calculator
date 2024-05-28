import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/Home_Screen.dart';
import '../animated/utils.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var errorMessage = ''.obs;

  final Map<String, String> users = {
    'sagar': 'sagar',
    'sandeep': 'sandeep',
    'admin': 'admin',
  };

  @override
  void onInit() {
    super.onInit();
    _checkUserLoggedIn();
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (users.containsKey(email) && users[email] == password) {
      errorMessage.value = '';
      Utils.snackBar("Log In Success", 'Welcome To BMI Calculator');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', email);

      Get.offAll(() => HomeScreen());
    } else {
      errorMessage.value = 'Invalid username or password';
      Utils.snackBar("Log In Failed", 'Invalid Username And Password');
    }
  }

  Future<void> _checkUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');

    if (username != null) {
      Get.offAll(() => HomeScreen());
    }
  }
}
