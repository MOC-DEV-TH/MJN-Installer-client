import 'package:flutter/material.dart';
import 'package:mjn_installer_app/components/label_text_component.dart';
import 'package:mjn_installer_app/controllers/home_controller.dart';
import 'package:mjn_installer_app/controllers/login_controller.dart';
import 'package:mjn_installer_app/controllers/page_argument_controller.dart';
import 'package:mjn_installer_app/models/allDropDownListVO.dart';
import 'package:mjn_installer_app/models/devicePickupVO.dart';
import 'package:mjn_installer_app/models/installationVO.dart';
import 'package:mjn_installer_app/models/serviceTicketVO.dart';
import 'package:mjn_installer_app/utils/app_constants.dart';
import 'package:get/get.dart';

class TicketListItem extends StatelessWidget {
  final String? customerName;
  final String? customerAddress;
  final String? customerPhNo;
  final String? profileId;
  final String? ticketId;
  final String? pageStatus;
  final String? township;
  final String? customerUID;
  final String? status;
  final String? status_txt;

  InstallationDetail? installationDetail;
  ServiceTicketDetail? serviceTicketDetail;
  DevicePickupDetail? devicePickupDetail;
  List<TownshipDatum>? townshipLists;
  var townshipName = "".obs;

  TicketListItem(this.customerName, this.customerAddress,
      this.customerPhNo, this.profileId,
      {@required this.installationDetail,
        @required this.serviceTicketDetail,
        @required this.devicePickupDetail,
        @required this.pageStatus,
        @required this.township,
        @required this.ticketId,
        @required this.customerUID,
        @required this.status_txt,
        @required this.status});

  @override
  Widget build(BuildContext context) {
    debugPrint(status);
    debugPrint(customerAddress);
    townshipLists =
        LoginController.to.maintenanceDropDownListsData.details!.townshipData;

    for (var i in townshipLists!) {
      //debugPrint("${i.id} ${i.name}");
      if (i.id.toString() == customerAddress) {
        townshipName.value = i.name!;
      }
    }
    return Container(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
          children: [
          Flexible(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelTextComponent(
                            textAlign: TextAlign.left,
                            text: 'Customer Name',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 1,
                        child: LabelTextComponent(
                            textAlign: TextAlign.center,
                            text: '-',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                      flex: 2,
                      child: LabelTextComponent(
                          text: customerName!,
                          color: Colors.black,
                          padding: 0.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelTextComponent(
                            textAlign: TextAlign.left,
                            text: 'Customer Ph No',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 1,
                        child: LabelTextComponent(
                            textAlign: TextAlign.center,
                            text: '-',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                      flex: 2,
                      child: LabelTextComponent(
                          text: customerPhNo!,
                          color: Colors.black,
                          padding: 0.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelTextComponent(
                            textAlign: TextAlign.left,
                            text: 'Township',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 1,
                        child: LabelTextComponent(
                            textAlign: TextAlign.center,
                            text: '-',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                      flex: 2,
                      child: Obx(() {
                        return LabelTextComponent(
                            text :townshipName.value,
                            color: Colors.black,
                            padding: 0.0);
                      }),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelTextComponent(
                            textAlign: TextAlign.left,
                            text: 'Status',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 1,
                        child: LabelTextComponent(
                            textAlign: TextAlign.center,
                            text: '-',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                      flex: 2,
                      child: LabelTextComponent(
                          text: status_txt!,
                          color: Colors.black,
                          padding: 0.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelTextComponent(
                            textAlign: TextAlign.left,
                            text: 'Lat',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 1,
                        child: LabelTextComponent(
                            textAlign: TextAlign.center,
                            text: '-',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 2,
                        child: PageArgumentController.to.getArgumentData() !=
                            DEVICE_PICKUP ?  LabelTextComponent(
                            text: PageArgumentController.to.getArgumentData() ==
                                SERVICE_TICKET ? (serviceTicketDetail!.lat.toString() )
                                : (PageArgumentController.to.getArgumentData() ==
                                INSTALLATION || PageArgumentController.to
                                .getArgumentData() == RELOCATION_JOBS)
                                ? installationDetail!.lat.toString() : "" ,
                            color: Colors.black,
                            padding: 0.0) : SizedBox())
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelTextComponent(
                            textAlign: TextAlign.left,
                            text: 'Long',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 1,
                        child: LabelTextComponent(
                            textAlign: TextAlign.center,
                            text: '-',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 2,
                        child: PageArgumentController.to.getArgumentData() !=
                            DEVICE_PICKUP ?  LabelTextComponent(
                            text: PageArgumentController.to.getArgumentData() ==
                                SERVICE_TICKET ? (serviceTicketDetail!.long.toString() )
                                : (PageArgumentController.to.getArgumentData() ==
                                INSTALLATION || PageArgumentController.to
                                .getArgumentData() == RELOCATION_JOBS)
                                ? installationDetail!.long.toString() : "" ,
                            color: Colors.black,
                            padding: 0.0) : SizedBox())
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelTextComponent(
                            textAlign: TextAlign.left,
                            text: 'Detail Address',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 1,
                        child: LabelTextComponent(
                            textAlign: TextAlign.center,
                            text: '-',
                            color: Colors.black,
                            padding: 0.0)),
                    Expanded(
                        flex: 2,
                        child: PageArgumentController.to.getArgumentData() !=
                            DEVICE_PICKUP ?  LabelTextComponent(
                            text: PageArgumentController.to.getArgumentData() ==
                                SERVICE_TICKET ? (serviceTicketDetail!.detailAddress.toString()  )
                                : (PageArgumentController.to.getArgumentData() ==
                                INSTALLATION || PageArgumentController.to
                                .getArgumentData() == RELOCATION_JOBS)
                                ? installationDetail!.detailAddress.toString() : "" ,
                            color: Colors.black,
                            padding: 0.0) : SizedBox())
                  ],
                ),
              ],
            ),
          ),
            (PageArgumentController.to.getArgumentData() == DEVICE_PICKUP &&
                pageStatus == 'complete')
                ? Container()
                : verticalDivider,
            InkWell(
                onTap: () {
                  PageArgumentController.to.updateCustomerStatus(
                      status_txt!);

                  if (pageStatus == NEW_ORDER) {
                    HomeController.to.updateNewOrderData(
                        customerName ?? '',
                        customerAddress ?? '',
                        customerPhNo ?? '',
                        township ?? '',
                        ticketId ?? '',
                        profileId ?? '',
                        customerUID ?? '');
                  } else if (pageStatus == PENDING) {
                    if (PageArgumentController.to.getArgumentData() ==
                        INSTALLATION) {
                      HomeController.to.updateInstallationData(
                          installationDetail!.profileId!,
                          installationDetail!.plan!,
                          installationDetail!.uid!,
                          installationDetail!.phone1!);
                    } else
                    if (PageArgumentController.to.getArgumentData() ==
                        RELOCATION_JOBS) {
                      HomeController.to.updateInstallationData(
                          installationDetail!.profileId!,
                          installationDetail!.plan!,
                          installationDetail!.uid!,
                          installationDetail!.phone1!);
                    } else
                    if (PageArgumentController.to.getArgumentData() ==
                        SERVICE_TICKET) {
                      HomeController.to.updateServiceTicketData(
                          serviceTicketDetail!.ticketId!,
                          serviceTicketDetail!.profileId!,
                          serviceTicketDetail!.plan!,
                          serviceTicketDetail!.uid!,
                          serviceTicketDetail!.phone1!);
                    }
                  }

                  /**
                   * Go to complete customer detail page
                   */
                  pageStatus == 'complete'
                      ? Get.toNamed(COMPLETE_TICKET_DETAIL_PAGE,
                      arguments: PageArgumentController.to
                          .getArgumentData() ==
                          INSTALLATION
                          ? profileId
                          : PageArgumentController.to.getArgumentData() ==
                          RELOCATION_JOBS
                          ? profileId
                          : ticketId)
                  /**
                   * Go to New Order page
                   */
                      : pageStatus == NEW_ORDER
                      ? Get.toNamed(NEW_ORDER_CUSTOMER_PAGE)!.then((
                      value) =>
                      Future.delayed(Duration.zero, () {
                        /**
                         * Installation New Order
                         */
                        if (PageArgumentController.to
                            .getArgumentData() ==
                            INSTALLATION) {
                          if (PageArgumentController.to.getStatus() ==
                              NEW_ORDER) {
                            HomeController.to
                                .fetchInstallationPendingCustomer(
                                'newOrder', context);
                          } else if (PageArgumentController.to
                              .getStatus() ==
                              PENDING) {
                            HomeController.to
                                .fetchInstallationPendingCustomer(
                                'pending', context);
                          }
                        }
                        /**
                         * Relocation New Order
                         */
                        else if (PageArgumentController.to
                            .getArgumentData() ==
                            RELOCATION_JOBS) {
                          if (PageArgumentController.to.getStatus() ==
                              NEW_ORDER) {
                            HomeController.to
                                .fetchRelocationPendingCustomer(
                                'newOrder', '1', context);
                          } else if (PageArgumentController.to
                              .getStatus() ==
                              PENDING) {
                            HomeController.to
                                .fetchRelocationPendingCustomer(
                                'pending', '1', context);
                          }
                        }

                        /**
                         * Service Ticket New Order
                         */
                        else if (PageArgumentController.to
                            .getArgumentData() ==
                            SERVICE_TICKET) {
                          if (PageArgumentController.to.getStatus() ==
                              NEW_ORDER) {
                            HomeController.to
                                .fetchServiceTicketPendingCustomer(
                                'newOrder', context);
                          } else if (PageArgumentController.to
                              .getStatus() ==
                              PENDING) {
                            HomeController.to
                                .fetchServiceTicketPendingCustomer(
                                'pending', context);
                          }
                        }
                      }))
                  /**
                   * Go To Customer Detail Page and Customer Issue Page
                   */
                      : (PageArgumentController.to.getArgumentData() ==
                      INSTALLATION) ||
                      (PageArgumentController.to.getArgumentData() ==
                          RELOCATION_JOBS)
                      ? status == '2'
                      ? Get.toNamed(TICKET_DETAIL_PAGE,
                      arguments: profileId)
                      : status == '8'
                      ? Get.toNamed(TICKET_DETAIL_PAGE,
                      arguments: profileId)
                      : Get.offNamed(EDIT_TICKET_PAGE,
                      arguments: profileId)
                  /**
                   * Go to device pickup detail page
                   */
                      : PageArgumentController.to.getArgumentData() ==
                      DEVICE_PICKUP
                      ? Get.toNamed(DEVICE_PICKUP_DETAIL_PAGE, arguments: [
                    devicePickupDetail!.cid.toString(),
                    devicePickupDetail!.ticketId.toString()
                  ])

                  /**
                   * Service Ticket Flow
                   */
                      : status == '2'
                      ? Get.toNamed(TICKET_DETAIL_PAGE,
                      arguments: ticketId)
                      : status == '3'
                      ? Get.toNamed(
                      TICKET_DETAIL_PAGE, arguments: ticketId)
                      : Get.offNamed(
                      EDIT_TICKET_PAGE, arguments: ticketId);
                },
                child: (PageArgumentController.to.getArgumentData() ==
                    DEVICE_PICKUP &&
                    pageStatus == 'complete')
                    ? Container()
                    : Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: labelView,
                    ))
            ],

            ),
          ),
        ));
  }

  final customerInfoLabel = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Customer Name',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Customer Ph No.',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Township',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Status',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      PageArgumentController.to.getArgumentData() != DEVICE_PICKUP
          ? Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Lat',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      )
          : SizedBox(),
      PageArgumentController.to.getArgumentData() != DEVICE_PICKUP
          ? Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Long',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      )
          : SizedBox(),
      PageArgumentController.to.getArgumentData() != DEVICE_PICKUP
          ? Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          'Detail Address',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      )
          : SizedBox()
    ],
  );

  final middleLabel = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      PageArgumentController.to.getArgumentData() != DEVICE_PICKUP
          ? Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      )
          : SizedBox(),
      PageArgumentController.to.getArgumentData() != DEVICE_PICKUP
          ? Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      )
          : SizedBox(),
      PageArgumentController.to.getArgumentData() != DEVICE_PICKUP
          ? Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          '-',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      )
          : SizedBox(),
    ],
  );

  final verticalDivider = Container(
    height: 40,
    width: 1,
    color: Colors.grey,
  );

  final labelView = Text(
    'View',
    style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 13,
        color: Colors.lightBlueAccent,
        decoration: TextDecoration.underline),
  );
}
