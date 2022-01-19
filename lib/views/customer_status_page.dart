import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';

class CustomerStatusPage extends StatefulWidget {
  @override
  _CustomerStatusPageState createState() => _CustomerStatusPageState();
}

class _CustomerStatusPageState extends State<CustomerStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(int.parse(MJNColors.bgColor)),
        appBar: AppUtils.customAppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: _buildWidget(),
        ));
  }

  _buildWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Pending Customer',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
