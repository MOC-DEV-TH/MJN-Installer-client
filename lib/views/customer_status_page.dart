import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:flutter_geolocator_example/viewPods/bottom_nav_bar_viewPod.dart';
import 'package:flutter_geolocator_example/viewPods/search_text_field_viewPod.dart';

class CustomerStatusPage extends StatefulWidget {
  @override
  _CustomerStatusPageState createState() => _CustomerStatusPageState();
}

class _CustomerStatusPageState extends State<CustomerStatusPage> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();

  List<String> imageList = [
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Color(int.parse(MJNColors.bgColor)),
          appBar: AppUtils.customAppBar(),
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: _buildWidget(),
          ),
          bottomNavigationBar: BottomNavigationBarViewPod()),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Customer Name',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Text(
              'Township',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Text(
              'Assigned Date',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: SearchTextFieldViewPod(
              controller: controller1,
              icon: Icons.search,
            )),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: SearchTextFieldViewPod(
                    controller: controller2, icon: Icons.search)),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: SearchTextFieldViewPod(
                    controller: controller3, icon: Icons.search)),
          ],
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              return _buildListView();
            },
            itemCount: imageList.length,
          ),
        )
      ],
    );
  }

  Widget _buildListView() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    );
  }
}
