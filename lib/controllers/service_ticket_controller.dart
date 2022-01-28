import 'package:flutter/cupertino.dart';
import 'package:flutter_geolocator_example/models/allDropDownListVO.dart';
import 'package:flutter_geolocator_example/models/serviceTicketDetailVO.dart';
import 'package:flutter_geolocator_example/network/RestApi.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class ServiceTicketController extends GetxController{
  final readData = GetStorage();
  var serviceTicketDetail = ServiceTicketDetails().obs;
  var isLoading = false.obs;

  void fetchServiceTicketDetail(String ticketID){
    isLoading(true);
    RestApi.getServiceTicketDetail(readData.read(TOKEN),
        readData.read(UID),ticketID).then((value)  {
      if(value.status == 'Success'){
        serviceTicketDetail.value = value.details!;
        isLoading(false);
      }
      else {
        isLoading(false);
      }

    });
  }


}