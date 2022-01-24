import 'dart:convert';

ServiceTicketDetailVO installationDetailVoFromJson(String str) => ServiceTicketDetailVO.fromJson(json.decode(str));

String installationDetailVoToJson(ServiceTicketDetailVO data) => json.encode(data.toJson());

class ServiceTicketDetailVO {
  ServiceTicketDetailVO({
    this.status,
    this.responseCode,
    this.description,
    this.isRequieredUpdate,
    this.isforceUpdate,
    this.updatedStatus,
    this.details,
  });

  String? status;
  String? responseCode;
  String? description;
  bool? isRequieredUpdate;
  bool? isforceUpdate;
  String? updatedStatus;
  ServiceTicketDetails? details;

  factory ServiceTicketDetailVO.fromJson(Map<String, dynamic> json) => ServiceTicketDetailVO(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    updatedStatus: json["updated_status"],
    details: ServiceTicketDetails.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "updated_status": updatedStatus,
    "details": details!.toJson(),
  };
}

class ServiceTicketDetails {
  ServiceTicketDetails({
    this.firstname,
    this.phone1,
    this.subconAssignedDate,
    this.latitude,
    this.longitude,
    this.address,
    this.type,
    this.uid,
  });

  String? firstname;
  String? phone1;
  String? subconAssignedDate;
  String? latitude;
  String? longitude;
  String? address;
  String? type;
  String? uid;

  factory ServiceTicketDetails.fromJson(Map<String, dynamic> json) => ServiceTicketDetails(
    firstname: json["firstname"],
    phone1: json["phone_1"],
    subconAssignedDate: json["subcon_assigned_date"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    address: json["address"],
    type: json["type"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "phone_1": phone1,
    "subcon_assigned_date": subconAssignedDate,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "type": type,
    "uid": uid,
  };
}
