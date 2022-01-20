import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:get/get.dart';

class CustomerDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppUtils.customAppBar(),
      backgroundColor: Color(int.parse(MJNColors.bgColor)),
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Column(
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

        SizedBox(
          height: 60.0,
        ),

        InkWell(
            onTap: onPressActionStart,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Action Started',style: TextStyle(color: Colors.white),),
              ),
              decoration: BoxDecoration(
                  color: Color(int.parse(MJNColors.buttonColor)),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
            ))
      ],
    );
  }

  void onPressActionStart() {
    Get.toNamed(CUSTOMER_ISSUE);
  }

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
