import 'dart:convert';

InstallationVo installationVoFromJson(String str) => InstallationVo.fromJson(json.decode(str));

String installationVoToJson(InstallationVo data) => json.encode(data.toJson());

class InstallationVo {
  InstallationVo({
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
  List<InstallationDetail>? details;

  factory InstallationVo.fromJson(Map<String, dynamic> json) => InstallationVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    updatedStatus: json["updated_status"],
    details: List<InstallationDetail>.from(json["details"]?.map((x) => InstallationDetail.fromJson(x)) ?? []),
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

class InstallationDetail {
  InstallationDetail({
    this.subconAssignedDate,
    this.latitude,
    this.longitude,
    this.address,
    this.profileId,
    this.firstname,
    this.phone1,
  });

  String? subconAssignedDate;
  String? latitude;
  String? longitude;
  String? address;
  String? profileId;
  String? firstname;
  String? phone1;

  factory InstallationDetail.fromJson(Map<String, dynamic> json) => InstallationDetail(
    subconAssignedDate: json["subcon_assigned_date"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    address: json["address"],
    profileId: json["profile_id"],
    firstname: json["firstname"],
    phone1: json["phone_1"],
  );

  Map<String, dynamic> toJson() => {
    "subcon_assigned_date": subconAssignedDate,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "profile_id": profileId,
    "firstname": firstname,
    "phone_1": phone1,
  };
}