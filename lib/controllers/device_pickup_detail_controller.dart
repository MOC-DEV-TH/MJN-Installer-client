import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mjn_installer_app/models/devicePickupDetailVO.dart';
import 'package:mjn_installer_app/network/RestApi.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:mjn_installer_app/utils/app_utils.dart';

class DevicePickupDetailController extends GetxController {
  final readData = GetStorage();
  var radioGroupValue = '';
  var devicePickupDetail = Details().obs;
  var isLoading = false.obs;
  var isLoadingForButton = false.obs;
  bool isCheckRadio = false;

  void updateRadioGroupValue(String value) {
    radioGroupValue = value;
    isCheckRadio = true;
    update();
  }

  void fetchDevicePickupDetail(String cid) {
    isLoading(true);

    RestApi.fetchDevicePickupDetailById(
            readData.read(TOKEN), readData.read(UID), cid)
        .then((value) => {
              if (value.status == 'Success')
                {devicePickupDetail.value = value.details!, isLoading(false)}
              else
                {isLoading(false)}
            });
  }

  void postDevicePickupData(String cid, String ticketId) {
    var params = {
      'app_version': app_version,
      'uid': readData.read(UID),
      'cid': cid,
      'ticket_id': ticketId,
      'is_collected_device': radioGroupValue == 'Yes' ? '1' : '0',
    };
    isLoadingForButton(true);
    RestApi.postDevicePickupData(params, readData.read(TOKEN)).then((value) => {
          if (value.status == 'Success')
            {isLoadingForButton(false), Get.offNamed(TICKET_STATUS_PAGE)}
          else
            {
              isLoadingForButton(false),
              AppUtils.showErrorSnackBar('Fail', 'Something wrong')
            }
        });
  }
}
