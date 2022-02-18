import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mjn_installer_app/controllers/page_argument_controller.dart';
import 'package:mjn_installer_app/network/RestApi.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:mjn_installer_app/utils/app_utils.dart';

class NewOrderCustomerController extends GetxController {
  static NewOrderCustomerController get to => Get.find();
  DateTime? _chosenDateTime;
  final readData = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  void getDateTime() {
    debugPrint((DateFormat('yyyy-MM-dd – hh:mm a').format(_chosenDateTime!)));
  }

  void onTapAcceptNow(String ticketID, String profileID,String customerUID) {
    PageArgumentController.to.getArgumentData() == INSTALLATION
        ? installationOrderAccept(profileID,customerUID)
        : serviceTicketOrderAccept(ticketID, profileID);
  }

  void onTapLater(BuildContext context, String profileID, String ticketID,
      String customerUID) {
    _chosenDateTime = DateTime.now();
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 500,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 500,
                      child: CupertinoDatePicker(
                          initialDateTime: DateTime.now(),
                          use24hFormat: false,
                          onDateTimeChanged: (val) {
                            _chosenDateTime = val;
                            debugPrint((DateFormat('yyyy-MM-dd –hh:mm a')
                                .format(val)));
                          }),
                    ),
                  ),
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () {
                      Get.back();
                      PageArgumentController.to.getArgumentData() ==
                              INSTALLATION
                          ? installationOrderLater(
                              profileID, customerUID, _chosenDateTime!)
                          : serviceTicketOrderLater(
                              ticketID, profileID, _chosenDateTime!);
                    },
                  )
                ],
              ),
            ));
  }

  void installationOrderLater(
      String profileID, String customerUID, DateTime dateTime) {
    debugPrint('Installation later profileID${profileID}');
    Map<String, String> map = {
      'login_uid': readData.read(UID),
      'app_version': app_version,
      'profile_id': profileID,
      'customer_uid' : customerUID,
      'status': 'later',
      'est_start_date': (DateFormat('yyyy-MM-dd –hh:mm a').format(dateTime)),
    };
    RestApi.installationOrderAcceptAndLater(map, readData.read(TOKEN))
        .then((value) => {
      if (value.status == 'Success')
        {
          AppUtils.showSuccessSnackBar(
              'Success', 'New Order later status')
        }
      else
        {AppUtils.showErrorSnackBar('Fail', 'Something wrong')}
    });

  }

  void installationOrderAccept(String profileID,String customerUID) {
    debugPrint('Installation accept profileID${profileID}');
    Map<String, String> map = {
      'login_uid': readData.read(UID),
      'app_version': app_version,
      'profile_id': profileID,
      'customer_uid' : customerUID,
      'status': 'accept',
    };
    RestApi.installationOrderAcceptAndLater(map, readData.read(TOKEN))
        .then((value) => {
      if (value.status == 'Success')
        {
          PageArgumentController.to.updateStatus(PENDING),
          Get.back()
        }
      else
        {AppUtils.showErrorSnackBar('Fail', 'Something wrong')}
    });
  }

  void serviceTicketOrderLater(
      String ticketID, String profileID, DateTime dateTime) {
    Map<String, String> map = {
      'uid': readData.read(UID),
      'ticket_id': ticketID,
      'status': 'later',
      'app_version': app_version,
      'profile_id': profileID,
      'est_start_date': (DateFormat('yyyy-MM-dd –hh:mm a').format(dateTime)),
    };

    RestApi.serviceTicketOrderAcceptAndLater(map, readData.read(TOKEN))
        .then((value) => {
              if (value.status == 'Success')
                {
                  AppUtils.showSuccessSnackBar(
                      'Success', 'New Order later status')
                }
              else
                {AppUtils.showErrorSnackBar('Fail', 'Something wrong')}
            });
  }

  void serviceTicketOrderAccept(String ticketID, String profileID) {
    Map<String, String> map = {
      'uid': readData.read(UID),
      'ticket_id': ticketID,
      'status': 'order_accept',
      'app_version': app_version,
      'profile_id': profileID,
    };

    RestApi.serviceTicketOrderAcceptAndLater(map, readData.read(TOKEN))
        .then((value) => {
              if (value.status == 'Success')
                {
                  PageArgumentController.to.updateStatus(PENDING),
                  Get.back()
                }
              else
                {AppUtils.showErrorSnackBar('Fail', 'Something Wrong')}
            });
  }
}
