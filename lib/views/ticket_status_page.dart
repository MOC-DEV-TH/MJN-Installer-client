import 'package:flutter/material.dart';
import 'package:mjn_installer_app/components/flow_and_status_component.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/controllers/page_argument_controller.dart';
import 'package:mjn_installer_app/controllers/ticket_status_controller.dart';
import 'package:mjn_installer_app/res/colors.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:mjn_installer_app/utils/app_utils.dart';
import 'package:mjn_installer_app/components/bottom_nav_bar_component.dart';
import 'package:get/get.dart';

class TicketStatusPage extends StatelessWidget {
  final TicketStatusController ticketStatusController =
      Get.put(TicketStatusController());

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
        bottomNavigationBar: GetBuilder<TicketStatusController>(
            init: TicketStatusController(),
            initState: (_) {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                ticketStatusController.updateArgumentData(
                    PageArgumentController.to.getArgumentData());
              });
            },
            builder: (controller) => BottomNavigationBarComponent(
                  argumentData: controller.argumentData,
                  onChangedData: (val) {
                    controller.updateArgumentData(val);
                    PageArgumentController.to.updateArgumentData(val);
                    if (val == INSTALLATION) {
                      controller.fetchInstallationData();
                    } else {
                      controller.fetchServiceTicketData();
                    }
                  },
                )));
  }

  _buildWidget() {
    return Obx(() {
      if (HomeController.to.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              GetBuilder<TicketStatusController>(
                builder: (controller) => Text(
                  ticketStatusController.getArgumentData() == INSTALLATION
                      ? "Total - ${HomeController.to.serviceTicketAndInstallationCounts.value.allInstallationCounts.toString()}"
                      : "Total - ${HomeController.to.serviceTicketAndInstallationCounts.value.allServiceTicketsCounts.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetBuilder<TicketStatusController>(
                      builder: (controller) => FlowAndStatusComponent(
                          argumentData:
                              ticketStatusController.getArgumentData(),
                          status: PENDING,
                          routeName: CUSTOMER_STATUS_PAGE,
                          count: ticketStatusController.getArgumentData() ==
                                  INSTALLATION
                              ? HomeController
                                  .to
                                  .serviceTicketAndInstallationCounts
                                  .value
                                  .pendingInstallationCount
                                  .toString()
                              : HomeController
                                  .to
                                  .serviceTicketAndInstallationCounts
                                  .value
                                  .pendingCount
                                  .toString(),
                          assertImage: 'assets/pending_img.png')),
                  GetBuilder<TicketStatusController>(
                      builder: (controller) => FlowAndStatusComponent(
                          argumentData: controller.getArgumentData(),
                          status: NEW_ORDER,
                          routeName: CUSTOMER_STATUS_PAGE,
                          count: ticketStatusController.getArgumentData() ==
                                  INSTALLATION
                              ? HomeController
                                  .to
                                  .serviceTicketAndInstallationCounts
                                  .value
                                  .newInstallationCount
                                  .toString()
                              : HomeController
                                  .to
                                  .serviceTicketAndInstallationCounts
                                  .value
                                  .newOrderCount
                                  .toString(),
                          assertImage: 'assets/installation_img.png')),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GetBuilder<TicketStatusController>(
                builder: (controller) => FlowAndStatusComponent(
                    argumentData: controller.getArgumentData(),
                    status: COMPLETE,
                    routeName: COMPLETE_CUSTOMER_PAGE,
                    count:
                        ticketStatusController.getArgumentData() == INSTALLATION
                            ? HomeController
                                .to
                                .serviceTicketAndInstallationCounts
                                .value
                                .completedInstallationCount
                                .toString()
                            : HomeController
                                .to
                                .serviceTicketAndInstallationCounts
                                .value
                                .completedCount
                                .toString(),
                    assertImage: 'assets/complete_img.png'),
              )
            ],
          ),
        );
    });
  }
}
