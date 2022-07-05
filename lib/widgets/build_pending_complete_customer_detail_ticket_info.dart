import 'package:flutter/material.dart';
import 'package:mjn_installer_app/components/button_component.dart';
import 'package:mjn_installer_app/components/label_text_component.dart';
import 'package:mjn_installer_app/controllers/customer_detail_controller.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:get/get.dart';

class BuildPendingCustomerCompleteInfo extends StatefulWidget {
  final String ticketID;

  BuildPendingCustomerCompleteInfo(this.ticketID);

  @override
  State<BuildPendingCustomerCompleteInfo> createState() =>
      _BuildPendingCustomerCompleteInfoState();
}

class _BuildPendingCustomerCompleteInfoState
    extends State<BuildPendingCustomerCompleteInfo> {
  CustomerDetailController customerDetailController =
      Get.put(CustomerDetailController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      customerDetailController.fetchServiceTicketDetail(
          widget.ticketID, context);
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
        return Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Container(
                height: Get.size.height,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: LabelTextComponent(
                                textAlign: TextAlign.left,
                                text: 'User ID',
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
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: LabelTextComponent(
                                textAlign: TextAlign.left,
                                text: 'User Name',
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
                              text: customerDetailController
                                      .serviceTicketDetail.value.firstname ??
                                  "xx xxx xxx xxx xxx",
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
                                text: 'Customer Phone',
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
                              text: customerDetailController
                                      .serviceTicketDetail.value.phone1 ??
                                  "xx xxx xxx xxx xxx",
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
                              text: customerDetailController
                                      .serviceTicketDetail.value.address ??
                                  "xx xxx xxx xxx xxx",
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
                                text: 'Lat',
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
                              text: customerDetailController
                                      .serviceTicketDetail.value.latitude ??
                                  "xx xxx xxx xxx xxx",
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
                                text: 'Long',
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
                              text: customerDetailController
                                      .serviceTicketDetail.value.longitude ??
                                  "xx xxx xxx xxx xxx",
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
                                text: 'Type',
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
                              text: customerDetailController
                                      .serviceTicketDetail.value.type ??
                                  "xx xxx xxx xxx xxx",
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
                                text: 'Topic',
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
                              text: customerDetailController
                                      .serviceTicketDetail.value.topic ??
                                  "xx xxx xxx xxx xxx",
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
                                text: 'Assigned Date',
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
                              text: customerDetailController.serviceTicketDetail
                                      .value.subconAssignedDate ??
                                  "xx xxx xxx xxx xxx",
                              color: Colors.black,
                              padding: 8.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonComponent(
                      text: 'Customer Complete',
                      padding: 10,
                      containerWidth: 150,
                      color: Colors.grey,
                      onPress: () => onPressCustomerComplete(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    });
  }

  void onPressCustomerComplete() {
    Get.offNamed(COMPLETE_CUSTOMER_TICKET_LIST_PAGE);
  }
}
