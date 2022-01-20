import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:flutter_geolocator_example/viewPods/drop_down_button_viewPod.dart';
class CustomerIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppUtils.customAppBar(),
      backgroundColor: Color(int.parse(MJNColors.bgColor)),
      body: _buildWidget(),
    );
  }
  Widget _buildWidget() {
    return SingleChildScrollView(
      child: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [customerLabel, middleLabel, customerLabelData],
          ),
          Container(
            margin: EdgeInsets.only(left: 24.0,right: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: issueDropDownLabel),
                Expanded(
                    child: issueDropDownLists)
              ],
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          InkWell(
              onTap: onPressComplete,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Complete',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color(int.parse(MJNColors.buttonColor)),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
              ))
        ],
      ),
    );
  }
  void onPressComplete() {}
  final issueDropDownLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8,bottom: 20),
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
      SizedBox(height: 10,),
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
      SizedBox(height: 10,),
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
          child: DropDownButtonViewPod(
            itemsList: [
              'Select Issue1',
              'Select Issue2',
              'Select Issue3',
              'Select Issue4',
            ],
            onChangedData: (String value){
              debugPrint('DropdownValue${value}');
            },
            hintText:'--Select Issue--',
          )),
      Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropDownButtonViewPod(
            itemsList: [
              'Select Resolution5',
              'Select Resolution6',
              'Select Resolution7',
              'Select Resolution8',
            ],
            onChangedData: (String value){
              debugPrint('DropdownValue${value}');
            },
            hintText:'--Select Resolution--',
          )),
      Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropDownButtonViewPod(
            itemsList:[
              'Error Usage9',
              'Error Usage10',
              'Error Usage11',
              'Error Usage12',
            ],
            onChangedData: (String value){
              debugPrint('DropdownValue${value}');
            },
            hintText:'--Error Usage--',
          )),
      Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropDownButtonViewPod(
            itemsList:  [
              'Status13',
              'Status14',
              'Status15',
              'Status16',
            ],
            onChangedData: (String value){
              debugPrint('DropdownValue${value}');
            },
            hintText:'--Select Status--',
          )),
    ],
  );

  final customerLabelData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'xx xxx xxx xxx xxx',
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
          'xx xxx xxx xxx xxx',
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
          'xx xxx xxx xxx xxx',
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
          'xx xxx xxx xxx xxx',
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
          'xx xxx xxx xxx xxx',
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
          'xx xxx xxx xxx xxx',
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
          'xx xxx xxx xxx xxx',
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
          'xx xxx xxx xxx xxx',
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
          'xx xxx xxx xxx xxx',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    ],
  );

  final customerLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'UserID',
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
          'Customer Name',
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
          'Customer Phone',
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
          'Address',
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
          'Lat',
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
          'Long',
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
          'Type',
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
          'Type',
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
          'Assigned Date',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    ],
  );

  final middleLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '- - -',
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
          '- - -',
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
          '- - -',
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
          '- - -',
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
          '- - -',
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
          '- - -',
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
          '- - -',
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
          '- - -',
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
          '- - -',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    ],
  );
}
