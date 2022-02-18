import 'package:flutter/material.dart';
import 'package:mjn_installer_app/components/flow_and_status_component.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/controllers/page_argument_controller.dart';
import 'package:mjn_installer_app/res/colors.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final PageArgumentController pageArgumentController =
      Get.put(PageArgumentController());

  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    homeController.onUIReady(context);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    debugPrint(state.toString());
    if(state == AppLifecycleState.resumed){
      print('onResume');
      homeController.onUIReady(context);
    }

  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(MJNColors.bgColor)),
      body: Obx(() {
        if (HomeController.to.homeLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else
          return Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(30.0),
            child: SingleChildScrollView(
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
                      routeName: TICKET_STATUS_PAGE,
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
                      routeName: TICKET_STATUS_PAGE,
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
            )),
          );
      }),
    );
  }

}
