import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/controllers/customer_detail_controller.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:flutter_geolocator_example/widgets/build_customer_info_label.dart';
import 'package:get/get.dart';

class CompleteCustomerDetailPage extends StatefulWidget {
  @override
  State<CompleteCustomerDetailPage> createState() => _CompleteCustomerDetailPageState();
}

class _CompleteCustomerDetailPageState extends State<CompleteCustomerDetailPage> {

  @override
  void initState() {
    Get.put(CustomerDetailController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppUtils.customAppBar(),
      backgroundColor: Color(int.parse(MJNColors.bgColor)),
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Complete Customer',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        SizedBox(
          height: 20.0,
        ),
        BuildCustomerInfoLabel(
            Get.arguments.toString(),status: 'complete',),
      ],
    );
  }
}
