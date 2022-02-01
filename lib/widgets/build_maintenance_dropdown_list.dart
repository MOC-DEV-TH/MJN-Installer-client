import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_geolocator_example/components/button_component.dart';
import 'package:flutter_geolocator_example/components/drop_down_button_component.dart';
import 'package:flutter_geolocator_example/components/label_text_component.dart';
import 'package:flutter_geolocator_example/controllers/login_controller.dart';
import 'package:flutter_geolocator_example/controllers/service_ticket_controller.dart';
import 'package:flutter_geolocator_example/models/allDropDownListVO.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';

class BuildMaintenanceDropdownList extends StatefulWidget {
  final String ticketID;

  BuildMaintenanceDropdownList(this.ticketID);

  @override
  State<BuildMaintenanceDropdownList> createState() =>
      _BuildMaintenanceDropdownListState();
}

class _BuildMaintenanceDropdownListState
    extends State<BuildMaintenanceDropdownList> {
  ServiceTicketController serviceTicketController =
      Get.put(ServiceTicketController());

  List<IssueDatum>? issueLists;
  List<IssueDatum>? resolutionLists;
  List<IssueDatum>? statusLists;

  @override
  void initState() {
    serviceTicketController
        .fetchServiceTicketDetail(widget.ticketID);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    issueLists =
        LoginController.to.maintenanceDropDownListsData.details!.issueData!;
    resolutionLists = LoginController
        .to.maintenanceDropDownListsData.details!.technicalResolution!;
    statusLists = LoginController
        .to.maintenanceDropDownListsData.details!.serviceTicketData!;

    debugPrint("IssueListSize ${issueLists!.length}");
    return Obx(() {
      if (serviceTicketController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else
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
                        text: serviceTicketController
                                    .serviceTicketDetail.value.firstname ==
                                ''
                            ? "xx xxx xxx xxx xxx"
                            : serviceTicketController
                                .serviceTicketDetail.value.firstname!,
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: serviceTicketController
                                .serviceTicketDetail.value.phone1 ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: serviceTicketController
                                .serviceTicketDetail.value.address ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: serviceTicketController
                                .serviceTicketDetail.value.latitude ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: serviceTicketController
                                .serviceTicketDetail.value.longitude ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: serviceTicketController
                                .serviceTicketDetail.value.type ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: 'xx xxx xxx xxx xxx',
                        color: Colors.black,
                        padding: 8.0),
                    LabelTextComponent(
                        text: serviceTicketController
                                .serviceTicketDetail.value.subconAssignedDate ??
                            "xx xxx xxx xxx xxx",
                        color: Colors.black,
                        padding: 8.0),
                  ],
                )
              ],
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(left: 15.0, right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: issueDropDownLabel),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropDownButtonComponent(
                        itemsList: issueLists,
                        onChangedData: (IssueDatum value) {
                          debugPrint('DropdownValue${value.id}');
                          serviceTicketController.updateTechnicalIssueValueID(value.id!);
                        },
                        hintText: '--Select Issue--',
                      ),
                      DropDownButtonComponent(
                        itemsList: resolutionLists,
                        onChangedData: (IssueDatum value) {
                          debugPrint('DropdownValue${value.id}');
                          serviceTicketController.updateTechnicalResolutionValueID(value.id!);
                        },
                        hintText: '--Select Resolution--',
                      ),

                      // DropDownButtonComponent(
                      //   itemsList: [
                      //     'Error Usage9',
                      //     'Error Usage10',
                      //     'Error Usage11',
                      //     'Error Usage12',
                      //   ],
                      //   onChangedData: (String value) {
                      //     debugPrint('DropdownValue${value}');
                      //   },
                      //   hintText: '--Error Usage--',
                      // ),

                      DropDownButtonComponent(
                        itemsList: statusLists,
                        onChangedData: (IssueDatum value) {
                          debugPrint('DropdownValue${value.id}');
                          serviceTicketController.updateStatusValueID(value.id!);
                        },
                        hintText: '--Select Status--',
                      ),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Obx((){
              if(serviceTicketController.loadingForButton.value){
                return Center(child: CircularProgressIndicator(),);
              }
              else
              return  ButtonComponent(
                  text: 'Complete',
                  containerWidth: 120,
                  padding: 10,
                  color: Color(int.parse(MJNColors.buttonColor)),
                  onPress: () => onPressComplete(),
                );
            })

          ],
        );
    });
  }

  final issueDropDownLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      LabelTextComponent(
          text: 'Technical Issue', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Technical Resolution', color: Colors.black, padding: 8.0),
      // LabelTextComponent(
      //     text: 'Usage', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Status', color: Colors.black, padding: 8.0),
    ],
  );

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

  void onPressComplete() {
    serviceTicketController.postServiceTicketDataOnServer(widget.ticketID);
  }
}
