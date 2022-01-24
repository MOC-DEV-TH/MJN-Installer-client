import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_geolocator_example/components/button_component.dart';
import 'package:flutter_geolocator_example/components/drop_down_button_component.dart';
import 'package:flutter_geolocator_example/components/label_text_component.dart';
import 'package:flutter_geolocator_example/controllers/service_ticket_controller.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';
class BuildMaintenanceDropdownList extends StatefulWidget {
  final String profileIdOrTicketID;
  BuildMaintenanceDropdownList(this.profileIdOrTicketID);
  @override
  State<BuildMaintenanceDropdownList> createState() => _BuildMaintenanceDropdownListState();
}

class _BuildMaintenanceDropdownListState extends State<BuildMaintenanceDropdownList> {

  ServiceTicketController serviceTicketController = Get.put(ServiceTicketController());

  @override
  void initState() {
    serviceTicketController.fetchServiceTicketDetail(widget.profileIdOrTicketID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
    Obx((){
      if(serviceTicketController.isLoading.value){
        return Center(child: CircularProgressIndicator(),);
      }
      else
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
                    text:
                    serviceTicketController.serviceTicketDetail.value.uid ??
                        "xx xxx xxx xxx xxx",
                    color: Colors.black,
                    padding: 8.0),
                LabelTextComponent(
                    text: serviceTicketController
                        .serviceTicketDetail.value.firstname ??
                        "xx xxx xxx xxx xxx",
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
        margin: EdgeInsets.only(left: 24.0, right: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: issueDropDownLabel),
            Expanded(child: issueDropDownLists),
          ],
        ),

      ),

      SizedBox(height: 40.0,),

      ButtonComponent(
      text: 'Complete',
      containerWidth: 120,
      padding: 10,
      color: Color(int.parse(MJNColors.buttonColor)),
      onPress: () => onPressComplete(),
      ),
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
      LabelTextComponent(
          text: 'Usage', color: Colors.black, padding: 8.0),
      LabelTextComponent(
          text: 'Status', color: Colors.black, padding: 8.0),

    ],
  );

  final issueDropDownLists = Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      DropDownButtonComponent(
        itemsList: [
          'Select Issue1',
          'Select Issue2',
          'Select Issue3',
          'Select Issue4',
          'Select Resolution5',
          'Select Resolution6',
          'Select Resolution7',
          'Select Resolution8',
        ],
        onChangedData: (String value) {
          debugPrint('DropdownValue${value}');
        },
        hintText: '--Select Issue--',
      ),
      DropDownButtonComponent(
        itemsList: [
          'Select Resolution5',
          'Select Resolution6',
          'Select Resolution7',
          'Select Resolution8',
          'Select Resolution5',
          'Select Resolution6',
          'Select Resolution7',
          'Select Resolution8',
        ],
        onChangedData: (String value) {
          debugPrint('DropdownValue${value}');
        },
        hintText: '--Select Resolution--',
      ),
      DropDownButtonComponent(
        itemsList: [
          'Error Usage9',
          'Error Usage10',
          'Error Usage11',
          'Error Usage12',
        ],
        onChangedData: (String value) {
          debugPrint('DropdownValue${value}');
        },
        hintText: '--Error Usage--',
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
    Get.toNamed(COMPLETE_CUSTOMER);
  }
}
