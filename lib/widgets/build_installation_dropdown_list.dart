import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mjn_installer_app/components/button_component.dart';
import 'package:mjn_installer_app/components/drop_down_button_component.dart';
import 'package:mjn_installer_app/components/label_text_component.dart';
import 'package:mjn_installer_app/components/photo_picker_component.dart';
import 'package:mjn_installer_app/components/text_field_box_decoration_component.dart';
import 'package:mjn_installer_app/controllers/installation_controller.dart';
import 'package:mjn_installer_app/controllers/login_controller.dart';
import 'package:mjn_installer_app/models/allDropDownListVO.dart';
import 'package:mjn_installer_app/res/colors.dart';
import 'package:get/get.dart';

class BuildInstallationDropdownList extends StatefulWidget {
  final String profileID;

  BuildInstallationDropdownList(this.profileID);

  @override
  State<BuildInstallationDropdownList> createState() =>
      _BuildInstallationDropdownListState();
}

class _BuildInstallationDropdownListState
    extends State<BuildInstallationDropdownList> {
  final InstallationController installationController =
      Get.put(InstallationController());
  List<InstallationStatus>? installationStatusLists;

  @override
  void initState() {
    installationController.onUIReady(widget.profileID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    installationStatusLists = LoginController
        .to.maintenanceDropDownListsData.details!.installationStatus!;
    return Obx(() {
      if (installationController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customerLabel,
                middleLabel,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelTextComponent(
                        text: installationController
                                .installationDetail.value.uid ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: installationController
                                .installationDetail.value.firstname ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: installationController
                                .installationDetail.value.phone1 ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: installationController
                                .installationDetail.value.address ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: installationController
                                .installationDetail.value.latitude ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: installationController
                                .installationDetail.value.longitude ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: installationController
                                .installationDetail.value.type ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: 'xx xxx xxx xxx xxx',
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: installationController
                                .installationDetail.value.subconAssignedDate ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                  ],
                )
              ],
            ),
            Container(
              height: 400,
              margin: EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: issueDropDownLabel),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GetBuilder<InstallationController>(
                        init: InstallationController(),
                        builder: (controller) =>
                            TextFieldBoxDecorationComponent(
                          controller: controller.macIdController,
                          errorText: '',
                          hintText: '',
                        ),
                      ),
                      GetBuilder<InstallationController>(
                        init: InstallationController(),
                        builder: (controller) =>
                            TextFieldBoxDecorationComponent(
                          controller: controller.deviceIdController,
                          errorText: '',
                          hintText: '',
                        ),
                      ),
                      GetBuilder<InstallationController>(
                        init: InstallationController(),
                        builder: (controller) =>
                            TextFieldBoxDecorationComponent(
                          controller: controller.fiberUsageController,
                          errorText: '',
                          hintText: '',
                        ),
                      ),
                      GetBuilder<InstallationController>(
                        init: InstallationController(),
                        builder: (controller) =>
                            TextFieldBoxDecorationComponent(
                              controller: controller.coreCableController,
                              errorText: '',
                              hintText: '',
                            ),
                      ),
                      GetBuilder<InstallationController>(
                        init: InstallationController(),
                        builder: (controller) =>
                            TextFieldBoxDecorationComponent(
                              controller: controller.jointClosureController,
                              errorText: '',
                              hintText: '',
                            ),
                      ),
                      GetBuilder<InstallationController>(
                        init: InstallationController(),
                        builder: (controller) =>
                            TextFieldBoxDecorationComponent(
                              controller: controller.ONUController,
                              errorText: '',
                              hintText: '',
                            ),
                      ),
                      GetBuilder<InstallationController>(
                        init: InstallationController(),
                        builder: (controller) =>
                            TextFieldBoxDecorationComponent(
                              controller: controller.patchCordController,
                              errorText: '',
                              hintText: '',
                            ),
                      ),
                      GetBuilder<InstallationController>(
                        init: InstallationController(),
                        builder: (controller) =>
                            TextFieldBoxDecorationComponent(
                              controller: controller.sleeveController,
                              errorText: '',
                              hintText: '',
                            ),
                      ),
                      GetBuilder<InstallationController>(
                        init: InstallationController(),
                        builder: (controller) =>
                            TextFieldBoxDecorationComponent(
                              controller: controller.scConnectorController,
                              errorText: '',
                              hintText: '',
                            ),
                      ),
                      DropDownButtonComponent(
                        itemsList: installationStatusLists,
                        onChangedData: (InstallationStatus value) {
                          debugPrint('DropdownValue${value.id}');
                          installationController.updateStatusValueID(value.id!);
                        },
                        hintText: '--Select Status--',
                      ),
                    ],
                  )),
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
            Obx(() {
              if (installationController.loadingForButton.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                return ButtonComponent(
                  text: 'Complete',
                  containerWidth: 120,
                  padding: 10,
                  color: Color(int.parse(MJNColors.buttonColor)),
                  onPress: () => onPressComplete(),
                );
            })
          ],
        );
      }
    });
  }

  final issueDropDownLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      LabelTextComponent(text: 'MAC ID', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Device ID', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Fiber Usage', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '1 Core Cable', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: '1C Joint Closure', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'ONU', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Patch cord', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Sleeves', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'SC Connector', color: Colors.black, padding: 8.0),


      LabelTextComponent(text: 'Status', color: Colors.black, padding: 8.0),
    ],
  );

  final choosePhotoListsWidget = Column(
    children: [
      GetBuilder<InstallationController>(
        builder: (controller) => PhotoPickerComponent(
          imagePath: controller.imageONU,
          text: 'ONU Photo',
          onPress: () => {controller.onTapONU()},
        ),
      ),
      GetBuilder<InstallationController>(
        builder: (controller) => PhotoPickerComponent(
          imagePath: controller.imageODB,
          text: 'ODB Photo',
          onPress: () => {controller.onTapODB()},
        ),
      ),
      GetBuilder<InstallationController>(
        builder: (controller) => PhotoPickerComponent(
          imagePath: controller.imageAcceptForm,
          text: 'Acceptance Form',
          onPress: () => {controller.onTapAcceptForm()},
        ),
      ),
    ],
  );

  final customerLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelTextComponent(text: 'User ID', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Customer Name', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Customer Phone', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Address', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Lat', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Long', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Type', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Topic', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Assigned Date', color: Colors.black, padding: 8.0),
    ],
  );

  final middleLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0),
    ],
  );

  void onPressComplete() {
    installationController.postInstallationDataOnServer(widget.profileID);
  }
}
