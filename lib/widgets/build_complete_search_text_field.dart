import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/components/search_text_field_component.dart';
import 'package:flutter_geolocator_example/controllers/home_controller.dart';
import 'package:flutter_geolocator_example/controllers/page_argument_controller.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'customer_status_list_items.dart';
import 'package:get/get.dart';

class BuildCompleteSearchTextField extends StatefulWidget {
  @override
  State<BuildCompleteSearchTextField> createState() =>
      _BuildCompleteSearchTextFieldState();
}

class _BuildCompleteSearchTextFieldState
    extends State<BuildCompleteSearchTextField> {


  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      PageArgumentController.to.getArgumentData() == INSTALLATION
          ? HomeController.to.fetchInstallationCompleteCustomer('complete', context)
          : HomeController.to.fetchServiceTicketCompleteCustomer('complete', context);
    });

    super.initState();
  }

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
          'Complete Customer List',
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
              init: HomeController(),
              builder: (controller) => Expanded(
                  child: SearchTextFieldComponent(
                controller: controller.customerNameTextController,
                icon: Icons.search,
                    onPressIcon: (){
                      PageArgumentController.to.getArgumentData() == SERVICE_TICKET ?
                      controller.fetchServiceTicketListsByStatus(
                          'complete',
                          context,
                          USERNAME_PARAM +
                              controller.customerTownshipController.value.text)
                          :
                      controller.fetchInstallationListsByStatus(
                          'complete',
                          context,
                          USERNAME_PARAM +
                              controller.customerTownshipController.value.text);
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
                onPressIcon: (){
                  PageArgumentController.to.getArgumentData() == SERVICE_TICKET ?
                  HomeController.to.fetchServiceTicketListsByStatus(
                      'complete',
                      context,
                      TOWNSHIP_PARAM +
                          HomeController.to.customerTownshipController.value.text)
                      :
                  HomeController.to.fetchInstallationListsByStatus(
                      'complete',
                      context,
                      TOWNSHIP_PARAM +
                          HomeController.to.customerTownshipController.value.text);
                },)),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                HomeController.to.selectDate(context);
              },
              child: SearchTextFieldComponent(
                onTap: (){
                    FocusScope.of(context).requestFocus(new FocusNode());
                    HomeController.to..selectDate(context);
                },
                controller: HomeController.to.customerDateController,
                icon: Icons.search,
                onPressIcon: () {
                  PageArgumentController.to.getArgumentData() == SERVICE_TICKET ?
                  HomeController.to.fetchServiceTicketListsByStatus(
                      'complete',
                      context,
                      ASSIGNED_DATE_PARAM +
                          HomeController.to.customerDateController.value.text)
                      :
                  HomeController.to.fetchInstallationListsByStatus(
                      'complete',
                      context,
                      ASSIGNED_DATE_PARAM +
                          HomeController.to.customerDateController.value.text);
                },
              ),
            )),
          ],
        ),
        Obx(() {
          if (HomeController.to.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) {
                  return PageArgumentController.to.getArgumentData() ==
                          INSTALLATION
                      ? CustomerStatusListItems(
                    HomeController.to.installationCompleteCustomerList[index]
                              .firstname,
                    HomeController.to
                              .installationCompleteCustomerList[index].township,
                    HomeController.to
                              .installationCompleteCustomerList[index].phone1,
                    HomeController.to.installationCompleteCustomerList[index]
                              .profileId,
                          pageStatus: 'complete',
                        )
                      : CustomerStatusListItems(
                    HomeController.to.serviceTicketCompleteCustomerList[index]
                              .firstname,
                    HomeController.to.serviceTicketCompleteCustomerList[index]
                              .township,
                    HomeController.to
                              .serviceTicketCompleteCustomerList[index].phone1,
                    HomeController.to.serviceTicketCompleteCustomerList[index]
                              .ticketId,
                          pageStatus: 'complete',
                        );
                },
                itemCount:
                    PageArgumentController.to.getArgumentData() == INSTALLATION
                        ? HomeController.to.installationCompleteCustomerList.length
                        : HomeController.to.serviceTicketCompleteCustomerList.length,
              ),
            );
        })
      ],
    );
  }
}
