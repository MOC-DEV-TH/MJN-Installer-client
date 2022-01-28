import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app_constants.dart';

class AppUtils {
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

  static AppBar customAppBar() {
    return AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Color(int.parse(MJNColors.bgColor)
        ),
        title: Container(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage('assets/splash_screen_logo.png'),
            width: 200,
            height: 100,
          ),)

    );
  }

  static Future<void> removeDataFromGetStorage() async {
    final box = GetStorage();
    box.remove(TOKEN);
    box.remove(UID);
    box.remove(ALL_DROP_DOWN_LISTS);
  }

  static void showSessionExpireDialog(String title, String message,
      BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) =>
              Center(
                child: Container(
                  height: 270,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  //child: Material(
                  //child: Container(
                  padding: EdgeInsets.all(4),
                  color: Color(int.parse(MJNColors.bgColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 60,
                        color: Colors.black,
                      ),
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.5555,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.0625,
                          child: RaisedButton(
                              color: Colors.white,
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              onPressed: () {
                                Get.back();
                                AppUtils.removeDataFromGetStorage().then(
                                        (value) =>
                                    {
                                      Get.offAllNamed(LOGIN)
                                    });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
    });
  }

}