import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:get/get.dart';

class AppUtils{
  static void showErrorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: Icon(Icons.error, color: Colors.black),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  static AppBar customAppBar(){
   return AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Color(int.parse(MJNColors.bgColor)
        ),
        title : Container(
          alignment: Alignment.center,
          child : Image(
            image: AssetImage('assets/splash_screen_logo.png'),
            width: 200,
            height: 100,
          ), )

    );
  }

}