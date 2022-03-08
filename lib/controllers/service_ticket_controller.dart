import 'package:flutter/cupertino.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/models/b2bAndb2cUsagesVO.dart';

import 'package:mjn_installer_app/models/serviceTicketDetailVO.dart';
import 'package:mjn_installer_app/network/RestApi.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:mjn_installer_app/utils/app_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ServiceTicketController extends GetxController {
  final readData = GetStorage();
  var serviceTicketDetail = ServiceTicketDetails().obs;
  var isLoading = false.obs;
  var loadingForButton = false.obs;
  var technicalIssueValueId;
  var technicalResolutionValueId;
  var statusValueId;

  Map<String, TextEditingController> textEditingControllers_list = {};
  List<String> field_list = [];

  //manual text controller
  var macIdController = TextEditingController();
  var deviceIdController = TextEditingController();
  var portNoController = TextEditingController();

  var b2bInstallationUsages = B2BAndB2CUsagesVo().obs;

  void updateTechnicalIssueValueID(int id) {
    technicalResolutionValueId = id;
    update();
  }

  void updateTechnicalResolutionValueID(int id) {
    technicalIssueValueId = id;
    update();
  }

  void updateStatusValueID(int id) {
    statusValueId = id;
    update();
  }

  void onUIReady(String ticketID) {
    fetchServiceTicketDetail(ticketID);
  }

  void appendNewTextEditingController(
      Map<String, TextEditingController> textEditingController,
      List<String> field_name) {
    textEditingControllers_list.addAll(textEditingController);
    field_list.addAll(field_name);
  }

  void fetchServiceTicketDetail(String ticketID) {
    isLoading(true);
    RestApi.getServiceTicketDetail(
            readData.read(TOKEN), readData.read(UID), ticketID)
        .then((value) {
      if (value.status == 'Success') {
        serviceTicketDetail.value = value.details!;
        RestApi.fetchInstallationUsages(
                readData.read(TOKEN),
                readData.read(UID),
                HomeController.to.serviceCustomerType == 'b2b' ? 'b2b' : 'b2c')
            .then((value) =>
                {b2bInstallationUsages.value = value, isLoading(false)});
      } else {
        isLoading(false);
      }
    });
  }

  void postServiceTicketDataOnServer(String ticketID, String profileID) {

    loadingForButton(true);

    var firstMap = {
      'uid': readData.read(UID),
      'profile_id': profileID,
      'ticket_id': ticketID,
      'app_version': app_version,
      'customer_type': HomeController.to.serviceCustomerType,
      'customer_uid': HomeController.to.serviceCustomerUid,
      'sr_no': macIdController.value.text.toString(),
      'spliter_no': deviceIdController.value.text.toString(),
      'port_no': portNoController.value.text.toString(),
      'status': statusValueId.toString(),
      'technical_issue': technicalIssueValueId.toString(),
      'technical_resolution': technicalResolutionValueId.toString(),
    };

    var secondMap = {
      for (var item in field_list)
        '$item':
            '${textEditingControllers_list[item]?.text == '' ? '0' : textEditingControllers_list[item]?.text}'
    };

    var thirdMap = {};

    thirdMap.addAll(firstMap);
    thirdMap.addAll(secondMap);

    debugPrint("Usage map collection::${thirdMap}", wrapWidth: 1024);

      RestApi.postServiceTicketData(thirdMap,readData.read(TOKEN)).then((value) => {
        if(value.status == 'Success'){
          loadingForButton(false),
          Get.offNamed(PENDING_CUSTOMER_COMPLETE_PAGE, arguments: ticketID)
        }
        else {
          loadingForButton(false)
        }
      });
    }
  }

