import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/button_component.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:flutter_geolocator_example/widgets/build_customer_info_label.dart';
import 'package:flutter_geolocator_example/widgets/build_dropdown_list.dart';
import 'package:get/get.dart';

class CustomerIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppUtils.customAppBar(),
      backgroundColor: Color(int.parse(MJNColors.bgColor)),
      body: _buildWidget(),
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
          BuildCustomerInfoLabel(),

          BuildDropdownList(),

          SizedBox(
            height: 60.0,
          ),
          ButtonComponent(
            text: 'Complete',
            containerWidth: 120,
            padding: 10,
            color: Color(int.parse(MJNColors.buttonColor)),
            onPress: () => onPressComplete(),
          ),
        ],
      ),
    );
  }

  void onPressComplete() {
    Get.toNamed(COMPLETE_CUSTOMER);
  }

}
