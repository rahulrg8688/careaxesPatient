class SearchedDoctorsModel {
  int? providerId;
  int? specializationId;
  int? departmentId;
  String? fullName;
  String? specializationName;
  Null? filter;
  int? locationId;
  Null? providerLocationId;
  int? providerAvailabilityId;
  Null? sessionId;
  String? departmentName;
  int? consultationTypeId;
  Null? appointmentDate;
  String? providerSpecializationId;
  String? doctorType;
  Null? consultationName;
  Null? mobile;

  SearchedDoctorsModel(
      {this.providerId,
        this.specializationId,
        this.departmentId,
        this.fullName,
        this.specializationName,
        this.filter,
        this.locationId,
        this.providerLocationId,
        this.providerAvailabilityId,
        this.sessionId,
        this.departmentName,
        this.consultationTypeId,
        this.appointmentDate,
        this.providerSpecializationId,
        this.doctorType,
        this.consultationName,
        this.mobile});

  SearchedDoctorsModel.fromJson(Map<String, dynamic> json) {
    providerId = json['providerId'];
    specializationId = json['specializationId'];
    departmentId = json['departmentId'];
    fullName = json['fullName'];
    specializationName = json['specializationName'];
    filter = json['filter'];
    locationId = json['locationId'];
    providerLocationId = json['providerLocationId'];
    providerAvailabilityId = json['providerAvailabilityId'];
    sessionId = json['sessionId'];
    departmentName = json['departmentName'];
    consultationTypeId = json['consultationTypeId'];
    appointmentDate = json['appointmentDate'];
    providerSpecializationId = json['providerSpecializationId'];
    doctorType = json['doctorType'];
    consultationName = json['consultationName'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['providerId'] = this.providerId;
    data['specializationId'] = this.specializationId;
    data['departmentId'] = this.departmentId;
    data['fullName'] = this.fullName;
    data['specializationName'] = this.specializationName;
    data['filter'] = this.filter;
    data['locationId'] = this.locationId;
    data['providerLocationId'] = this.providerLocationId;
    data['providerAvailabilityId'] = this.providerAvailabilityId;
    data['sessionId'] = this.sessionId;
    data['departmentName'] = this.departmentName;
    data['consultationTypeId'] = this.consultationTypeId;
    data['appointmentDate'] = this.appointmentDate;
    data['providerSpecializationId'] = this.providerSpecializationId;
    data['doctorType'] = this.doctorType;
    data['consultationName'] = this.consultationName;
    data['mobile'] = this.mobile;
    return data;
  }
}
