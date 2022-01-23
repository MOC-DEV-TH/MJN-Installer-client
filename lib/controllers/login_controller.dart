import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/network/RestApi.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:flutter_geolocator_example/views/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var userIdController = TextEditingController();
  var passwordController = TextEditingController();
  var isVisible = true;
  final writeData = GetStorage();
  var isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void login() {
    {
      debugPrint('click');
      if (userIdController.text != '' || passwordController.text != '') {
        isLoading(true);
        Map<String, String> map = {
          'user_id': userIdController.value.text,
          'password': passwordController.value.text
        };

        debugPrint('call api');
        RestApi.fetchSupportLogin(map).then((value) => {
              Future.delayed(Duration.zero, () {
                if (value.status == 'Success') {
                  writeData.write(SAVE_TIME, DateTime.now().minute);
                  isLoading(false);
                  Get.off(HomePage());
                } else {
                  isLoading(false);
                  AppUtils.showErrorSnackBar("Fail", value.description ?? '');
                }
              })
            });
      }
      else {
        isLoading(false);
      }
    }
  }

  void isVisibleStatus() {
    isVisible = !isVisible;
    update();
  }
}
