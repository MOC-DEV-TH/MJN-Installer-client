import 'dart:convert';

ServiceTicketVo serviceTicketVoFromJson(String str) => ServiceTicketVo.fromJson(json.decode(str));

String serviceTicketVoToJson(ServiceTicketVo data) => json.encode(data.toJson());

class ServiceTicketVo {
  ServiceTicketVo({
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
  List<ServiceTicketDetail>? details;

  factory ServiceTicketVo.fromJson(Map<String, dynamic> json) => ServiceTicketVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    updatedStatus: json["updated_status"],
    details: List<ServiceTicketDetail>.from(json["details"]?.map((x) => ServiceTicketDetail.fromJson(x)) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "updated_status": updatedStatus,
    "details": List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class ServiceTicketDetail {
  ServiceTicketDetail({
    this.firstname,
    this.township,
    this.ticketId,
    this.phone1,
    this.profileId,
    this.status
  });

  String? firstname;
  String? township;
  String? ticketId;
  String? phone1;
  String? profileId;
  String? status;

  factory ServiceTicketDetail.fromJson(Map<String, dynamic> json) => ServiceTicketDetail(
    firstname: json["firstname"],
    township: json["township"],
    ticketId: json["ticket_id"],
    phone1: json["phone_1"],
    profileId: json["profile_id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "user_name": firstname,
    "township": township,
    "ticket_id": ticketId,
    "phone_1": phone1,
    "profile_id": profileId,
    "status": status,
  };
}
