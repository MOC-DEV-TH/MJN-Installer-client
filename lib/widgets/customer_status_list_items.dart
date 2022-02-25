import 'package:flutter/material.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/controllers/page_argument_controller.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:get/get.dart';

class CustomerStatusListItems extends StatelessWidget {
  final String? customerName;
  final String? customerAddress;
  final String? customerPhNo;
  final String? profileId;
  final String? ticketId;
  final String? pageStatus;
  final String? township;
  final String? customerUID;
  final String? status;

  CustomerStatusListItems(this.customerName, this.customerAddress,
      this.customerPhNo, this.profileId,
      {@required this.pageStatus,
      @required this.township,
      @required this.ticketId,
      @required this.customerUID,
      @required this.status});

  @override
  Widget build(BuildContext context) {
    debugPrint(status);
    return Container(
        child: Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customerInfoLabel,
            middleLabel,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    customerName!,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    customerPhNo!,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    customerAddress!,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
              ],
            ),
            verticalDivider,
            InkWell(
                onTap: () {
                  if (pageStatus == NEW_ORDER) {
                    HomeController.to.updateNewOrderData(
                        customerName ?? '',
                        customerAddress ?? '',
                        customerPhNo ?? '',
                        township ?? '',
                        ticketId ?? '',
                        profileId ?? '',
                        customerUID ?? '');
                  }
                  ;

                  pageStatus == 'complete'
                      ? Get.toNamed(COMPLETE_CUSTOMER_DETAIL_PAGE,
                          arguments:
                              PageArgumentController.to.getArgumentData() ==
                                      INSTALLATION
                                  ? profileId
                                  : ticketId)
                      : pageStatus == NEW_ORDER
                          ? Get.toNamed(NEW_ORDER_CUSTOMER_PAGE)!.then(
                              (value) => Future.delayed(Duration.zero, () {
                                    if (PageArgumentController.to
                                            .getArgumentData() ==
                                        INSTALLATION) {
                                      if (PageArgumentController.to
                                              .getStatus() ==
                                          NEW_ORDER) {
                                        HomeController.to
                                            .fetchInstallationPendingCustomer(
                                                'newOrder', context);
                                      } else if (PageArgumentController.to
                                              .getStatus() ==
                                          PENDING) {
                                        HomeController.to
                                            .fetchInstallationPendingCustomer(
                                                'pending', context);
                                      }
                                    } else if (PageArgumentController.to
                                            .getArgumentData() ==
                                        SERVICE_TICKET) {
                                      if (PageArgumentController.to
                                              .getStatus() ==
                                          NEW_ORDER) {
                                        HomeController.to
                                            .fetchServiceTicketPendingCustomer(
                                                'newOrder', context);
                                      } else if (PageArgumentController.to
                                              .getStatus() ==
                                          PENDING) {
                                        HomeController.to
                                            .fetchServiceTicketPendingCustomer(
                                                'pending', context);
                                      }
                                    }
                                  }))
                           // pending ticket flow
                          //installation flow
                          : PageArgumentController.to.getArgumentData() ==
                                  INSTALLATION
                              ? status == '2'
                                  ? Get.toNamed(CUSTOMER_DETAIL_PAGE,
                                      arguments: profileId)
                                  : Get.toNamed(CUSTOMER_STATUS_PAGE,
                                      arguments: profileId)

                              // service ticket flow
                              : status == '2'
                                  ? Get.toNamed(CUSTOMER_DETAIL_PAGE,
                                      arguments: ticketId)
                                  : Get.toNamed(CUSTOMER_STATUS_PAGE,
                                      arguments: ticketId);
                },
                child: labelView)
          ],
        ),
      ),
    ));
  }

  final customerInfoLabel = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Customer Name',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Customer Ph No.',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Township',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    ],
  );

  final middleLabel = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
    ],
  );

  final verticalDivider = Container(
    height: 40,
    width: 1,
    color: Colors.grey,
  );

  final labelView = Text(
    'View',
    style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 13,
        color: Colors.lightBlueAccent,
        decoration: TextDecoration.underline),
  );
}
