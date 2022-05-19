import 'dart:convert';

DevicePickupDetailVo devicePickupDetailVoFromJson(String str) => DevicePickupDetailVo.fromJson(json.decode(str));

String devicePickupDetailVoToJson(DevicePickupDetailVo data) => json.encode(data.toJson());

class DevicePickupDetailVo {
  DevicePickupDetailVo({
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
  Details? details;

  factory DevicePickupDetailVo.fromJson(Map<String, dynamic> json) => DevicePickupDetailVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    details: Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "details": details!.toJson(),
  };
}

class Details {
  Details({
    this.terminationStatus,
    this.ticketId,
    this.cid,
    this.address,
    this.plan,
    this.package,
    this.firstname,
    this.phone1,
  });

  String? terminationStatus;
  String? ticketId;
  String? cid;
  String? address;
  String? plan;
  String? package;
  String? firstname;
  String? phone1;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    terminationStatus: json["termination_status"],
    ticketId: json["ticket_id"],
    cid: json["cid"],
    address: json["address"],
    plan: json["plan"],
    package: json["package"],
    firstname: json["firstname"],
    phone1: json["phone_1"],
  );

  Map<String, dynamic> toJson() => {
    "termination_status": terminationStatus,
    "ticket_id": ticketId,
    "cid": cid,
    "address": address,
    "plan": plan,
    "package": package,
    "firstname": firstname,
    "phone_1": phone1,
  };
}
