import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../animated/utils.dart';
import '../views/Log_In_Screen.dart';

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>(); // Add scaffoldKey here

  final wtController = TextEditingController();
  final inController = TextEditingController();
  final htController = TextEditingController();
  final nameController = TextEditingController();

  var bmi = 0.0.obs; // Observable BMI value
  var bmiCategory = ''.obs; // Observable BMI category

  void calculateBMI() {
    if (wtController.text.isEmpty ||
        htController.text.isEmpty ||
        inController.text.isEmpty) {
      Utils.snackBar('Please fill all fields', '');
    } else {
      var iWt = double.parse(wtController.text); // Weight in kg
      var iFt = double.parse(htController.text); // Height in feet
      var iInch = double.parse(inController.text); // Height in inches

      var tInch = (iFt * 12) + iInch;
      var tCm = tInch * 2.54;
      var tM = tCm / 100;

      var calculatedBMI = iWt / (tM * tM);
      bmi.value = calculatedBMI;
      bmiCategory.value = getBMICategory(calculatedBMI); // Set the BMI category
    }
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  Future<void> logOut() async {
    // Clear any user session data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate to the login screen
    Get.offAll(() => LoginScreen());
  }

  void showLogoutConfirmationDialog() {
    Get.defaultDialog(
      title: "Logout",
      content: Text("Are you sure you want to logout?"),
      confirm: TextButton(
        onPressed: () {
          // Perform logout action
          logOut();
        },
        child: Text("Yes"),
      ),
      cancel: TextButton(
        onPressed: () {
          // Dismiss the dialog
          Get.back();
        },
        child: Text("No"),
      ),
    );
  }
}
