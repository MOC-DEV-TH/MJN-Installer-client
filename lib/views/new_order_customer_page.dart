import 'package:flutter/material.dart';
import 'package:mjn_installer_app/components/button_component.dart';
import 'package:mjn_installer_app/components/label_text_component.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/controllers/new_order_customer_controller.dart';
import 'package:mjn_installer_app/res/colors.dart';
import 'package:mjn_installer_app/utils/app_utils.dart';
import 'package:get/get.dart';

class NewOrderCustomerPage extends StatelessWidget {
 final NewOrderCustomerController controller = Get.put(NewOrderCustomerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppUtils.customAppBar(),
        backgroundColor: Color(int.parse(MJNColors.bgColor)),
        body: _buildWidget(context));
  }

  _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Column(
              children: [
                Text(
                  'New Order',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),

                SizedBox(
                  height: 10.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [customerLabel, middleLabel, customerData],
                ),
                SizedBox(
                  height: 20.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonComponent(
                      text: 'Accept Now',
                      containerWidth: 120,
                      padding: 10,
                      color: Color(int.parse(MJNColors.buttonColor)),
                      onPress: () => {
                        controller.onTapAcceptNow('', '')
                      },
                    ),
                    ButtonComponent(
                      text: 'Later',
                      containerWidth: 120,
                      padding: 10,
                      color: Color(int.parse(MJNColors.buttonColor)),
                      onPress: () => {
                        controller.onTapLater(context,'','','')
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final customerData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelTextComponent(
          text: HomeController.to.customerName == null
              ? "xx xxx xxx xxx"
              : HomeController.to.customerName,
          color: Colors.black,
          padding: 8.0),
      LabelTextComponent(
          text: HomeController.to.customerAddress == null
              ? "xx xxx xxx xxx"
              : HomeController.to.customerAddress,
          color: Colors.black,
          padding: 8.0),
      LabelTextComponent(
          text: HomeController.to.customerPhNo == null
              ? "xx xxx xxx xxx"
              : HomeController.to.customerPhNo,
          color: Colors.black,
          padding: 8.0),
      LabelTextComponent(
          text: HomeController.to.customerTownship == null
              ? "xx xxx xxx xxx"
              : HomeController.to.customerTownship,
          color: Colors.black,
          padding: 8.0),
    ],
  );

  final customerLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelTextComponent(
          text: 'Customer Name', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Address', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Phone No', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: 'Township', color: Colors.black, padding: 8.0),
    ],
  );

  final middleLabel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabelTextComponent(text: '-', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '-', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '-', color: Colors.black, padding: 8.0),
      LabelTextComponent(text: '-', color: Colors.black, padding: 8.0),
    ],
  );
}
