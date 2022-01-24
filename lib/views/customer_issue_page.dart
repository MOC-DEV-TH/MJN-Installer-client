import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:flutter_geolocator_example/widgets/build_installation_dropdown_list.dart';
import 'package:flutter_geolocator_example/widgets/build_maintenance_dropdown_list.dart';
import 'package:get/get.dart';

class CustomerIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppUtils.customAppBar(),
      backgroundColor: Color(int.parse(MJNColors.bgColor)),
      body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildWidget(),
          )),
    );
  }

  Widget _buildWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Pending Customer',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 20.0,
          ),
          //BuildCustomerInfoLabel(),
          Get.arguments[0].toString() == INSTALLATION
              ? BuildInstallationDropdownList(Get.arguments[1].toString())
              : BuildMaintenanceDropdownList(Get.arguments[1].toString()),
        ],
      ),
    );
  }
}
