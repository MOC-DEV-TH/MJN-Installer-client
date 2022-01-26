import 'dart:convert';

AllDropDownListVo allDropDownListVoFromJson(String str) => AllDropDownListVo.fromJson(json.decode(str));

String allDropDownListVoToJson(AllDropDownListVo data) => json.encode(data.toJson());

class AllDropDownListVo {
  AllDropDownListVo({
    this.status,
    this.responseCode,
    this.description,
    this.details,
  });

  String? status;
  String? responseCode;
  String? description;
  Details? details;

  factory AllDropDownListVo.fromJson(Map<String, dynamic> json) => AllDropDownListVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    details: Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "details": details!.toJson(),
  };
}

class Details {
  Details({
    this.installationStatus,
    this.issueData,
    this.serviceTicketData,
    this.technicalResolution,
    this.usageData,
  });

  List<InstallationStatus>? installationStatus;
  List<IssueDatum>? issueData;
  List<IssueDatum>? serviceTicketData;
  List<IssueDatum>? technicalResolution;
  List<IssueDatum>? usageData;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    installationStatus: List<InstallationStatus>.from(json["installation_status"].map((x) => InstallationStatus.fromJson(x))),
    issueData: List<IssueDatum>.from(json["issue_data"].map((x) => IssueDatum.fromJson(x))),
    serviceTicketData: List<IssueDatum>.from(json["service_ticket_data"].map((x) => IssueDatum.fromJson(x))),
    technicalResolution: List<IssueDatum>.from(json["technical_resolution"].map((x) => IssueDatum.fromJson(x))),
    usageData: List<IssueDatum>.from(json["usage_data"].map((x) => IssueDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "installation_status": List<dynamic>.from(installationStatus!.map((x) => x.toJson())),
    "issue_data": List<dynamic>.from(issueData!.map((x) => x.toJson())),
    "service_ticket_data": List<dynamic>.from(serviceTicketData!.map((x) => x.toJson())),
    "technical_resolution": List<dynamic>.from(technicalResolution!.map((x) => x.toJson())),
    "usage_data": List<dynamic>.from(usageData!.map((x) => x.toJson())),
  };
}

class InstallationStatus {
  InstallationStatus({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory InstallationStatus.fromJson(Map<String, dynamic> json) => InstallationStatus(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class IssueDatum {
  IssueDatum({
    this.id,
    this.name,
    this.key,
  });

  int? id;
  String? name;
  int? key;

  factory IssueDatum.fromJson(Map<String, dynamic> json) => IssueDatum(
    id: json["id"],
    name: json["name"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "key": key,
  };
}
