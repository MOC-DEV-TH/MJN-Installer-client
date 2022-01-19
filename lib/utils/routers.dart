import 'package:flutter_geolocator_example/views/customer_status_page.dart';
import 'package:flutter_geolocator_example/views/home_page.dart';
import 'package:flutter_geolocator_example/views/new_login_page.dart';
import 'package:flutter_geolocator_example/views/ticket_status_page.dart';
import 'package:get/get.dart';

import 'app_constants.dart';

class Routers{
  static final route = [
    GetPage(name: LOGIN, page: () => NewLoginPage()),
    GetPage(name: HOME, page: () => HomePage()),
    GetPage(name: TICKET_STATUS, page: () => TicketStatusPage()),
    GetPage(name: CUSTOMER_STATUS, page: () => CustomerStatusPage()),
  ];
}