// To parse this JSON data, do
//
//     final devicePickupVo = devicePickupVoFromJson(jsonString);

import 'dart:convert';

DevicePickupVo devicePickupVoFromJson(String str) => DevicePickupVo.fromJson(json.decode(str));

String devicePickupVoToJson(DevicePickupVo data) => json.encode(data.toJson());

class DevicePickupVo {
  DevicePickupVo({
    this.status,
    this.responseCode,
    this.description,
    this.isRequieredUpdate,
    this.isforceUpdate,
    this.details,
  });

  String? status;
  String? responseCode;
  String? description;
  bool? isRequieredUpdate;
  bool? isforceUpdate;
  List<DevicePickupDetail>? details;

  factory DevicePickupVo.fromJson(Map<String, dynamic> json) => DevicePickupVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    details: List<DevicePickupDetail>.from(
        json["details"]?.map((x) => DevicePickupDetail.fromJson(x)) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "details": List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class DevicePickupDetail {
  DevicePickupDetail({
    this.firstname,
    this.phone1,
    this.creationDate,
    this.cid,
    this.ticketId,
    this.terminationStatus,
    this.township,
  });

  String? firstname;
  String? phone1;
  String? creationDate;
  String? cid;
  String? ticketId;
  String? terminationStatus;
  dynamic township;

  factory DevicePickupDetail.fromJson(Map<String, dynamic> json) => DevicePickupDetail(
    firstname: json["firstname"],
    phone1: json["phone_1"],
    creationDate: json["creation_date"],
    cid: json["cid"],
    ticketId: json["ticket_id"],
    terminationStatus: json["termination_status"],
    township: json["township"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "phone_1": phone1,
    "creation_date": creationDate,
    "cid": cid,
    "ticket_id": ticketId,
    "termination_status": terminationStatus,
    "township": township,
  };
}
