import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/controllers/customer_controller.dart';
import 'package:flutter_geolocator_example/controllers/page_argument_controller.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:flutter_geolocator_example/components/bottom_nav_bar_component.dart';
import 'package:flutter_geolocator_example/widgets/build_search_text_field.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CustomerStatusPage extends StatelessWidget {

  CustomerController customerController = Get.put(CustomerController());

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
            child: GetBuilder<CustomerController>(builder: (controller) =>
                BuildSearchTextField())

          ),
          bottomNavigationBar: GetBuilder<CustomerController>(
              init: CustomerController(),
              initState: (_) {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  customerController
                      .updateArgumentData(PageArgumentController.to.getArgumentData());
                });
              },
              builder: (controller) => BottomNavigationBarComponent(
                argumentData: controller.argumentData,
                onChangedData: (val) {
                  PageArgumentController.to.updateArgumentData(val);
                  controller.updateArgumentData(val);
                },
              )))
    );
  }
}
