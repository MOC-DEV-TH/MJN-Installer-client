import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_geolocator_example/components/button_component.dart';
import 'package:flutter_geolocator_example/components/drop_down_button_component.dart';
import 'package:flutter_geolocator_example/components/label_text_component.dart';
import 'package:flutter_geolocator_example/components/photo_picker_component.dart';
import 'package:flutter_geolocator_example/components/text_field_box_decoration_component.dart';
import 'package:flutter_geolocator_example/controllers/installation_drop_down_controller.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';

class BuildInstallationDropdownList extends StatelessWidget {
  final InstallationDropDownController controller =
      Get.put(InstallationDropDownController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: issueDropDownLabel),
              Expanded(child: issueDropDownListsWidget),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            children: [
              Expanded(child: choosePhotoListsWidget),
            ],
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        ButtonComponent(
          text: 'Complete',
          containerWidth: 120,
          padding: 10,
          color: Color(int.parse(MJNColors.buttonColor)),
          onPress: () => onPressComplete(),
        ),
      ],
    );
  }

  final issueDropDownLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      LabelTextComponent(text: 'MAC ID', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Device ID', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Fiber Usage', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Status', color: Colors.black, padding: 8.0),
    ],
  );

  final issueDropDownListsWidget = Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GetBuilder<InstallationDropDownController>(
        init: InstallationDropDownController(),
        builder: (controller) => TextFieldBoxDecorationComponent(
          controller: controller.macIdController,
          errorText: '',
          hintText: '',
        ),
      ),
      GetBuilder<InstallationDropDownController>(
        init: InstallationDropDownController(),
        builder: (controller) => TextFieldBoxDecorationComponent(
          controller: controller.deviceIdController,
          errorText: '',
          hintText: '',
        ),
      ),
      GetBuilder<InstallationDropDownController>(
        init: InstallationDropDownController(),
        builder: (controller) => TextFieldBoxDecorationComponent(
          controller: controller.fiberUsageController,
          errorText: '',
          hintText: '',
        ),
      ),
      DropDownButtonComponent(
        itemsList: [
          'Status13',
          'Status14',
          'Status15',
          'Status16',
        ],
        onChangedData: (String value) {
          debugPrint('DropdownValue${value}');
        },
        hintText: '--Select Status--',
      ),
    ],
  );

  final choosePhotoListsWidget = Column(
    children: [
      GetBuilder<InstallationDropDownController>(
        builder: (controller) => PhotoPickerComponent(
          imagePath: controller.imageONU,
          text: 'ONU Photo',
          onPress: () => {
            controller.onTapONU()
          },
        ),
      ),
      GetBuilder<InstallationDropDownController>(
        builder: (controller) => PhotoPickerComponent(
          imagePath: controller.imageODB,
          text: 'ODB Photo',
          onPress: () => {
            controller.onTapODB()
          },
        ),
      ),
      GetBuilder<InstallationDropDownController>(
        builder: (controller) => PhotoPickerComponent(
          imagePath: controller.imageAcceptForm,
          text: 'Acceptance Form',
          onPress: () => {
            controller.onTapAcceptForm()
          },
        ),
      ),
    ],
  );

  void onPressComplete() {
    Get.toNamed(COMPLETE_CUSTOMER_LIST);
  }
}
