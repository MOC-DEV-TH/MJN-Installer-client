import 'package:flutter/material.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/res/colors.dart';
import 'package:mjn_installer_app/utils/app_utils.dart';
import 'package:mjn_installer_app/widgets/build_pending_and_neworder_customer_ticket_list.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class PendingAndNewOrderCustomerTicketListPage extends StatefulWidget {
  @override
  State<PendingAndNewOrderCustomerTicketListPage> createState() => _PendingAndNewOrderCustomerTicketListPageState();
}

class _PendingAndNewOrderCustomerTicketListPageState extends State<PendingAndNewOrderCustomerTicketListPage> {
  HomeController customerController = Get.put(HomeController());


  @override
  void initState() {
    // if(PageArgumentController.to.getArgumentData() == INSTALLATION){
    //   if (PageArgumentController.to.getStatus() == NEW_ORDER) {
    //     customerController.fetchInstallationPendingCustomer('newOrder', context);
    //   } else if (PageArgumentController.to.getStatus() == PENDING) {
    //     customerController.fetchInstallationPendingCustomer('pending', context);
    //   }
    // }
    // else if(PageArgumentController.to.getArgumentData() == SERVICE_TICKET){
    //   if (PageArgumentController.to.getStatus() == NEW_ORDER) {
    //     customerController.fetchServiceTicketPendingCustomer('newOrder', context);
    //   } else if (PageArgumentController.to.getStatus() == PENDING) {
    //     customerController.fetchServiceTicketPendingCustomer('pending', context);
    //   }
    // }
    // else if(PageArgumentController.to.getArgumentData() == RELOCATION_JOBS) {
    //   if (PageArgumentController.to.getStatus() == NEW_ORDER) {
    //     customerController.fetchRelocationPendingCustomer('newOrder','1', context);
    //   } else if (PageArgumentController.to.getStatus() == PENDING) {
    //     customerController.fetchRelocationPendingCustomer('pending','1', context);
    //   }
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: Color(int.parse(MJNColors.bgColor)),
            appBar: AppUtils.customAppBar(),
            body: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: BuildPendingAndNewOrderCustomerTicketList()),
            // bottomNavigationBar: GetBuilder<HomeController>(
            //     initState: (_) {
            //       WidgetsBinding.instance!.addPostFrameCallback((_) {
            //         customerController.updateArgumentData(
            //             PageArgumentController.to.getArgumentData());
            //       });
            //     },
            //     builder: (controller) => BottomNavigationBarComponent(
            //           argumentData: controller.argumentData,
            //           onChangedData: (val) {
            //             PageArgumentController.to.updateArgumentData(val);
            //             controller.updateArgumentData(val);
            //            Future.delayed(Duration.zero,(){
            //              if (val == INSTALLATION) {
            //                if (PageArgumentController.to.getStatus() == NEW_ORDER) {
            //                  controller.fetchInstallationPendingCustomer('newOrder', context);
            //                } else if (PageArgumentController.to.getStatus() == PENDING) {
            //                  controller.fetchInstallationPendingCustomer('pending', context);
            //                }
            //              } else if (val ==
            //                  SERVICE_TICKET) {
            //                if (PageArgumentController.to.getStatus() == NEW_ORDER) {
            //                  controller.fetchServiceTicketPendingCustomer('newOrder', context);
            //                } else if (PageArgumentController.to.getStatus() == PENDING) {
            //                  controller.fetchServiceTicketPendingCustomer('pending', context);
            //                }
            //              }
            //            });
            //
            //           },
            //         ))
        ));
  }
}
