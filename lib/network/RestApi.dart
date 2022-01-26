import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_geolocator_example/models/installationVO.dart';
import 'package:flutter_geolocator_example/models/installationDetailVO.dart';
import 'package:flutter_geolocator_example/models/serviceTicketDetailVO.dart';
import 'package:flutter_geolocator_example/models/serviceTicketVO.dart';
import 'package:flutter_geolocator_example/models/supportLoginVO.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class RestApi {
  static final String securityKey = 'moJoENEt2021sECuriTYkEy';
  static var client = http.Client();

  static Future<SupportLoginVo> fetchSupportLogin(
      Map<String, String> params) async {
    debugPrint(params.toString());
    var response = await client.post(
      Uri.parse(SUPPORT_LOGIN_URL),
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
        "security_key": securityKey
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SupportLoginVo.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to login');
    }
  }

  static void sendLatAndLongHitToServer(Map<String, String> params,
      String token) async {
    debugPrint(params.toString());
    var response = await client.post(
      Uri.parse(LATITUDE_LONGITUDE_URL),
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
        "token": token
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to send data');
    }
  }

  static Future<ServiceTicketVo> fetchServiceTicketPendingLists(String token, String uid,
      String status) async {
    var response = await client.get(

      Uri.parse(SERVICE_TICKET_LIST_URL +
          UID_PARAM + uid +
          STATUS_PARAM + status +
          APP_VERSION + app_version),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return serviceTicketVoFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to get service ticket lists');
    }
  }

  static Future<InstallationVo> fetchInstallationPendingLists(
      String token, String uid, String status) async {
    var response = await client.get(

      Uri.parse(INSTALLATION_LIST_URL +
          UID_PARAM + uid +
          STATUS_PARAM + status +
          APP_VERSION + app_version),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return installationVoFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to get pending  lists');
    }
  }


  static Future<InstallationDetailVo> getInstallationDetail(
      String token, String uid, String profileId) async {
    var response = await client.get(

      Uri.parse(GET_INSTALLATION_DETAIL_URL +
          UID_PARAM + uid +
          PROFILE_ID_PARAM + profileId +
          APP_VERSION + app_version),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return installationDetailVoFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to get installation detail');
    }
  }

  static Future<ServiceTicketDetailVo> getServiceTicketDetail(
      String token, String uid, String ticketID) async {
    var response = await client.get(

      Uri.parse(GET_SERVICE_TICKET_DETAIL_URL +
          UID_PARAM + uid +
          TICKET_ID_PARAM + ticketID +
          APP_VERSION + app_version),
      headers: {
        'content-type': 'application/json',
        'token': token
      },
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return serviceTicketDetailVoFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to get service ticket detail');
    }
  }


  }

