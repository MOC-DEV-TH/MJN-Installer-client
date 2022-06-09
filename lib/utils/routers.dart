import 'package:mjn_installer_app/views/CompleteTicketDetailPage.dart';
import 'package:mjn_installer_app/views/DevicePickupDetailPage.dart';
import 'package:mjn_installer_app/views/MyLocationPage.dart';
import 'package:mjn_installer_app/views/PendingCompleteCustomerDetailTicketPage.dart';
import 'package:mjn_installer_app/views/CompleteCustomerTicketListPage.dart';
import 'package:mjn_installer_app/views/TicketDetailPage.dart';
import 'package:mjn_installer_app/views/EditTicketPage.dart';
import 'package:mjn_installer_app/views/PendingAndNewOrderCustomerTicketListPage.dart';
import 'package:mjn_installer_app/views/HomePage.dart';
import 'package:mjn_installer_app/views/NewLoginPage.dart';
import 'package:mjn_installer_app/views/NewOrderCustomerPage.dart';
import 'package:mjn_installer_app/views/TicketStatusPage.dart';
import 'package:get/get.dart';

import 'app_constants.dart';

class Routers{
  static final route = [
    GetPage(name: LOGIN, page: () => NewLoginPage()),
    GetPage(name: HOME, page: () => HomePage()),
    GetPage(name: TICKET_STATUS_PAGE, page: () => TicketStatusPage()),
    GetPage(name: PENDING_AND_NEW_ORDER_CUSTOMER_TICKET_LIST_PAGE, page: () => PendingAndNewOrderCustomerTicketListPage()),
    GetPage(name: TICKET_DETAIL_PAGE, page: () => TicketDetailPage()),
    GetPage(name: EDIT_TICKET_PAGE, page: () => EditTicketPage()),
    GetPage(name: PENDING_CUSTOMER_COMPLETE_PAGE, page: () => PendingCompleteCustomerTicketPage()),
    GetPage(name: COMPLETE_CUSTOMER_TICKET_LIST_PAGE, page: () => CompleteCustomerTicketListPage()),
    GetPage(name: COMPLETE_TICKET_DETAIL_PAGE, page: () => CompleteTicketDetailPage()),
    GetPage(name: NEW_ORDER_CUSTOMER_PAGE, page: () => NewOrderCustomerPage()),
    GetPage(name: MY_LOCATION_PAGE, page: () => MyLocationPage()),
    GetPage(name: DEVICE_PICKUP_DETAIL_PAGE, page: () => DevicePickupDetailPage()),
  ];
}