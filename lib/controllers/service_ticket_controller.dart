import 'package:flutter/cupertino.dart';
import 'package:mjn_installer_app/models/allDropDownListVO.dart';
import 'package:mjn_installer_app/models/serviceTicketDetailVO.dart';
import 'package:mjn_installer_app/network/RestApi.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:mjn_installer_app/utils/app_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class ServiceTicketController extends GetxController{
  final readData = GetStorage();
  var serviceTicketDetail = ServiceTicketDetails().obs;
  var isLoading = false.obs;
  var loadingForButton = false.obs;
  var technicalIssueValueId;
  var technicalResolutionValueId;
  var statusValueId;

  //manual text controller
  var macIdController = TextEditingController();
  var deviceIdController = TextEditingController();
  var cableTypeController = TextEditingController();
  var jointClosureController = TextEditingController();
  var ODBController = TextEditingController();
  var ONUController = TextEditingController();
  var cat6CableController = TextEditingController();
  var rj45ConnectorController = TextEditingController();
  var patchCordController = TextEditingController();
  var mediaConverterController = TextEditingController();
  var spfModuleController = TextEditingController();
  var scConnectorController = TextEditingController();
  var routerController = TextEditingController();


  void updateTechnicalIssueValueID(int id){
    technicalResolutionValueId = id;
    update();
  }

  void updateTechnicalResolutionValueID(int id){
    technicalIssueValueId = id;
    update();
  }

  void updateStatusValueID(int id){
    statusValueId = id;
    update();
  }

  void onUIReady(String ticketID){
    fetchServiceTicketDetail(ticketID);
  }

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

  void postServiceTicketDataOnServer(String ticketID){
    loadingForButton(true);
    Map<String, String> map = {
      'uid': readData.read(UID),
      'profile_id': serviceTicketDetail.value.profileID!,
      'ticket_id': ticketID,
      'app_version': APP_VERSION,
      'technical_issue': technicalIssueValueId.toString(),
      'technical_resolution': technicalResolutionValueId.toString(),
      'status': statusValueId.toString(),
      'alert_time': DateTime.now().toString(),
    };

    if(technicalIssueValueId!=null && technicalResolutionValueId!=null && statusValueId!=null){
      RestApi.postServiceTicketData(map,readData.read(TOKEN)).then((value) => {
        if(value.status == 'Success'){
          loadingForButton(false),
          Get.toNamed(PENDING_CUSTOMER_COMPLETE_PAGE, arguments: ticketID)
        }
        else {
          loadingForButton(false)
        }
      });
    }
    else {
      loadingForButton(false);
      AppUtils.showErrorSnackBar('Fail', 'Please select issue');
    }


  }

}