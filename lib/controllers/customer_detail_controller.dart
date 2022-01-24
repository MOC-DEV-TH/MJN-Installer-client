import 'package:flutter_geolocator_example/models/installationDetailVO.dart';
import 'package:flutter_geolocator_example/network/RestApi.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomerDetailController extends GetxController{
  final readData = GetStorage();
  var installationDetail = InstallationDetails().obs;
  var isLoading = false.obs;

  void fetchInstallationDetail(String profileID){
    isLoading(true);
    RestApi.getInstallationDetail(readData.read(TOKEN),
        readData.read(UID_PARAM),profileID).then((value) => {
          if(value.status == 'Success'){
            installationDetail.value = value.details!,
            isLoading(false)
          }
          else {
            isLoading(false)
          }

    });
  }

  void fetchServiceTicketDetail(String ticketID){

  }

}