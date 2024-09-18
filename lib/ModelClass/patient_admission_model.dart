class PatientAdmissionModel {
  String? counsellingId;
  int? admissionId;
  String? encryptedAdmissionId;
  String? floorName;
  String? dischargeId;
  String? admissionNo;
  String? admissionDate;
  String? admissionTime;
  String? admissionTimeString;
  int? providerId;
  int? doctorUnitMasterId;
  String? providerName;
  String? providerGender;
  String? swap;
  String? bedStatusId;
  int? providerAge;
  String? providerThumbnailUrl;
  int? departmentId;
  String? departmentName;
  int? patientId;
  String? encryptedPatientId;
  String? familyMemberName;
  String? relation;
  String? patientName;
  String? patientGender;
  String? patientMobile;
  int? patientAge;
  String? patientThumbnailUrl;
  String? patientType;
  int? wardId;
  int? roomId;
  int? bedId;
  String? wardName;
  String? roomName;
  String? bedAssociatedData;
  String? nriData;
  String? surrogacyData;
  String? emergencyInfo;
  String? bedNumber;
  String? patientFamilyId;
  bool? isDischarged;
  String? isMaternity;
  String? babysBirthDate;
  String? babysBirthTime;
  String? babysSurgeryType;
  String? babysGender;
  String? babysFathersName;
  String? babysMothersAdmissionNo;
  String? encounterId;
  String? encounterType;
  String? readyforDischarge;
  String? admissionNotes;
  bool? active;
  int? createdBy;
  String? createdByName;
  String? createdByRoleName;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;
  String? modifiedByName;
  String? modifiedByRoleName;
  String? surgeryTypeId;
  String? surgeryName;
  String? attendantName;
  String? attendantContactNo;
  String? attendantRelationWithPatient;
  String? dischargeDate;
  String? dischargeTime;
  String? dischargeTimeString;
  String? dischargeStatus;
  int? paidAmount;
  String? finalAmount;
  String? paymentStatus;
  bool? isFinalBill;
  int? logFrom;
  int? totalItems;
  String? umrNo;
  String? internalMedicineId;
  String? followUpDaysForIp;
  String? expectedDischargeDate;
  String? dischargedBy;
  String? dischargedByRole;
  String? dischargedByName;
  String? visitTypeId;
  bool? isConvertedFromOPtoIp;
  String? patientPriorityId;
  String? breakfast;
  String? lunch;
  String? dinner;
  String? breakfastStr;
  String? lunchStr;
  String? dinnerStr;
  int? locationId;
  String? locationName;
  String? serviceOrder;
  String? caseTypeId;
  String? admissionPayTypeId;
  String? payType;
  String? insuranceCompanyId;
  String? referralDoctorId;
  String? tpaId;
  String? patientOrganization;
  int? chargeCategoryId;
  String? chargeCategoryName;
  String? admissionPackageId;
  String? packageModuleId;
  String? admissionBedChangeRequestId;
  String? requestComments;
  String? chargeCategoryNames;
  int? currentRoomId;
  String? currentRoomName;
  String? unitName;
  String? patientPriorityName;
  String? priorityIcon;
  String? priorityColor;
  String? city;
  String? streetAddress;
  String? state;
  String? addressLine2;
  int? admissionTypeId;
  int? admissionVisitTypeId;
  String? billingComments;
  String? currentUnit;
  String? currentBed;
  String? clinicalNotes;
  String? mlcNm;
  String? mlcType;
  String? mlcNo;
  String? motherName;
  bool? isNewBornBaby;
  bool? isMLC;
  String? bornTypeId;
  String? motherIPNo;
  String? admissionPaymentResponsibleId;
  String? paymentResponsibleName;
  String? paymentRPAddress;
  String? paymentRPEmail;
  String? paymentRPMobile;
  String? rpOccupationId;
  String? rpRelationId;
  String? hwcPatientId;
  String? hwcName;
  String? dateOfBirth;
  String? religion;
  String? occupation;
  String? nationality;
  String? dob;
  String? relativeName;
  String? relativeEducation;
  String? relativeOccupation;
  String? email;
  int? relativeAge;
  String? relativeMobileNo;
  List<int>? specializations;
  String? encounterTypeId;
  String? encounterName;
  String? education;
  String? zipcode;
  String? currentBedNumber;
  String? currentWardName;
  String? currentFloorName;
  int? messageCount;
  String? cancelledDate;
  int? specializationId;
  String? specializationName;
  String? validity;
  String? cardNo;
  String? insuranceTypeId;
  String? internalProviderId;
  String? internalDoctor;
  String? externalProviderId;
  String? externalDoctor;
  String? insuranceCompany;
  String? tpaName;
  String? insuranceManagementId;
  String? insuranceReceipts;
  int? insuranceAmount;
  bool? isCheckOut;
  String? checkOutDate;
  String? checkOutBy;
  int? surgeryId;
  String? checkOutName;
  bool? isDischargeSummary;
  String? fromDate;
  String? toDate;
  String? patientsType;
  String? cashPatients;
  String? insurancePatients;
  String? totalPatients;
  String? fullName;
  String? status;
  String? bedCount;
  int? chargeModuleTemplateId;
  bool? isGatePassGenerated;
  String? salutation;

  PatientAdmissionModel(
      {this.counsellingId,
        this.admissionId,
        this.encryptedAdmissionId,
        this.floorName,
        this.dischargeId,
        this.admissionNo,
        this.admissionDate,
        this.admissionTime,
        this.admissionTimeString,
        this.providerId,
        this.doctorUnitMasterId,
        this.providerName,
        this.providerGender,
        this.swap,
        this.bedStatusId,
        this.providerAge,
        this.providerThumbnailUrl,
        this.departmentId,
        this.departmentName,
        this.patientId,
        this.encryptedPatientId,
        this.familyMemberName,
        this.relation,
        this.patientName,
        this.patientGender,
        this.patientMobile,
        this.patientAge,
        this.patientThumbnailUrl,
        this.patientType,
        this.wardId,
        this.roomId,
        this.bedId,
        this.wardName,
        this.roomName,
        this.bedAssociatedData,
        this.nriData,
        this.surrogacyData,
        this.emergencyInfo,
        this.bedNumber,
        this.patientFamilyId,
        this.isDischarged,
        this.isMaternity,
        this.babysBirthDate,
        this.babysBirthTime,
        this.babysSurgeryType,
        this.babysGender,
        this.babysFathersName,
        this.babysMothersAdmissionNo,
        this.encounterId,
        this.encounterType,
        this.readyforDischarge,
        this.admissionNotes,
        this.active,
        this.createdBy,
        this.createdByName,
        this.createdByRoleName,
        this.createdDate,
        this.modifiedBy,
        this.modifiedDate,
        this.modifiedByName,
        this.modifiedByRoleName,
        this.surgeryTypeId,
        this.surgeryName,
        this.attendantName,
        this.attendantContactNo,
        this.attendantRelationWithPatient,
        this.dischargeDate,
        this.dischargeTime,
        this.dischargeTimeString,
        this.dischargeStatus,
        this.paidAmount,
        this.finalAmount,
        this.paymentStatus,
        this.isFinalBill,
        this.logFrom,
        this.totalItems,
        this.umrNo,
        this.internalMedicineId,
        this.followUpDaysForIp,
        this.expectedDischargeDate,
        this.dischargedBy,
        this.dischargedByRole,
        this.dischargedByName,
        this.visitTypeId,
        this.isConvertedFromOPtoIp,
        this.patientPriorityId,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.breakfastStr,
        this.lunchStr,
        this.dinnerStr,
        this.locationId,
        this.locationName,
        this.serviceOrder,
        this.caseTypeId,
        this.admissionPayTypeId,
        this.payType,
        this.insuranceCompanyId,
        this.referralDoctorId,
        this.tpaId,
        this.patientOrganization,
        this.chargeCategoryId,
        this.chargeCategoryName,
        this.admissionPackageId,
        this.packageModuleId,
        this.admissionBedChangeRequestId,
        this.requestComments,
        this.chargeCategoryNames,
        this.currentRoomId,
        this.currentRoomName,
        this.unitName,
        this.patientPriorityName,
        this.priorityIcon,
        this.priorityColor,
        this.city,
        this.streetAddress,
        this.state,
        this.addressLine2,
        this.admissionTypeId,
        this.admissionVisitTypeId,
        this.billingComments,
        this.currentUnit,
        this.currentBed,
        this.clinicalNotes,
        this.mlcNm,
        this.mlcType,
        this.mlcNo,
        this.motherName,
        this.isNewBornBaby,
        this.isMLC,
        this.bornTypeId,
        this.motherIPNo,
        this.admissionPaymentResponsibleId,
        this.paymentResponsibleName,
        this.paymentRPAddress,
        this.paymentRPEmail,
        this.paymentRPMobile,
        this.rpOccupationId,
        this.rpRelationId,
        this.hwcPatientId,
        this.hwcName,
        this.dateOfBirth,
        this.religion,
        this.occupation,
        this.nationality,
        this.dob,
        this.relativeName,
        this.relativeEducation,
        this.relativeOccupation,
        this.email,
        this.relativeAge,
        this.relativeMobileNo,
        this.specializations,
        this.encounterTypeId,
        this.encounterName,
        this.education,
        this.zipcode,
        this.currentBedNumber,
        this.currentWardName,
        this.currentFloorName,
        this.messageCount,
        this.cancelledDate,
        this.specializationId,
        this.specializationName,
        this.validity,
        this.cardNo,
        this.insuranceTypeId,
        this.internalProviderId,
        this.internalDoctor,
        this.externalProviderId,
        this.externalDoctor,
        this.insuranceCompany,
        this.tpaName,
        this.insuranceManagementId,
        this.insuranceReceipts,
        this.insuranceAmount,
        this.isCheckOut,
        this.checkOutDate,
        this.checkOutBy,
        this.surgeryId,
        this.checkOutName,
        this.isDischargeSummary,
        this.fromDate,
        this.toDate,
        this.patientsType,
        this.cashPatients,
        this.insurancePatients,
        this.totalPatients,
        this.fullName,
        this.status,
        this.bedCount,
        this.chargeModuleTemplateId,
        this.isGatePassGenerated,
        this.salutation});

  PatientAdmissionModel.fromJson(Map<String, dynamic> json) {
    counsellingId = json['counsellingId'];
    admissionId = json['admissionId'];
    encryptedAdmissionId = json['encryptedAdmissionId'];
    floorName = json['floorName'];
    dischargeId = json['dischargeId'];
    admissionNo = json['admissionNo'];
    admissionDate = json['admissionDate'];
    admissionTime = json['admissionTime'];
    admissionTimeString = json['admissionTimeString'];
    providerId = json['providerId'];
    doctorUnitMasterId = json['doctorUnitMasterId'];
    providerName = json['providerName'];
    providerGender = json['providerGender'];
    swap = json['swap'];
    bedStatusId = json['bedStatusId'];
    providerAge = json['providerAge'];
    providerThumbnailUrl = json['providerThumbnailUrl'];
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    patientId = json['patientId'];
    encryptedPatientId = json['encryptedPatientId'];
    familyMemberName = json['familyMemberName'];
    relation = json['relation'];
    patientName = json['patientName'];
    patientGender = json['patientGender'];
    patientMobile = json['patientMobile'];
    patientAge = json['patientAge'];
    patientThumbnailUrl = json['patientThumbnailUrl'];
    patientType = json['patientType'];
    wardId = json['wardId'];
    roomId = json['roomId'];
    bedId = json['bedId'];
    wardName = json['wardName'];
    roomName = json['roomName'];
    bedAssociatedData = json['bedAssociatedData'];
    nriData = json['nriData'];
    surrogacyData = json['surrogacyData'];
    emergencyInfo = json['emergencyInfo'];
    bedNumber = json['bedNumber'];
    patientFamilyId = json['patientFamilyId'];
    isDischarged = json['isDischarged'];
    isMaternity = json['isMaternity'];
    babysBirthDate = json['babysBirthDate'];
    babysBirthTime = json['babysBirthTime'];
    babysSurgeryType = json['babysSurgeryType'];
    babysGender = json['babysGender'];
    babysFathersName = json['babysFathersName'];
    babysMothersAdmissionNo = json['babysMothersAdmissionNo'];
    encounterId = json['encounterId'];
    encounterType = json['encounterType'];
    readyforDischarge = json['readyforDischarge'];
    admissionNotes = json['admissionNotes'];
    active = json['active'];
    createdBy = json['createdBy'];
    createdByName = json['createdByName'];
    createdByRoleName = json['createdByRoleName'];
    createdDate = json['createdDate'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
    modifiedByName = json['modifiedByName'];
    modifiedByRoleName = json['modifiedByRoleName'];
    surgeryTypeId = json['surgeryTypeId'];
    surgeryName = json['surgeryName'];
    attendantName = json['attendantName'];
    attendantContactNo = json['attendantContactNo'];
    attendantRelationWithPatient = json['attendantRelationWithPatient'];
    dischargeDate = json['dischargeDate'];
    dischargeTime = json['dischargeTime'];
    dischargeTimeString = json['dischargeTimeString'];
    dischargeStatus = json['dischargeStatus'];
    paidAmount = json['paidAmount'];
    finalAmount = json['finalAmount'];
    paymentStatus = json['paymentStatus'];
    isFinalBill = json['isFinalBill'];
    logFrom = json['logFrom'];
    totalItems = json['totalItems'];
    umrNo = json['umrNo'];
    internalMedicineId = json['internalMedicineId'];
    followUpDaysForIp = json['followUpDaysForIp'];
    expectedDischargeDate = json['expectedDischargeDate'];
    dischargedBy = json['dischargedBy'];
    dischargedByRole = json['dischargedByRole'];
    dischargedByName = json['dischargedByName'];
    visitTypeId = json['visitTypeId'];
    isConvertedFromOPtoIp = json['isConvertedFromOPtoIp'];
    patientPriorityId = json['patientPriorityId'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    breakfastStr = json['breakfastStr'];
    lunchStr = json['lunchStr'];
    dinnerStr = json['dinnerStr'];
    locationId = json['locationId'];
    locationName = json['locationName'];
    serviceOrder = json['serviceOrder'];
    caseTypeId = json['caseTypeId'];
    admissionPayTypeId = json['admissionPayTypeId'];
    payType = json['payType'];
    insuranceCompanyId = json['insuranceCompanyId'];
    referralDoctorId = json['referralDoctorId'];
    tpaId = json['tpaId'];
    patientOrganization = json['patientOrganization'];
    chargeCategoryId = json['chargeCategoryId'];
    chargeCategoryName = json['chargeCategoryName'];
    admissionPackageId = json['admissionPackageId'];
    packageModuleId = json['packageModuleId'];
    admissionBedChangeRequestId = json['admissionBedChangeRequestId'];
    requestComments = json['requestComments'];
    chargeCategoryNames = json['chargeCategoryNames'];
    currentRoomId = json['currentRoomId'];
    currentRoomName = json['currentRoomName'];
    unitName = json['unitName'];
    patientPriorityName = json['patientPriorityName'];
    priorityIcon = json['priorityIcon'];
    priorityColor = json['priorityColor'];
    city = json['city'];
    streetAddress = json['streetAddress'];
    state = json['state'];
    addressLine2 = json['addressLine2'];
    admissionTypeId = json['admissionTypeId'];
    admissionVisitTypeId = json['admissionVisitTypeId'];
    billingComments = json['billingComments'];
    currentUnit = json['currentUnit'];
    currentBed = json['currentBed'];
    clinicalNotes = json['clinicalNotes'];
    mlcNm = json['mlcNm'];
    mlcType = json['mlcType'];
    mlcNo = json['mlcNo'];
    motherName = json['motherName'];
    isNewBornBaby = json['isNewBornBaby'];
    isMLC = json['isMLC'];
    bornTypeId = json['bornTypeId'];
    motherIPNo = json['motherIPNo'];
    admissionPaymentResponsibleId = json['admissionPaymentResponsibleId'];
    paymentResponsibleName = json['paymentResponsibleName'];
    paymentRPAddress = json['paymentRPAddress'];
    paymentRPEmail = json['paymentRPEmail'];
    paymentRPMobile = json['paymentRPMobile'];
    rpOccupationId = json['rpOccupationId'];
    rpRelationId = json['rpRelationId'];
    hwcPatientId = json['hwcPatientId'];
    hwcName = json['hwcName'];
    dateOfBirth = json['dateOfBirth'];
    religion = json['religion'];
    occupation = json['occupation'];
    nationality = json['nationality'];
    dob = json['dob'];
    relativeName = json['relativeName'];
    relativeEducation = json['relativeEducation'];
    relativeOccupation = json['relativeOccupation'];
    email = json['email'];
    relativeAge = json['relativeAge'];
    relativeMobileNo = json['relativeMobileNo'];
    specializations = json['specializations'].cast<int>();
    encounterTypeId = json['encounterTypeId'];
    encounterName = json['encounterName'];
    education = json['education'];
    zipcode = json['zipcode'];
    currentBedNumber = json['currentBedNumber'];
    currentWardName = json['currentWardName'];
    currentFloorName = json['currentFloorName'];
    messageCount = json['messageCount'];
    cancelledDate = json['cancelledDate'];
    specializationId = json['specializationId'];
    specializationName = json['specializationName'];
    validity = json['validity'];
    cardNo = json['cardNo'];
    insuranceTypeId = json['insuranceTypeId'];
    internalProviderId = json['internalProviderId'];
    internalDoctor = json['internalDoctor'];
    externalProviderId = json['externalProviderId'];
    externalDoctor = json['externalDoctor'];
    insuranceCompany = json['insuranceCompany'];
    tpaName = json['tpaName'];
    insuranceManagementId = json['insuranceManagementId'];
    insuranceReceipts = json['insuranceReceipts'];
    insuranceAmount = json['insuranceAmount'];
    isCheckOut = json['isCheckOut'];
    checkOutDate = json['checkOutDate'];
    checkOutBy = json['checkOutBy'];
    surgeryId = json['surgeryId'];
    checkOutName = json['checkOutName'];
    isDischargeSummary = json['isDischargeSummary'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    patientsType = json['patientsType'];
    cashPatients = json['cashPatients'];
    insurancePatients = json['insurancePatients'];
    totalPatients = json['totalPatients'];
    fullName = json['fullName'];
    status = json['status'];
    bedCount = json['bedCount'];
    chargeModuleTemplateId = json['chargeModuleTemplateId'];
    isGatePassGenerated = json['isGatePassGenerated'];
    salutation = json['salutation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counsellingId'] = this.counsellingId;
    data['admissionId'] = this.admissionId;
    data['encryptedAdmissionId'] = this.encryptedAdmissionId;
    data['floorName'] = this.floorName;
    data['dischargeId'] = this.dischargeId;
    data['admissionNo'] = this.admissionNo;
    data['admissionDate'] = this.admissionDate;
    data['admissionTime'] = this.admissionTime;
    data['admissionTimeString'] = this.admissionTimeString;
    data['providerId'] = this.providerId;
    data['doctorUnitMasterId'] = this.doctorUnitMasterId;
    data['providerName'] = this.providerName;
    data['providerGender'] = this.providerGender;
    data['swap'] = this.swap;
    data['bedStatusId'] = this.bedStatusId;
    data['providerAge'] = this.providerAge;
    data['providerThumbnailUrl'] = this.providerThumbnailUrl;
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    data['patientId'] = this.patientId;
    data['encryptedPatientId'] = this.encryptedPatientId;
    data['familyMemberName'] = this.familyMemberName;
    data['relation'] = this.relation;
    data['patientName'] = this.patientName;
    data['patientGender'] = this.patientGender;
    data['patientMobile'] = this.patientMobile;
    data['patientAge'] = this.patientAge;
    data['patientThumbnailUrl'] = this.patientThumbnailUrl;
    data['patientType'] = this.patientType;
    data['wardId'] = this.wardId;
    data['roomId'] = this.roomId;
    data['bedId'] = this.bedId;
    data['wardName'] = this.wardName;
    data['roomName'] = this.roomName;
    data['bedAssociatedData'] = this.bedAssociatedData;
    data['nriData'] = this.nriData;
    data['surrogacyData'] = this.surrogacyData;
    data['emergencyInfo'] = this.emergencyInfo;
    data['bedNumber'] = this.bedNumber;
    data['patientFamilyId'] = this.patientFamilyId;
    data['isDischarged'] = this.isDischarged;
    data['isMaternity'] = this.isMaternity;
    data['babysBirthDate'] = this.babysBirthDate;
    data['babysBirthTime'] = this.babysBirthTime;
    data['babysSurgeryType'] = this.babysSurgeryType;
    data['babysGender'] = this.babysGender;
    data['babysFathersName'] = this.babysFathersName;
    data['babysMothersAdmissionNo'] = this.babysMothersAdmissionNo;
    data['encounterId'] = this.encounterId;
    data['encounterType'] = this.encounterType;
    data['readyforDischarge'] = this.readyforDischarge;
    data['admissionNotes'] = this.admissionNotes;
    data['active'] = this.active;
    data['createdBy'] = this.createdBy;
    data['createdByName'] = this.createdByName;
    data['createdByRoleName'] = this.createdByRoleName;
    data['createdDate'] = this.createdDate;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedDate'] = this.modifiedDate;
    data['modifiedByName'] = this.modifiedByName;
    data['modifiedByRoleName'] = this.modifiedByRoleName;
    data['surgeryTypeId'] = this.surgeryTypeId;
    data['surgeryName'] = this.surgeryName;
    data['attendantName'] = this.attendantName;
    data['attendantContactNo'] = this.attendantContactNo;
    data['attendantRelationWithPatient'] = this.attendantRelationWithPatient;
    data['dischargeDate'] = this.dischargeDate;
    data['dischargeTime'] = this.dischargeTime;
    data['dischargeTimeString'] = this.dischargeTimeString;
    data['dischargeStatus'] = this.dischargeStatus;
    data['paidAmount'] = this.paidAmount;
    data['finalAmount'] = this.finalAmount;
    data['paymentStatus'] = this.paymentStatus;
    data['isFinalBill'] = this.isFinalBill;
    data['logFrom'] = this.logFrom;
    data['totalItems'] = this.totalItems;
    data['umrNo'] = this.umrNo;
    data['internalMedicineId'] = this.internalMedicineId;
    data['followUpDaysForIp'] = this.followUpDaysForIp;
    data['expectedDischargeDate'] = this.expectedDischargeDate;
    data['dischargedBy'] = this.dischargedBy;
    data['dischargedByRole'] = this.dischargedByRole;
    data['dischargedByName'] = this.dischargedByName;
    data['visitTypeId'] = this.visitTypeId;
    data['isConvertedFromOPtoIp'] = this.isConvertedFromOPtoIp;
    data['patientPriorityId'] = this.patientPriorityId;
    data['breakfast'] = this.breakfast;
    data['lunch'] = this.lunch;
    data['dinner'] = this.dinner;
    data['breakfastStr'] = this.breakfastStr;
    data['lunchStr'] = this.lunchStr;
    data['dinnerStr'] = this.dinnerStr;
    data['locationId'] = this.locationId;
    data['locationName'] = this.locationName;
    data['serviceOrder'] = this.serviceOrder;
    data['caseTypeId'] = this.caseTypeId;
    data['admissionPayTypeId'] = this.admissionPayTypeId;
    data['payType'] = this.payType;
    data['insuranceCompanyId'] = this.insuranceCompanyId;
    data['referralDoctorId'] = this.referralDoctorId;
    data['tpaId'] = this.tpaId;
    data['patientOrganization'] = this.patientOrganization;
    data['chargeCategoryId'] = this.chargeCategoryId;
    data['chargeCategoryName'] = this.chargeCategoryName;
    data['admissionPackageId'] = this.admissionPackageId;
    data['packageModuleId'] = this.packageModuleId;
    data['admissionBedChangeRequestId'] = this.admissionBedChangeRequestId;
    data['requestComments'] = this.requestComments;
    data['chargeCategoryNames'] = this.chargeCategoryNames;
    data['currentRoomId'] = this.currentRoomId;
    data['currentRoomName'] = this.currentRoomName;
    data['unitName'] = this.unitName;
    data['patientPriorityName'] = this.patientPriorityName;
    data['priorityIcon'] = this.priorityIcon;
    data['priorityColor'] = this.priorityColor;
    data['city'] = this.city;
    data['streetAddress'] = this.streetAddress;
    data['state'] = this.state;
    data['addressLine2'] = this.addressLine2;
    data['admissionTypeId'] = this.admissionTypeId;
    data['admissionVisitTypeId'] = this.admissionVisitTypeId;
    data['billingComments'] = this.billingComments;
    data['currentUnit'] = this.currentUnit;
    data['currentBed'] = this.currentBed;
    data['clinicalNotes'] = this.clinicalNotes;
    data['mlcNm'] = this.mlcNm;
    data['mlcType'] = this.mlcType;
    data['mlcNo'] = this.mlcNo;
    data['motherName'] = this.motherName;
    data['isNewBornBaby'] = this.isNewBornBaby;
    data['isMLC'] = this.isMLC;
    data['bornTypeId'] = this.bornTypeId;
    data['motherIPNo'] = this.motherIPNo;
    data['admissionPaymentResponsibleId'] = this.admissionPaymentResponsibleId;
    data['paymentResponsibleName'] = this.paymentResponsibleName;
    data['paymentRPAddress'] = this.paymentRPAddress;
    data['paymentRPEmail'] = this.paymentRPEmail;
    data['paymentRPMobile'] = this.paymentRPMobile;
    data['rpOccupationId'] = this.rpOccupationId;
    data['rpRelationId'] = this.rpRelationId;
    data['hwcPatientId'] = this.hwcPatientId;
    data['hwcName'] = this.hwcName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['religion'] = this.religion;
    data['occupation'] = this.occupation;
    data['nationality'] = this.nationality;
    data['dob'] = this.dob;
    data['relativeName'] = this.relativeName;
    data['relativeEducation'] = this.relativeEducation;
    data['relativeOccupation'] = this.relativeOccupation;
    data['email'] = this.email;
    data['relativeAge'] = this.relativeAge;
    data['relativeMobileNo'] = this.relativeMobileNo;
    data['specializations'] = this.specializations;
    data['encounterTypeId'] = this.encounterTypeId;
    data['encounterName'] = this.encounterName;
    data['education'] = this.education;
    data['zipcode'] = this.zipcode;
    data['currentBedNumber'] = this.currentBedNumber;
    data['currentWardName'] = this.currentWardName;
    data['currentFloorName'] = this.currentFloorName;
    data['messageCount'] = this.messageCount;
    data['cancelledDate'] = this.cancelledDate;
    data['specializationId'] = this.specializationId;
    data['specializationName'] = this.specializationName;
    data['validity'] = this.validity;
    data['cardNo'] = this.cardNo;
    data['insuranceTypeId'] = this.insuranceTypeId;
    data['internalProviderId'] = this.internalProviderId;
    data['internalDoctor'] = this.internalDoctor;
    data['externalProviderId'] = this.externalProviderId;
    data['externalDoctor'] = this.externalDoctor;
    data['insuranceCompany'] = this.insuranceCompany;
    data['tpaName'] = this.tpaName;
    data['insuranceManagementId'] = this.insuranceManagementId;
    data['insuranceReceipts'] = this.insuranceReceipts;
    data['insuranceAmount'] = this.insuranceAmount;
    data['isCheckOut'] = this.isCheckOut;
    data['checkOutDate'] = this.checkOutDate;
    data['checkOutBy'] = this.checkOutBy;
    data['surgeryId'] = this.surgeryId;
    data['checkOutName'] = this.checkOutName;
    data['isDischargeSummary'] = this.isDischargeSummary;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['patientsType'] = this.patientsType;
    data['cashPatients'] = this.cashPatients;
    data['insurancePatients'] = this.insurancePatients;
    data['totalPatients'] = this.totalPatients;
    data['fullName'] = this.fullName;
    data['status'] = this.status;
    data['bedCount'] = this.bedCount;
    data['chargeModuleTemplateId'] = this.chargeModuleTemplateId;
    data['isGatePassGenerated'] = this.isGatePassGenerated;
    data['salutation'] = this.salutation;
    return data;
  }
}
