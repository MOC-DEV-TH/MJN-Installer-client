import 'package:flutter/material.dart';
import 'package:mjn_installer_app/res/colors.dart';
import 'package:mjn_installer_app/utils/app_utils.dart';
import 'package:mjn_installer_app/widgets/build_complete_customer_list.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class CompleteCustomerPage extends StatelessWidget {
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
            child: BuildCompleteCustomerList()
          ),
          ),
    );
  }
}
