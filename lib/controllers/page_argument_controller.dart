import 'package:get/get.dart';

class PageArgumentController extends GetxController{
  String argumentData = '';

  static PageArgumentController get to => Get.find();

  void updateArgumentData(String argument){
    argumentData = argument;
    update();
  }

  String getArgumentData(){
    return argumentData;
  }
}