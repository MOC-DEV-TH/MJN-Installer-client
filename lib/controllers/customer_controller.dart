import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerController extends GetxController{
  final customerNameTextController = TextEditingController();
  final customerTownshipController = TextEditingController();
  var customerDateController = TextEditingController();

  void complete(){}
  void pending(){}


  void selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selected != null) {
      String dtFormat = DateFormat('dd/MM/yyyy').format(selected);
      debugPrint("DateTimeFormat${dtFormat}");
         customerDateController.text = dtFormat.toString();
    }
  }
}