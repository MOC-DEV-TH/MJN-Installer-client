import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_geolocator_example/components/button_component.dart';
import 'package:flutter_geolocator_example/components/drop_down_button_component.dart';
import 'package:flutter_geolocator_example/components/label_text_component.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';
class BuildMaintenanceDropdownList extends StatelessWidget {
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

  void onPressComplete() {
    Get.toNamed(COMPLETE_CUSTOMER);
  }


}
