import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/models/installationVO.dart';
import 'package:flutter_geolocator_example/models/serviceTicketVO.dart';
import 'package:flutter_geolocator_example/network/RestApi.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class CustomerController extends GetxController {
  final customerNameTextController = TextEditingController();
  final customerTownshipController = TextEditingController();
  var customerDateController = TextEditingController();
  final installationPendingCustomerList = <InstallationDetail>[].obs;
  final serviceTicketPendingCustomerList = <ServiceTicketDetail>[].obs;

  final installationCompleteCustomerList = <InstallationDetail>[].obs;
  final serviceTicketCompleteCustomerList = <ServiceTicketDetail>[].obs;

  final readData = GetStorage();
  var isLoading = false.obs;
  String argumentData = '';
  static CustomerController get to => Get.find();

  void complete() {}

  void pending() {}

  @override
  void onClose() {
    installationPendingCustomerList.clear();
    serviceTicketPendingCustomerList.clear();
    super.onClose();
  }

  @override
  void dispose() {
    installationPendingCustomerList.clear();
    serviceTicketPendingCustomerList.clear();
    super.dispose();
  }



  void updateArgumentData(String argument){
    argumentData = argument;
    update();
  }

  String getArgumentData(){
    return argumentData;
  }

  void selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selected != null) {
      String dtFormat = DateFormat('dd/MM/yyyy').format(selected);
      debugPrint("DateTimeFormat${dtFormat}");
      customerDateController.text = dtFormat.toString();
    }
  }

  void fetchServiceTicketPendingCustomer(String status) {
    isLoading(true);
    RestApi.fetchServiceTicketPendingLists(readData.read(TOKEN),
        readData.read(UID_PARAM), status).then((value) =>
        {
          if(value.status == 'Success'){
            debugPrint("ServiceTicketLists ${value.details}"),
               serviceTicketPendingCustomerList.value = value.details!,
               isLoading(false)
          }
          else {
            isLoading(false)
          }
        }
    );
  }

  void fetchServiceTicketCompleteCustomer(String status) {
    isLoading(true);
    RestApi.fetchServiceTicketPendingLists(readData.read(TOKEN),
        readData.read(UID_PARAM), status).then((value) =>
    {
      if(value.status == 'Success'){
        debugPrint("ServiceTicketLists ${value.details}"),
        serviceTicketCompleteCustomerList.value = value.details!,
        isLoading(false)
      }
      else {
        isLoading(false)
      }
    }
    );
  }

  void fetchInstallationCompleteCustomer(String status) {
    isLoading(true);
    RestApi.fetchInstallationPendingLists(readData.read(TOKEN),
        readData.read(UID_PARAM), status).then((value) => {
      if(value.status == 'Success'){
        debugPrint("InstallationLists ${value.details}"),
        installationCompleteCustomerList.value = value.details!,
        isLoading(false)
      }
      else {
        isLoading(false)
      }
    });
  }

  void fetchInstallationPendingCustomer(String status) {
    isLoading(true);
    RestApi.fetchInstallationPendingLists(readData.read(TOKEN),
        readData.read(UID_PARAM), status).then((value) => {
      if(value.status == 'Success'){
        debugPrint("InstallationLists ${value.details}"),
        installationPendingCustomerList.value = value.details!,
        isLoading(false)
      }
      else {
        isLoading(false)
      }
    });
  }


  Widget showLoading(){
    return Center(child: CircularProgressIndicator(),);
  }
}
