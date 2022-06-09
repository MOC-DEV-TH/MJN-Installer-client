import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:mjn_installer_app/components/button_component.dart';
import 'package:mjn_installer_app/components/label_text_component.dart';
import 'package:mjn_installer_app/controllers/device_pickup_detail_controller.dart';
import 'package:mjn_installer_app/res/colors.dart';
import 'package:mjn_installer_app/utils/app_utils.dart';
import 'package:get/get.dart';

class DevicePickupDetailPage extends StatelessWidget {
  final DevicePickupDetailController devicePickupDetailController =
      Get.put(DevicePickupDetailController());
  final List<String> _status = ["Yes", "No"];

  @override
  Widget build(BuildContext context) {
    devicePickupDetailController
        .fetchDevicePickupDetail(Get.arguments[0].toString());
    return Scaffold(
      appBar: AppUtils.customAppBar(),
      backgroundColor: Color(int.parse(MJNColors.bgColor)),
      body: Obx(() {
        if (devicePickupDetailController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return _buildWidget();
        }
      }),
    );
  }

  Widget _buildWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Pending Customer',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.left,
                          text: 'Customer Name',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.center,
                          text: '- - -',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                    flex: 1,
                    child: LabelTextComponent(
                        textAlign: TextAlign.left,
                        text: (devicePickupDetailController
                                        .devicePickupDetail.value.firstname ==
                                    null ||
                                devicePickupDetailController
                                        .devicePickupDetail.value.firstname ==
                                    "")
                            ? "xx xxx xxx xxx xxx"
                            : devicePickupDetailController
                                .devicePickupDetail.value.firstname!,
                        color: Colors.black,
                        padding: 8.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.left,
                          text: 'Phone',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.center,
                          text: '- - -',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                    flex: 1,
                    child: LabelTextComponent(
                        textAlign: TextAlign.left,
                        text: (devicePickupDetailController
                                        .devicePickupDetail.value.phone1 ==
                                    null ||
                                devicePickupDetailController
                                        .devicePickupDetail.value.phone1 ==
                                    "")
                            ? "xx xxx xxx xxx xxx"
                            : devicePickupDetailController
                                .devicePickupDetail.value.phone1!,
                        color: Colors.black,
                        padding: 8.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.left,
                          text: 'Address',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.center,
                          text: '- - -',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                    flex: 1,
                    child: LabelTextComponent(
                        textAlign: TextAlign.left,
                        text: (devicePickupDetailController
                                        .devicePickupDetail.value.address ==
                                    null ||
                                devicePickupDetailController
                                        .devicePickupDetail.value.address ==
                                    "")
                            ? "xx xxx xxx xxx xxx"
                            : devicePickupDetailController
                                .devicePickupDetail.value.address!,
                        color: Colors.black,
                        padding: 8.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.left,
                          text: 'Status',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.center,
                          text: '- - -',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                    flex: 1,
                    child: LabelTextComponent(
                        textAlign: TextAlign.left,
                        text: (devicePickupDetailController.devicePickupDetail
                                        .value.terminationStatus ==
                                    null ||
                                devicePickupDetailController.devicePickupDetail
                                        .value.terminationStatus ==
                                    "")
                            ? "xx xxx xxx xxx xxx"
                            : devicePickupDetailController
                                .devicePickupDetail.value.terminationStatus!,
                        color: Colors.black,
                        padding: 8.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.left,
                          text: 'Product',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.center,
                          text: '- - -',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                    flex: 1,
                    child: LabelTextComponent(
                        textAlign: TextAlign.left,
                        text: (devicePickupDetailController
                                        .devicePickupDetail.value.plan ==
                                    null ||
                                devicePickupDetailController
                                        .devicePickupDetail.value.plan ==
                                    "")
                            ? "xx xxx xxx xxx xxx"
                            : devicePickupDetailController
                                .devicePickupDetail.value.plan!,
                        color: Colors.black,
                        padding: 8.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.left,
                          text: 'Package',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                      flex: 1,
                      child: LabelTextComponent(
                          textAlign: TextAlign.center,
                          text: '- - -',
                          color: Colors.black,
                          padding: 8.0)),
                  Expanded(
                    flex: 1,
                    child: LabelTextComponent(
                        textAlign: TextAlign.left,
                        text: (devicePickupDetailController
                                        .devicePickupDetail.value.package ==
                                    null ||
                                devicePickupDetailController
                                        .devicePickupDetail.value.package ==
                                    "")
                            ? "xx xxx xxx xxx xxx"
                            : devicePickupDetailController
                                .devicePickupDetail.value.package!,
                        color: Colors.black,
                        padding: 8.0),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Device Collect',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        GetBuilder<DevicePickupDetailController>(
          init: DevicePickupDetailController(),
          builder: (controller) => RadioGroup<String>.builder(
            direction: Axis.horizontal,
            groupValue: devicePickupDetailController.radioGroupValue,
            horizontalAlignment: MainAxisAlignment.spaceEvenly,
            onChanged: (value) => {
              devicePickupDetailController
                  .updateRadioGroupValue(value!.toString()),
              debugPrint(
                  'RadioValue${devicePickupDetailController.radioGroupValue}')
            },
            items: _status,
            textStyle: TextStyle(fontSize: 15, color: Colors.blue),
            itemBuilder: (item) => RadioButtonBuilder(
              item,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Obx((){
          if(devicePickupDetailController.isLoadingForButton.value){
            return Center(child: CircularProgressIndicator(),);
          }
          else {
            return
              GetBuilder<DevicePickupDetailController>(
                  init: DevicePickupDetailController(),
                  builder: (controller) => ButtonComponent(
                    text: 'Save',
                    padding: 10,
                    containerWidth: 140.0,
                    color: !controller.isCheckRadio
                        ? Colors.grey
                        : Color(int.parse(MJNColors.buttonColor)),
                    onPress: () =>
                    {!controller.isCheckRadio ? null : onPressSave()},
                  ));
          }
        })

      ],
    );
  }

  void onPressSave() {
    debugPrint('ClickSave');
    devicePickupDetailController.postDevicePickupData(
        Get.arguments[0].toString(), Get.arguments[1].toString());
  }
}
