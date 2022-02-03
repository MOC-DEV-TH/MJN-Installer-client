import 'package:flutter/material.dart';
import 'package:mjn_installer_app/components/search_text_field_component.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/controllers/page_argument_controller.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'customer_status_list_items.dart';
import 'package:get/get.dart';

class BuildSearchTextField extends StatefulWidget {
  @override
  State<BuildSearchTextField> createState() => _BuildSearchTextFieldState();
}

class _BuildSearchTextFieldState extends State<BuildSearchTextField> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (PageArgumentController.to.getArgumentData() == INSTALLATION) {
        if (PageArgumentController.to.getStatus() == NEW_ORDER) {
          HomeController.to.fetchInstallationPendingCustomer('newOrder', context);
        } else if (PageArgumentController.to.getStatus() == PENDING) {
          HomeController.to.fetchInstallationPendingCustomer('pending', context);
        }
      } else if (PageArgumentController.to.getArgumentData() ==
          SERVICE_TICKET) {
        if (PageArgumentController.to.getStatus() == NEW_ORDER) {
          HomeController.to.fetchServiceTicketPendingCustomer('newOrder', context);
        } else if (PageArgumentController.to.getStatus() == PENDING) {
          HomeController.to.fetchServiceTicketPendingCustomer('pending', context);
        }
      }
    });
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
          PageArgumentController.to.getStatus() == NEW_ORDER
              ? 'New Order Customer List'
              : 'Pending Customer List',
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
            GetBuilder<HomeController>(
              builder: (controller) => Expanded(
                  child: SearchTextFieldComponent(
                controller: controller.customerNameTextController,
                icon: Icons.search,
                onPressIcon: () {
                  PageArgumentController.to.getArgumentData() == SERVICE_TICKET
                      ? controller.fetchServiceTicketListsByStatus(
                          'pending',
                          context,
                          USERNAME_PARAM +
                              controller.customerNameTextController.value.text)
                      : controller.fetchInstallationListsByStatus(
                          'pending',
                          context,
                          USERNAME_PARAM +
                              controller.customerNameTextController.value.text);
                },
              )),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: SearchTextFieldComponent(
              controller: HomeController.to.customerTownshipController,
              icon: Icons.search,
              onPressIcon: () {
                PageArgumentController.to.getArgumentData() == SERVICE_TICKET
                    ? HomeController.to.fetchServiceTicketListsByStatus(
                        'pending',
                        context,
                        TOWNSHIP_PARAM +
                            HomeController.to.customerTownshipController.value.text)
                    : HomeController.to.fetchInstallationListsByStatus(
                        'pending',
                        context,
                        TOWNSHIP_PARAM +
                            HomeController.to.customerTownshipController.value.text);
              },
            )),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: SearchTextFieldComponent(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                HomeController.to.selectDate(context);
              },
              controller: HomeController.to.customerDateController,
              icon: Icons.search,
              onPressIcon: () {
                PageArgumentController.to.getArgumentData() == SERVICE_TICKET
                    ? HomeController.to.fetchServiceTicketListsByStatus(
                        'pending',
                        context,
                        ASSIGNED_DATE_PARAM +
                            HomeController.to.customerDateController.value.text)
                    : HomeController.to.fetchInstallationListsByStatus(
                        'pending',
                        context,
                        ASSIGNED_DATE_PARAM +
                            HomeController.to.customerDateController.value.text);
              },
            )),
          ],
        ),
        Obx(() {
          if (HomeController.to.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return GetBuilder<HomeController>(
                builder: (controller) => Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (ctx, index) {
                          return controller.getArgumentData() == INSTALLATION
                              ? CustomerStatusListItems(
                                  controller
                                      .installationPendingCustomerList[index]
                                      .firstname,
                                  controller
                                      .installationPendingCustomerList[index]
                                      .township,
                                  controller
                                      .installationPendingCustomerList[index]
                                      .phone1,
                                  controller
                                      .installationPendingCustomerList[index]
                                      .profileId,
                                  pageStatus:
                                      PageArgumentController.to.getStatus() ==
                                              NEW_ORDER
                                          ? NEW_ORDER
                                          : PENDING,
                                  township: controller
                                      .installationPendingCustomerList[index]
                                      .township,
                                )
                              : CustomerStatusListItems(
                                  controller
                                      .serviceTicketPendingCustomerList[index]
                                      .firstname,
                                  controller
                                      .serviceTicketPendingCustomerList[index]
                                      .township,
                                  controller
                                      .serviceTicketPendingCustomerList[index]
                                      .phone1,
                                  controller
                                      .serviceTicketPendingCustomerList[index]
                                      .ticketId,
                                  pageStatus:
                                      PageArgumentController.to.getStatus() ==
                                              NEW_ORDER
                                          ? NEW_ORDER
                                          : PENDING,
                                  township: controller
                                      .serviceTicketPendingCustomerList[index]
                                      .township,
                                );
                        },
                        itemCount: controller.getArgumentData() == INSTALLATION
                            ? controller.installationPendingCustomerList.length
                            : controller
                                .serviceTicketPendingCustomerList.length,
                      ),
                    ));
        })
      ],
    );
  }
}
