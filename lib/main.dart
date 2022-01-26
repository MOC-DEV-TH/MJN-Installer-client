import 'dart:async';
import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geolocator_example/network/RestApi.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:flutter_geolocator_example/utils/routers.dart';
import 'package:flutter_geolocator_example/views/customer_status_page.dart';
import 'package:flutter_geolocator_example/views/home_page.dart';
import 'package:flutter_geolocator_example/views/login_page.dart';
import 'package:flutter_geolocator_example/views/new_login_page.dart';
import 'package:flutter_geolocator_example/views/ticket_status_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Defines the main theme color.
final MaterialColor themeMaterialColor =
BaseflowPluginExample.createMaterialColor(
    const Color.fromRGBO(48, 49, 60, 1));

Future  main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       getPages: Routers.route,
      home: NewLoginPage());
  }
}



