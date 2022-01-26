import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/button_component.dart';
import 'package:flutter_geolocator_example/components/label_text_component.dart';
import 'package:flutter_geolocator_example/controllers/customer_detail_controller.dart';
import 'package:flutter_geolocator_example/controllers/page_argument_controller.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';

class BuildCustomerInfoLabel extends StatefulWidget {
  final String profileIdOrTicketID;

  BuildCustomerInfoLabel( this.profileIdOrTicketID);

  @override
  State<BuildCustomerInfoLabel> createState() => _BuildCustomerInfoLabelState();
}

class _BuildCustomerInfoLabelState extends State<BuildCustomerInfoLabel> {
  CustomerDetailController customerDetailController =
      Get.put(CustomerDetailController());

  @override
  void initState() {
    if (PageArgumentController.to.getArgumentData()== INSTALLATION) {
      customerDetailController
          .fetchInstallationDetail(widget.profileIdOrTicketID);
    } else {
      customerDetailController
          .fetchServiceTicketDetail(widget.profileIdOrTicketID);
    }
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
      return  PageArgumentController.to.getArgumentData() == INSTALLATION ? Column(
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
                        text: customerDetailController
                                .installationDetail.value.user_name ??
                            "xx xxx xxx xxx xxx",
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
                                .installationDetail.value.subconAssignedDate ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),

                  ],
                )
              ],
            ),
          SizedBox(height: 40,),
          ButtonComponent(
            text: PageArgumentController.to.getArgumentData() == SERVICE_TICKET
                ? 'Action Started'
                : 'Installation Started',
            padding: 10,
            containerWidth:
            PageArgumentController.to.getArgumentData() == SERVICE_TICKET ? 120 : 140,
            color: Color(int.parse(MJNColors.buttonColor)),
            onPress: () => onPressActionStart(),
          ),
        ],
      ) :
      Column(
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
                      text: customerDetailController
                          .serviceTicketDetail.value.userName == '' ?
                          "xx xxx xxx xxx xxx" : customerDetailController
                          .serviceTicketDetail.value.userName!,
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
                          .serviceTicketDetail.value.longitude ??
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
                          .serviceTicketDetail.value.subconAssignedDate ??
                          "xx xxx xxx xxx xxx",
                      color: Colors.black,
                      padding: 8.0),

                ],
              )
            ],
          ),
          SizedBox(height: 60,),
          ButtonComponent(
            text: PageArgumentController.to.getArgumentData() == SERVICE_TICKET
                ? 'Action Started'
                : 'Installation Started',
            padding: 10,
            containerWidth:
            PageArgumentController.to.getArgumentData() == SERVICE_TICKET ? 120 : 140,
            color: Color(int.parse(MJNColors.buttonColor)),
            onPress: () => onPressActionStart(),
          ),
        ],
      );

    });
  }

  void onPressActionStart() {
    Get.toNamed(CUSTOMER_ISSUE, arguments:
      widget.profileIdOrTicketID
    );
  }
  final customerLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
    ],
  );
}
