import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/search_text_field_component.dart';
import 'package:flutter_geolocator_example/controllers/customer_controller.dart';
import 'customer_status_list_items.dart';
import 'package:get/get.dart';

class BuildSearchTextField extends StatelessWidget {
  final String status;

  BuildSearchTextField(this.status);

  final CustomerController controller = Get.put(CustomerController());
  final List<String> imageList = List.filled(5, '');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          status == 'Pending' ? 'Pending Customer' : 'Complete Customer List',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Customer Name',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Text(
              'Township',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Text(
              'Assigned Date',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<CustomerController>(
              init: CustomerController(),
              builder: (controller) => Expanded(
                  child: SearchTextFieldComponent(
                controller: controller.customerNameTextController,
                icon: Icons.search,
              )),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: SearchTextFieldComponent(
                    controller: controller.customerTownshipController, icon: Icons.search)),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: InkWell(
                  onTap: (){
                    controller.selectDate(context);
                  },
                  child: SearchTextFieldComponent(
                      controller: controller.customerDateController, icon: Icons.search,onPress: (){
                        },),
                )),
          ],
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              return CustomerStatusListItems();
            },
            itemCount: imageList.length,
          ),
        )
      ],
    );
  }
}
