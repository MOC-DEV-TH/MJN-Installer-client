import 'package:get/get.dart';

class PageArgumentController extends GetxController{
  String argumentData = '';
  String d_status = '';
  static PageArgumentController get to => Get.find();

  void updateArgumentData(String argument){
    argumentData = argument;
    update();
  }

  void updateStatus(String status){
    d_status = status;
    update();
  }

  String getArgumentData(){
    return argumentData;
  }

  String getStatus(){
    return d_status;
  }
}