import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mjn_installer_app/components/button_component.dart';
import 'package:mjn_installer_app/components/label_text_component.dart';
import 'package:mjn_installer_app/controllers/customer_detail_controller.dart';
import 'package:mjn_installer_app/controllers/page_argument_controller.dart';
import 'package:mjn_installer_app/res/colors.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:get/get.dart';

class BuildCustomerDetailInfo extends StatefulWidget {
  final String profileIdOrTicketID;
  String? status;

  BuildCustomerDetailInfo(this.profileIdOrTicketID, {this.status});

  @override
  State<BuildCustomerDetailInfo> createState() =>
      _BuildCustomerDetailInfoState();
}

class _BuildCustomerDetailInfoState extends State<BuildCustomerDetailInfo> {
  CustomerDetailController customerDetailController =
      Get.put(CustomerDetailController());

  final writeData = GetStorage();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if (PageArgumentController.to.getArgumentData() == INSTALLATION) {
        customerDetailController.fetchInstallationDetail(
            widget.profileIdOrTicketID, context);
      } else {
        customerDetailController.fetchServiceTicketDetail(
            widget.profileIdOrTicketID, context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (customerDetailController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else
        return PageArgumentController.to.getArgumentData() == INSTALLATION
            ? Flexible(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: customerLabel),
                      Flexible(child: middleLabel),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelTextComponent(
                                text: customerDetailController
                                            .installationDetail
                                            .value
                                            .user_name ==
                                        null
                                    ? "xx xxx xxx xxx xxx"
                                    : customerDetailController
                                        .installationDetail.value.user_name!,
                                color: Colors.black,
                                padding: 8.0),
                            LabelTextComponent(
                                text: customerDetailController
                                            .installationDetail
                                            .value
                                            .firstname ==
                                        null
                                    ? "xx xxx xxx xxx xxx"
                                    : customerDetailController
                                        .installationDetail.value.firstname!,
                                color: Colors.black,
                                padding: 8.0),
                            LabelTextComponent(
                                text: customerDetailController
                                        .installationDetail.value.phone1 ??
                                    "xx xxx xxx xxx xxx",
                                color: Colors.black,
                                padding: 8.0),
                            LabelTextComponent(
                                text: customerDetailController
                                        .installationDetail.value.address ??
                                    "xx xxx xxx xxx xxx",
                                color: Colors.black,
                                padding: 8.0),
                            LabelTextComponent(
                                text: customerDetailController
                                        .installationDetail.value.latitude ??
                                    "xx xxx xxx xxx xxx",
                                color: Colors.black,
                                padding: 8.0),
                            LabelTextComponent(
                                text: customerDetailController
                                        .installationDetail.value.longitude ??
                                    "xx xxx xxx xxx xxx",
                                color: Colors.black,
                                padding: 8.0),
                            LabelTextComponent(
                                text: customerDetailController
                                        .installationDetail.value.type ??
                                    "xx xxx xxx xxx xxx",
                                color: Colors.black,
                                padding: 8.0),
                            LabelTextComponent(
                                text: 'xx xxx xxx xxx xxx',
                                color: Colors.black,
                                padding: 8.0),
                            LabelTextComponent(
                                text: customerDetailController
                                        .installationDetail
                                        .value
                                        .subconAssignedDate ??
                                    "xx xxx xxx xxx xxx",
                                color: Colors.black,
                                padding: 8.0),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  widget.status == 'complete'
                      ? Container()
                      : ButtonComponent(
                          text: PageArgumentController.to.getArgumentData() ==
                                  SERVICE_TICKET
                              ? 'Action Started'
                              : 'Installation Started',
                          padding: 10,
                          containerWidth:
                              PageArgumentController.to.getArgumentData() ==
                                      SERVICE_TICKET
                                  ? 120
                                  : 140,
                          color: Color(int.parse(MJNColors.buttonColor)),
                          onPress: () => onPressActionStart(),
                        ),
                ],
              ),
            )
            : Flexible(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(child: customerLabel),
                        Flexible(child: middleLabel),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelTextComponent(
                                  text: (customerDetailController
                                                  .serviceTicketDetail
                                                  .value
                                                  .userName ==
                                              null ||
                                          customerDetailController
                                                  .serviceTicketDetail
                                                  .value
                                                  .userName ==
                                              "")
                                      ? "xx xxx xxx xxx xxx"
                                      : customerDetailController
                                          .serviceTicketDetail.value.userName!,
                                  color: Colors.black,
                                  padding: 8.0),
                              LabelTextComponent(
                                  text: customerDetailController
                                              .serviceTicketDetail
                                              .value
                                              .firstname ==
                                          null
                                      ? "xx xxx xxx xxx xxx"
                                      : customerDetailController
                                          .serviceTicketDetail.value.firstname!,
                                  color: Colors.black,
                                  padding: 8.0),
                              LabelTextComponent(
                                  text: customerDetailController
                                          .serviceTicketDetail.value.phone1 ??
                                      "xx xxx xxx xxx xxx",
                                  color: Colors.black,
                                  padding: 8.0),
                              LabelTextComponent(
                                  text: customerDetailController
                                          .serviceTicketDetail.value.address ??
                                      "xx xxx xxx xxx xxx",
                                  color: Colors.black,
                                  padding: 8.0),
                              LabelTextComponent(
                                  text: customerDetailController
                                          .serviceTicketDetail.value.latitude ??
                                      "xx xxx xxx xxx xxx",
                                  color: Colors.black,
                                  padding: 8.0),
                              LabelTextComponent(
                                  text: customerDetailController
                                          .serviceTicketDetail
                                          .value
                                          .longitude ??
                                      "xx xxx xxx xxx xxx",
                                  color: Colors.black,
                                  padding: 8.0),
                              LabelTextComponent(
                                  text: customerDetailController
                                          .serviceTicketDetail.value.type ??
                                      "xx xxx xxx xxx xxx",
                                  color: Colors.black,
                                  padding: 8.0),
                              LabelTextComponent(
                                  text: 'xx xxx xxx xxx xxx',
                                  color: Colors.black,
                                  padding: 8.0),
                              LabelTextComponent(
                                  text: customerDetailController
                                          .serviceTicketDetail
                                          .value
                                          .subconAssignedDate ??
                                      "xx xxx xxx xxx xxx",
                                  color: Colors.black,
                                  padding: 8.0),
                              LabelTextComponent(
                                  text: customerDetailController
                                      .serviceTicketDetail
                                      .value
                                      .message ??
                                      "xx xxx xxx xxx xxx",
                                  color: Colors.black,
                                  padding: 8.0),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    widget.status == 'complete'
                        ? Container()
                        : ButtonComponent(
                            text: PageArgumentController.to.getArgumentData() ==
                                    SERVICE_TICKET
                                ? 'Action Started'
                                : 'Installation Started',
                            padding: 10,
                            containerWidth:
                                PageArgumentController.to.getArgumentData() ==
                                        SERVICE_TICKET
                                    ? 120
                                    : 140,
                            color: Color(int.parse(MJNColors.buttonColor)),
                            onPress: () => onPressActionStart(),
                          ),
                  ],
                ),
              );
    });
  }

  void onPressActionStart() {
    // Get.offNamed(CUSTOMER_ISSUE_PAGE, arguments:
    //   widget.profileIdOrTicketID
    // );
    Get.offNamed(CUSTOMER_ISSUE_PAGE);
  }

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
      PageArgumentController.to.getArgumentData() == SERVICE_TICKET
          ? LabelTextComponent(text: 'Note', color: Colors.black, padding: 8.0)
          : SizedBox(),
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
      PageArgumentController.to.getArgumentData() == SERVICE_TICKET
          ? LabelTextComponent(text: '- - -', color: Colors.black, padding: 8.0)
          : SizedBox(),
    ],
  );
}
