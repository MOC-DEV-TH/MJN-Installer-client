import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mjn_installer_app/components/drop_down_button_component.dart';
import 'package:mjn_installer_app/components/search_text_field_component.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/controllers/login_controller.dart';
import 'package:mjn_installer_app/controllers/page_argument_controller.dart';
import 'package:mjn_installer_app/models/allDropDownListVO.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:mjn_installer_app/utils/eventbus_util.dart';
import 'customer_status_list_items.dart';
import 'package:get/get.dart';

class BuildPendingAndNewOrderCustomerList extends StatefulWidget {
  @override
  State<BuildPendingAndNewOrderCustomerList> createState() =>
      _BuildPendingAndNewOrderCustomerListState();
}

class _BuildPendingAndNewOrderCustomerListState
    extends State<BuildPendingAndNewOrderCustomerList> with WidgetsBindingObserver {

  List<TownshipDatum>? townshipLists;
  var customerStatusTitle = ''.obs;
  late StreamSubscription titleSub;


  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    firstTimeFetchDataFromNetwork();
    super.initState();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    debugPrint(state.toString());
    if(state == AppLifecycleState.resumed){
      print('onResume');
    }

  }

  @override
  void didChangeDependencies() {
    print('onResumeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    titleSub = EventBusUtils.getInstance().on().listen((event) {
      if (event.toString() == PENDING){
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          if(this.mounted){
            setState(() {
              PageArgumentController.to.updateStatusTitle(PENDING);
            });
          }

        });
      }
      else {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          if(this.mounted){
            setState(() {
              PageArgumentController.to.updateStatusTitle(NEW_ORDER);
            });
          }

        });
      }

    });

    debugPrint('Status Title ${PageArgumentController.to.getStatusTitle()}');
    townshipLists =
        LoginController.to.maintenanceDropDownListsData.details!.townshipData;
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
                 PageArgumentController.to.getStatusTitle() == NEW_ORDER
                 ? 'New Order Customer List' : 'Pending Customer List',
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

                        onTextDataChange: (String value){
                          if(value == ''){
                            debugPrint('Empty text');
                            firstTimeFetchDataFromNetwork();
                          }
                        },
                    controller: controller.customerNameTextController,
                    icon: Icons.search,
                    onPressIcon: () {
                      PageArgumentController.to.getArgumentData() ==
                              SERVICE_TICKET
                          ? controller.fetchServiceTicketListsByStatus(
                              'pending',
                              context,
                              USERNAME_PARAM +
                                  controller
                                      .customerNameTextController.value.text)
                          : controller.fetchInstallationListsByStatus(
                              'pending',
                              context,
                              USERNAME_PARAM +
                                  controller
                                      .customerNameTextController.value.text);
                    },
                  )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 38,
                  width: 115,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  margin: EdgeInsets.only(bottom: 24),
                  child: DropDownButtonComponent(
                    itemsList: townshipLists,
                    onChangedData: (TownshipDatum value) {
                      debugPrint('DropdownValue${value.key}');

                      PageArgumentController.to.getArgumentData() ==
                          SERVICE_TICKET
                          ? HomeController.to.fetchServiceTicketListsByStatus(
                          'pending',
                          context,
                          TOWNSHIP_PARAM +
                              value.id.toString())
                          : HomeController.to.fetchInstallationListsByStatus(
                          'pending',
                          context,
                          TOWNSHIP_PARAM +
                              value.id.toString());

                    },
                    hintText: '--Select Township--',
                  ),
                ),


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
                    PageArgumentController.to.getArgumentData() ==
                            SERVICE_TICKET
                        ? HomeController.to.fetchServiceTicketListsByStatus(
                            'pending',
                            context,
                            ASSIGNED_DATE_PARAM +
                                HomeController
                                    .to.customerDateController.value.text)
                        : HomeController.to.fetchInstallationListsByStatus(
                            'pending',
                            context,
                            ASSIGNED_DATE_PARAM +
                                HomeController
                                    .to.customerDateController.value.text);
                  },
                )),
              ],
            ),
            Obx((){
              if (HomeController.to.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else
                return
                GetBuilder<HomeController>(
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
                          customerUID: controller
                              .installationPendingCustomerList[index]
                              .uid,
                          status: controller
                              .installationPendingCustomerList[index]
                              .status,
                          installationDetail: controller.installationPendingCustomerList[index],
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
                              .profileId,
                          ticketId: controller
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
                          status: controller
                              .serviceTicketPendingCustomerList[index]
                              .status,

                          serviceTicketDetail: controller
                              .serviceTicketPendingCustomerList[index],
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


  void firstTimeFetchDataFromNetwork(){

    Future.delayed(Duration.zero, () {
      if(this.mounted){
        if (PageArgumentController.to.getArgumentData() == INSTALLATION) {

          if (PageArgumentController.to.getStatus() == NEW_ORDER) {

            HomeController.to
                .fetchInstallationPendingCustomer('newOrder', context);
          } else if (PageArgumentController.to.getStatus() == PENDING) {

            HomeController.to
                .fetchInstallationPendingCustomer('pending', context);
          }

        } else if (PageArgumentController.to.getArgumentData() ==
            SERVICE_TICKET) {

          if (PageArgumentController.to.getStatus() == NEW_ORDER) {


            HomeController.to
                .fetchServiceTicketPendingCustomer('newOrder', context);
          } else if (PageArgumentController.to.getStatus() == PENDING) {

            HomeController.to
                .fetchServiceTicketPendingCustomer('pending', context);

          }
        }
      }
    });
  }


}
