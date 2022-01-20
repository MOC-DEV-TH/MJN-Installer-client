import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/drop_down_button_component.dart';
class BuildDropdownList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.0, right: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: issueDropDownLabel),
          Expanded(child: issueDropDownLists)
        ],
      ),
    );
  }


  final issueDropDownLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 20),
        child: Text(
          'Technical Issue',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Technical Resolution',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Usage',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Status',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    ],
  );

  final issueDropDownLists = Column(
    children: [
      Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropDownButtonComponent(
            itemsList: [
              'Select Issue1',
              'Select Issue2',
              'Select Issue3',
              'Select Issue4',
            ],
            onChangedData: (String value) {
              debugPrint('DropdownValue${value}');
            },
            hintText: '--Select Issue--',
          )),
      Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropDownButtonComponent(
            itemsList: [
              'Select Resolution5',
              'Select Resolution6',
              'Select Resolution7',
              'Select Resolution8',
            ],
            onChangedData: (String value) {
              debugPrint('DropdownValue${value}');
            },
            hintText: '--Select Resolution--',
          )),
      Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropDownButtonComponent(
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
          )),
      Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropDownButtonComponent(
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
          )),
    ],
  );

}

