import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:flutter_geolocator_example/views/ticket_status_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
              InkWell(
                onTap: () => Get.toNamed(TICKET_STATUS),
                child: Container(
                  height: 170,
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                    ),
                    color: Colors.white54,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Icon(
                            Icons.inbox,
                            size: 80,
                          ),
                          Positioned(
                            top: 1,
                            right: 1,
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: const Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.yellow,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Installation',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(width: 15,),

              InkWell(
                onTap: () => Get.toNamed(TICKET_STATUS),
                child: Container(
                  width: 140,
                  height: 170,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                    ),
                    color: Colors.white54,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Icon(
                            Icons.inbox,
                            size: 80,
                          ),
                          Positioned(
                            top: 1,
                            right: 1,
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: const Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.yellow,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Service Ticket',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                ),
              )
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
