import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:get/get.dart';

class TicketStatusPage extends StatefulWidget {
  @override
  _TicketStatusPageState createState() => _TicketStatusPageState();
}

class _TicketStatusPageState extends State<TicketStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppUtils.customAppBar(),
      backgroundColor: Color(int.parse(MJNColors.bgColor)),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: _buildWidget(),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 1, top: 10),
                  height: 52,
                  width: 150,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Installation',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.inbox,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 1,
                  right: 2,
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
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 1, top: 10),
                  height: 52,
                  width: 150,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        color: Color(0xffFF5F1F),
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Service Ticket',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.inbox,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 1,
                  right: 2,
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
          ],
        ),
      ),
    );
  }

  _buildWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 60.0,
          ),
          Text(
            'Total - 2',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.underline),
          ),
          SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => Get.toNamed(CUSTOMER_STATUS),
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
                            Icons.stop_circle_sharp,
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
                        'Pending',
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
              InkWell(
                onTap: () => Get.toNamed(CUSTOMER_STATUS),
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
                        'New Order',
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
            height: 20,
          ),
          InkWell(
            onTap: () => Get.toNamed(CUSTOMER_STATUS),
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
                        Icons.check_circle_outline_sharp,
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
                    'Complete',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
