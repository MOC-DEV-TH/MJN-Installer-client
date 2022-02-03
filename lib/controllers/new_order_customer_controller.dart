import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:mjn_installer_app/network/RestApi.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';

class NewOrderCustomerController extends GetxController {
  static NewOrderCustomerController get to => Get.find();
  DateTime? _chosenDateTime;
  final readData = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  void getDateTime(){
    debugPrint((DateFormat('yyyy-MM-dd – hh:mm a').format(_chosenDateTime!)));
  }

  void onTapAcceptNow(String ticketID,String profileID) {
      serviceTicketOrderAccept(ticketID, profileID);
  }

  void onTapLater(BuildContext context,String status,String profileID,String ticketID) {
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
                          debugPrint((DateFormat('yyyy-MM-dd –hh:mm a').format(val)));
                        }),
                  ),
                ),
                CupertinoButton(
                  child: Text('OK'),
                  onPressed: ()  {
                    Get.back();
                    serviceTicketOrderLater(ticketID, profileID, _chosenDateTime!);
                  },
                )
              ],
            ),
          ));
  }


  void serviceTicketOrderLater(String ticketID,profileID,DateTime dateTime){
    Map<String, String> map = {
      'uid': readData.read(UID),
      'ticket_id': ticketID,
      'status' : 'later',
      'app_version': APP_VERSION,
      'profile_id': profileID,
      'est_start_date': (DateFormat('yyyy-MM-dd –hh:mm a').format(dateTime)),
    };

    RestApi.serviceTicketOrderAccept(map, readData.read(TOKEN)).then((value) => {

    });
  }

  void serviceTicketOrderAccept(String ticketID,profileID){
    Map<String, String> map = {
      'uid': readData.read(UID),
      'ticket_id': ticketID,
      'status' : 'order_accept',
      'app_version': APP_VERSION,
      'profile_id': profileID,
    };

    RestApi.serviceTicketOrderAccept(map, readData.read(TOKEN)).then((value) => {

    });
  }

}
