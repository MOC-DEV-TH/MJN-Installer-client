import 'package:flutter/material.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:get/get.dart';

class CustomerStatusListItems extends StatelessWidget {
  final String? customerName;
  final String? customerAddress;
  final String? customerPhNo;
  final String? profileIdOrTicketID;
  final String? pageStatus;
  final String? township;

  CustomerStatusListItems(this.customerName, this.customerAddress,
      this.customerPhNo, this.profileIdOrTicketID,
      {@required this.pageStatus, @required this.township});

  @override
  Widget build(BuildContext context) {
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
                        township ?? '');
                  }
                  ;

                  pageStatus == 'complete'
                      ? Get.toNamed(COMPLETE_CUSTOMER_DETAIL_PAGE,
                          arguments: profileIdOrTicketID)
                      : pageStatus == NEW_ORDER
                          ? Get.toNamed(NEW_ORDER_CUSTOMER_PAGE)
                          : Get.toNamed(CUSTOMER_DETAIL_PAGE,
                              arguments: profileIdOrTicketID);
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
