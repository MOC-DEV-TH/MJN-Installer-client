import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/flow_and_status_component.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(30.0),
        color: Color(int.parse(MJNColors.bgColor)),
        child: _buildWidget(),
      ),
    );
  }

  _buildWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/splash_screen_logo.png'),
            width: 200,
            height: 100,
          ),
          SizedBox(
            height: 60.0,
          ),
          Text(
            'Choose priority work',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlowAndStatusComponent(
                  status: 'Installation',
                  routeName: TICKET_STATUS,
                  argumentData: INSTALLATION,
                  icon: Icons.inbox),
              SizedBox(
                width: 15,
              ),
              FlowAndStatusComponent(
                  status: 'Service Ticket',
                  routeName: TICKET_STATUS,
                  argumentData: SERVICE_TICKET,
                  icon: Icons.inbox),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            'Enter installation for enter bla bla\nEnter service ticket for bla bla',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black,
                decoration: TextDecoration.none),
          )
        ],
      ),
    );
  }
}
