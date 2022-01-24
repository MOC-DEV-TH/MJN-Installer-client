import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/res/colors.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:flutter_geolocator_example/widgets/build_search_text_field.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CompleteCustomerListPage extends StatelessWidget {
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
            child: BuildSearchTextField('Complete',Get.arguments.toString()),
          ),
          ),
    );
  }
}
