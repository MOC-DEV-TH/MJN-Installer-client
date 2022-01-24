import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/search_text_field_component.dart';
import 'package:flutter_geolocator_example/controllers/customer_controller.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'customer_status_list_items.dart';
import 'package:get/get.dart';

class BuildSearchTextField extends StatefulWidget {
  final String status;
  final String flowStatus;

  BuildSearchTextField(this.status, this.flowStatus);

  @override
  State<BuildSearchTextField> createState() => _BuildSearchTextFieldState();
}

class _BuildSearchTextFieldState extends State<BuildSearchTextField> {
  final CustomerController controller = Get.put(CustomerController());

  @override
  void initState() {
    debugPrint("FlowStatus${widget.flowStatus}");
    widget.flowStatus == INSTALLATION
        ? controller.fetchInstallationPendingCustomer()
        : controller.fetchServiceTicketPendingCustomer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    widget.flowStatus == INSTALLATION
        ? controller.fetchInstallationPendingCustomer()
        : controller.fetchServiceTicketPendingCustomer();
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          widget.status == 'Pending'
              ? 'Pending Customer'
              : 'Complete Customer List',
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
              builder: (controller) =>
                  Expanded(
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
                    controller: controller.customerTownshipController,
                    icon: Icons.search)),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: InkWell(
                  onTap: () {
                    controller.selectDate(context);
                  },
                  child: SearchTextFieldComponent(
                    controller: controller.customerDateController,
                    icon: Icons.search,
                    onPress: () {},
                  ),
                )),
          ],
        ),
        Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator(),);
          }
          else
            return Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) {
                  return controller.getArgumentData() == INSTALLATION
                      ? CustomerStatusListItems(
                    controller.installationPendingCustomerList[index]
                        .firstname,
                    controller.installationPendingCustomerList[index]
                        .address,
                    controller.installationPendingCustomerList[index]
                        .phone1,
                    controller.installationPendingCustomerList[index]
                        .profileId,
                    INSTALLATION
                  )
                      : CustomerStatusListItems(
                    controller.serviceTicketPendingCustomerList[index]
                        .userName,
                    controller.serviceTicketPendingCustomerList[index]
                        .township,
                    controller.serviceTicketPendingCustomerList[index]
                        .phone1,
                    controller.serviceTicketPendingCustomerList[index]
                        .ticketId,
                      SERVICE_TICKET
                  );
                },
                itemCount: controller.getArgumentData() == INSTALLATION
                    ? controller.installationPendingCustomerList.length
                    : controller.serviceTicketPendingCustomerList.length,
              ),
            );
        })
      ],
    );
  }
}
