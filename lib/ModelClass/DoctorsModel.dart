class AllDoctors {
  int? providerId;
  String? encryptedProviderId;
  int? specializationId;
  int? accountId;
  int? providerLocationId;
  String? providerName;
  int? experience;
  String? gender;
  String? practiceName;
  String? specializations;
  String? services;
  String? location;
  String? consultationDuration;
  String? consultationCharges;
  String? telemedicineDuration;
  String? telemedicineCharges;
  String? currencySymbol;
  String? thumbnailUrl;
  String? profileImageUrl;
  String? availableDays;
  String? availability;
  String? languages;
  int? totalItems;
  bool? loading;
  String? chargeType;
  int? locationId;
  String? isTelemedicine;
  String? isOnlineConsultation;
  int? consultationTypeId;
  String? providerAvailabilityId;
  String? startDate;
  String? endDate;
  dynamic availableDay;
  String? startTime;
  String? endTime;
  String? freeFollowUpDays;
  String? freeFollowUpDaysLimit;
  int? departmentId;
  String? consultationName;
  bool? isOnline;

  AllDoctors(
      {this.providerId,
        this.encryptedProviderId,
        this.specializationId,
        this.accountId,
        this.providerLocationId,
        this.providerName,
        this.experience,
        this.gender,
        this.practiceName,
        this.specializations,
        this.services,
        this.location,
        this.consultationDuration,
        this.consultationCharges,
        this.telemedicineDuration,
        this.telemedicineCharges,
        this.currencySymbol,
        this.thumbnailUrl,
        this.profileImageUrl,
        this.availableDays,
        this.availability,
        this.languages,
        this.totalItems,
        this.loading,
        this.chargeType,
        this.locationId,
        this.isTelemedicine,
        this.isOnlineConsultation,
        this.consultationTypeId,
        this.providerAvailabilityId,
        this.startDate,
        this.endDate,
        this.availableDay,
        this.startTime,
        this.endTime,
        this.freeFollowUpDays,
        this.freeFollowUpDaysLimit,
        this.departmentId,
        this.consultationName,
        this.isOnline});

  AllDoctors.fromJson(Map<String, dynamic> json) {
    providerId = json['providerId'];
    encryptedProviderId = json['encryptedProviderId'];
    specializationId = json['specializationId'];
    accountId = json['accountId'];
    providerLocationId = json['providerLocationId'];
    providerName = json['providerName'];
    experience = json['experience'];
    gender = json['gender'];
    practiceName = json['practiceName'];
    specializations = json['specializations'];
    services = json['services'];
    location = json['location'];
    consultationDuration = json['consultationDuration'];
    consultationCharges = json['consultationCharges'];
    telemedicineDuration = json['telemedicineDuration'];
    telemedicineCharges = json['telemedicineCharges'];
    currencySymbol = json['currencySymbol'];
    thumbnailUrl = json['thumbnailUrl'];
    profileImageUrl = json['profileImageUrl'];
    availableDays = json['availableDays'];
    availability = json['availability'];
    languages = json['languages'];
    totalItems = json['totalItems'];
    loading = json['loading'];
    chargeType = json['chargeType'];
    locationId = json['locationId'];
    isTelemedicine = json['isTelemedicine'];
    isOnlineConsultation = json['isOnlineConsultation'];
    consultationTypeId = json['consultationTypeId'];
    providerAvailabilityId = json['providerAvailabilityId'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    availableDay = json['availableDay'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    freeFollowUpDays = json['freeFollowUpDays'];
    freeFollowUpDaysLimit = json['freeFollowUpDaysLimit'];
    departmentId = json['departmentId'];
    consultationName = json['consultationName'];
    isOnline = json['isOnline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['providerId'] = this.providerId;
    data['encryptedProviderId'] = this.encryptedProviderId;
    data['specializationId'] = this.specializationId;
    data['accountId'] = this.accountId;
    data['providerLocationId'] = this.providerLocationId;
    data['providerName'] = this.providerName;
    data['experience'] = this.experience;
    data['gender'] = this.gender;
    data['practiceName'] = this.practiceName;
    data['specializations'] = this.specializations;
    data['services'] = this.services;
    data['location'] = this.location;
    data['consultationDuration'] = this.consultationDuration;
    data['consultationCharges'] = this.consultationCharges;
    data['telemedicineDuration'] = this.telemedicineDuration;
    data['telemedicineCharges'] = this.telemedicineCharges;
    data['currencySymbol'] = this.currencySymbol;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['profileImageUrl'] = this.profileImageUrl;
    data['availableDays'] = this.availableDays;
    data['availability'] = this.availability;
    data['languages'] = this.languages;
    data['totalItems'] = this.totalItems;
    data['loading'] = this.loading;
    data['chargeType'] = this.chargeType;
    data['locationId'] = this.locationId;
    data['isTelemedicine'] = this.isTelemedicine;
    data['isOnlineConsultation'] = this.isOnlineConsultation;
    data['consultationTypeId'] = this.consultationTypeId;
    data['providerAvailabilityId'] = this.providerAvailabilityId;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['availableDay'] = this.availableDay;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['freeFollowUpDays'] = this.freeFollowUpDays;
    data['freeFollowUpDaysLimit'] = this.freeFollowUpDaysLimit;
    data['departmentId'] = this.departmentId;
    data['consultationName'] = this.consultationName;
    data['isOnline'] = this.isOnline;
    return data;
  }
}
