import 'package:flutter/material.dart';
import 'package:mjn_installer_app/components/search_text_field_component.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/controllers/page_argument_controller.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'customer_status_list_items.dart';
import 'package:get/get.dart';

class BuildCompleteCustomerList extends StatefulWidget {
  @override
  State<BuildCompleteCustomerList> createState() =>
      _BuildCompleteCustomerListState();
}

class _BuildCompleteCustomerListState
    extends State<BuildCompleteCustomerList> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      PageArgumentController.to.getArgumentData() == INSTALLATION
          ? HomeController.to
          .fetchInstallationCompleteCustomer('completed', context)
          : HomeController.to
          .fetchServiceTicketCompleteCustomer('completed', context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return
    Obx((){
      if(HomeController.to.isLoading.value){
        return Center(child: CircularProgressIndicator(),);
      }
      else
        return
          Column(
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
                  Expanded(
                    child: SearchTextFieldComponent(
                      controller: HomeController.to.customerNameTextController,
                      icon: Icons.search,
                      onPressIcon: () {
                        PageArgumentController.to.getArgumentData() == SERVICE_TICKET
                            ? HomeController.to.fetchServiceTicketListsByStatus(
                            'completed',
                            context,
                            USERNAME_PARAM +
                                HomeController
                                    .to.customerTownshipController.value.text)
                            : HomeController.to.fetchInstallationListsByStatus(
                            'completed',
                            context,
                            USERNAME_PARAM +
                                HomeController
                                    .to.customerTownshipController.value.text);
                      },
                    ),
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
                              'completed',
                              context,
                              TOWNSHIP_PARAM +
                                  HomeController
                                      .to.customerTownshipController.value.text)
                              : HomeController.to.fetchInstallationListsByStatus(
                              'completed',
                              context,
                              TOWNSHIP_PARAM +
                                  HomeController
                                      .to.customerTownshipController.value.text);
                        },
                      )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          HomeController.to.selectDate(context);
                        },
                        child: SearchTextFieldComponent(
                          onTap: () {
                            FocusScope.of(context).requestFocus(new FocusNode());
                            HomeController.to..selectDate(context);
                          },
                          controller: HomeController.to.customerDateController,
                          icon: Icons.search,
                          onPressIcon: () {
                            PageArgumentController.to.getArgumentData() == SERVICE_TICKET
                                ? HomeController.to.fetchServiceTicketListsByStatus(
                                'completed',
                                context,
                                ASSIGNED_DATE_PARAM +
                                    HomeController
                                        .to.customerDateController.value.text)
                                : HomeController.to.fetchInstallationListsByStatus(
                                'completed',
                                context,
                                ASSIGNED_DATE_PARAM +
                                    HomeController
                                        .to.customerDateController.value.text);
                          },
                        ),
                      )),
                ],
              ),
              Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, index) {
                        return PageArgumentController.to.getArgumentData() ==
                            INSTALLATION
                            ? CustomerStatusListItems(
                          HomeController
                              .to
                              .installationCompleteCustomerList[index]
                              .firstname,
                          HomeController.to
                              .installationCompleteCustomerList[index].township,
                          HomeController.to
                              .installationCompleteCustomerList[index].phone1,
                          HomeController
                              .to
                              .installationCompleteCustomerList[index]
                              .profileId,
                          pageStatus: 'complete',
                        )
                            : CustomerStatusListItems(
                          HomeController
                              .to
                              .serviceTicketCompleteCustomerList[index]
                              .firstname,
                          HomeController
                              .to
                              .serviceTicketCompleteCustomerList[index]
                              .township,
                          HomeController.to
                              .serviceTicketCompleteCustomerList[index].phone1,
                          HomeController
                              .to
                              .serviceTicketCompleteCustomerList[index]
                              .profileId,
                          ticketId: HomeController
                              .to
                              .serviceTicketCompleteCustomerList[index]
                              .ticketId,
                          pageStatus: 'complete',
                        );
                      },
                      itemCount: PageArgumentController.to.getArgumentData() ==
                          INSTALLATION
                          ? HomeController.to.installationCompleteCustomerList.length
                          : HomeController
                          .to.serviceTicketCompleteCustomerList.length,
                    ),
                  )
            ],
          );
    });

  }
}
