import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class Utils{

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current .unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: AppColor.blackcolor,
      textColor: AppColor.pinkcolor,
      gravity: ToastGravity.BOTTOM_RIGHT
    );
  }

  static snackBar(String message, String title){
   Get.snackbar(
       title,
       message,
     snackStyle: SnackStyle.FLOATING,
     backgroundColor: AppColor.pinkColor, // Adjust the color to your preference
     colorText: Colors.black, // Text color
     borderRadius: 5, // Border radius for the snackbar
     margin: EdgeInsets.all(10), // Margin around the snackbar
     snackPosition: SnackPosition.TOP, // Position of the snackbar
     duration: Duration(seconds: 3), // Duration to show the snackbar
   );
  }
}