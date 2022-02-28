import 'package:get/get.dart';

class PageArgumentController extends GetxController{
  String argumentData = '';
  String d_status = '';
  String c_status_title = '';


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

  void updateStatusTitle(String status){
    c_status_title = status;
    update();
  }

  String getStatusTitle(){
    return c_status_title;
  }


  String getStatus(){
    return d_status;
  }
}