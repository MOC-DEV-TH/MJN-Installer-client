import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/flow_and_status_component.dart';
import 'package:flutter_geolocator_example/controllers/home_controller.dart';
import 'package:flutter_geolocator_example/controllers/page_argument_controller.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageArgumentController pageArgumentController =
      Get.put(PageArgumentController());

  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    fetchAllCountsForServiceTicketAndInstallation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(MJNColors.bgColor)),
      body:Obx((){
        if(homeController.isLoading.value){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else
          return

            Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(30.0),
              child: SingleChildScrollView(child:
                Column(
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
                            count: homeController.serviceTicketAndInstallationCounts
                                .value.allInstallationCounts
                                .toString(),
                            assertImage: 'assets/installation_img.png',
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          FlowAndStatusComponent(
                            status: 'Service Ticket',
                            routeName: TICKET_STATUS,
                            argumentData: SERVICE_TICKET,
                            count: homeController.serviceTicketAndInstallationCounts
                                .value.allServiceTicketsCounts
                                .toString(),
                            assertImage: 'assets/service_ticket_img.png',
                          ),
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
                  )
              ),
            );

      }),
    );
  }

  void fetchAllCountsForServiceTicketAndInstallation(BuildContext context) {
    homeController.fetchAllCountsForServiceTicketAndInstallation(context);
  }
}
