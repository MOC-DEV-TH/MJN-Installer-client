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
    this.userName,
    this.township,
    this.subconAssignedDate,
    this.ticketId,
    this.phone1,
  });

  String? userName;
  String? township;
  String? subconAssignedDate;
  String? ticketId;
  String? phone1;

  factory ServiceTicketDetail.fromJson(Map<String, dynamic> json) => ServiceTicketDetail(
    userName: json["user_name"],
    township: json["township"],
    subconAssignedDate: json["subcon_assigned_date"],
    ticketId: json["ticket_id"],
    phone1: json["phone_1"],
  );

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "township": township,
    "subcon_assigned_date": subconAssignedDate,
    "ticket_id": ticketId,
    "phone_1": phone1,
  };
}
