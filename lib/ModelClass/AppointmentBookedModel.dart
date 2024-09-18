class AppointmentBookedModel {
  String? status;
  int? data;
  Null? message;
  String? id;
  Value? value;

  AppointmentBookedModel(
      {this.status, this.data, this.message, this.id, this.value});

  AppointmentBookedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
    id = json['id'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['message'] = this.message;
    data['id'] = this.id;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  int? appointmentId;
  bool? isAdmission;
  bool? isFollowUpCompleted;
  Null? encounterId;
  String? encryptedAppointmentId;
  String? encryptedPatientId;
  String? encryptedProviderId;
  int? providerLocationId;
  int? providerId;
  String? providerName;
  Null? reason;
  String? providerGender;
  Null? providerAge;
  String? providerThumbnailUrl;
  String? appointmentEndTime;
  String? practiceName;
  Null? providerLocation;
  String? currencySymbol;
  int? patientId;
  int? patientAccountId;
  int? providerAccountId;
  String? patientName;
  String? patientGender;
  String? patientMobile;
  String? patientEmail;
  String? providerMobile;
  String? providerEmail;
  bool? enableEmailAlerts;
  bool? enableSMSAlerts;
  bool? enableDesktopNotifications;
  bool? enableMobileNotifications;
  Null? patientThumbnailUrl;
  int? patientAge;
  int? patientCountryId;
  String? patientCountryCode;
  int? providerCountryId;
  String? providerCountryCode;
  Null? visitType;
  Null? patientType;
  Null? chargeType;
  String? appointmentNo;
  String? previousAppointmentNo;
  String? previousAdmissionNo;
  String? appointmentDate;
  Null? appointmentPreviousDate;
  Null? admissionDischargeDate;
  Null? admissionDischargeTime;
  Null? appointmentPreviousTime;
  String? appointmentTime;
  Null? appointmentDateTime;
  Null? oldAppointmentDateTime;
  String? appointmentTimeString;
  Null? previousAppointmentTimeString;
  Null? previousAdmissionDischargeTimeString;
  Null? appointmentNotes;
  Null? couponId;
  int? amount;
  int? discount;
  int? total;
  int? appCharges;
  String? status;
  bool? active;
  int? createdBy;
  String? createdDate;
  Null? modifiedBy;
  Null? modifiedDate;
  Null? modifiedByName;
  int? totalItems;
  Null? encounterType;
  bool? isPrescription;
  bool? isFullTranscript;
  Null? patientGuid;
  Null? providerGuid;
  Null? patientDocumentCount;
  Null? callStatus;
  Null? callStatusText;
  Null? patientCallStatus;
  Null? callerName;
  Null? videoCallStatus;
  Null? roomName;
  Null? domain;
  Null? symptoms;
  bool? isOnline;
  Null? delay;
  Null? patientFamilyId;
  int? logFrom;
  Null? doctorMessageCount;
  Null? patientMessageCount;
  Null? walletAmount;
  int? departmentId;
  Null? departmentName;
  String? umrNo;
  Null? patientMaritalStatus;
  bool? paymentStatus;
  Null? paymentType;
  Null? payTypeName;
  Null? paymentNumber;
  Null? isActiveAdmissionExists;
  Null? streetAddress;
  Null? city;
  Null? state;
  Null? zipcode;
  Null? followUpForAppointmentId;
  Null? followUpForAdmissionId;
  Null? followUpDays;
  Null? freeVisitsCount;
  Null? freeFollowUpDaysLimit;
  Null? freeFollowUpDays;
  Null? startDate;
  Null? endDate;
  Null? startTime;
  Null? endTime;
  Null? aadharNo;
  Null? referredBy;
  Null? referredByName;
  int? visitTypeId;
  int? chargeTypesId;
  Null? createdByName;
  Null? checkedIn;
  Null? checkedOut;
  int? locationId;
  Null? tat;
  Null? queueStatus;
  int? queueStatusId;
  Null? fatherOrHusband;
  Null? chargeTypesName;
  int? payType;
  String? locationName;
  Null? specializationNames;
  Null? languages;
  Null? appointmentTypeId;
  Null? payTypeId;
  int? tokenNumber;
  Null? patientReferredName;
  Null? waitingCount;
  Null? emailDetailsId;
  Null? emailHeadersId;
  Null? replyEmailDetailsId;
  Null? patientDateOfBirth;
  String? statusName;
  int? appointmentStatusId;
  bool? isCc;
  Null? telemedicineIds;
  Null? callerRoleId;
  Null? isUTC;
  Null? specializations;
  bool? enableMobileAudioCall;
  bool? isPrescriptionBlink;
  Null? isTaskDone;
  Null? noOfEmails;
  Null? isPanicOption;
  Null? callStatusDate;
  Null? callStatusModifiedDate;
  Null? inProgress;
  Null? callStatusName;
  Null? callType;
  Null? callTypeName;
  Null? callerCallStatus;
  Null? callerCallStatusName;
  Null? receiverCallStatus;
  Null? receiverCallStatusName;
  Null? callerCallStatusDate;
  Null? receiverCallStatusDate;
  Null? telemedicineDuration;
  Null? isRequireEmergencyAppointment;
  Null? activeUsers;
  Null? idProofName;
  Null? idProofValue;
  Null? appointmentTypeName;
  Null? queueEndDate;
  Null? queueStartDate;
  Null? minutes;
  Null? patientPaymentStatus;
  Null? patientRegistrationAmount;
  Null? visitorName;
  int? specializationId;
  Null? specializationName;
  Null? transactionId;
  int? providerAvailabilityId;
  int? consultationTypeId;
  bool? isWeb;
  bool? isPatientApp;
  bool? isSalucro;
  bool? isEncounter;
  Null? cubicleName;
  Null? receiptCreatedByName;
  Null? receiptDate;
  int? aptRefundAmt;
  Null? receiptId;
  Null? cancelType;
  Null? transaction;
  Null? salucroStatusCode;
  Null? salucroTransactionId;
  Null? message;
  int? messageCount;
  Null? totalAmount;
  Null? charges;
  bool? isSalucroAppointment;
  int? doctorSpecializationChargeModuleDetailsId;
  Null? referenceId;
  Null? patientSalutation;
  Null? patientRelation;
  Null? area;
  Null? lastConsultedDate;
  Null? lastConsultedDoctor;
  Null? lastPaidAmount;
  Null? nextAppointment;
  Null? hwcCategory;
  Null? followUpValidityDate;
  Null? lastConsultedTime;
  Null? otherRemarks;
  Null? authorityId;
  Null? reasonId;
  Null? remarks;
  Null? encounterName;
  Null? moduleType;
  Null? typeOfPayment;
  bool? isEmergency;
  Null? mapUrl;
  Null? transactionCount;
  Null? consultationName;
  Null? isAppointmentClosed;
  Null? patientDiscountInPercentage;
  Null? patientDiscountInRupees;
  Null? patientTotal;
  Null? appointmentDiscountInPercentage;
  int? appointmentDiscountInRupees;
  int? appointmentTotal;
  int? discountInPercentage;
  Null? counsellingId;
  bool? isDraftCounselling;
  int? afterDiscount;
  Null? isHealthCard;
  Null? addressLine2;
  Null? sessionId;
  Null? slotCount;
  Null? isEncounterClosed;
  String? urlLink;
  bool? isMobile;
  bool? isDischarged;
  bool? admissionActive;
  Null? payTypes;
  Null? isNewPatient;
  int? aptAmount;
  int? aptDiscount;
  int? aptTotal;
  Null? patAmount;
  Null? patDiscount;
  Null? patTotal;
  Null? packageModuleDetailId;
  Null? packageAppointmentId;
  Null? admissionPackageId;
  bool? isFromPackage;
  bool? followUpSpecialization;
  Null? fromDate;
  Null? toDate;
  Null? patientsOrganization;
  Null? receptionist;
  Null? doctorName;
  Null? branchName;
  Null? contactNumber;
  Null? emergencyTriage;
  Null? nursingERForm;
  bool? isHdfcAppt;
  Null? paymentLink;
  Null? encounterTypes;
  Null? scanTestName;
  Null? requisitionNumber;
  Null? appointmentCounts;
  Null? pendingAppointment;
  Null? completed;
  Null? ancNo;
  Null? isPatientRegistrationCompleted;

  Value(
      {this.appointmentId,
        this.isAdmission,
        this.isFollowUpCompleted,
        this.encounterId,
        this.encryptedAppointmentId,
        this.encryptedPatientId,
        this.encryptedProviderId,
        this.providerLocationId,
        this.providerId,
        this.providerName,
        this.reason,
        this.providerGender,
        this.providerAge,
        this.providerThumbnailUrl,
        this.appointmentEndTime,
        this.practiceName,
        this.providerLocation,
        this.currencySymbol,
        this.patientId,
        this.patientAccountId,
        this.providerAccountId,
        this.patientName,
        this.patientGender,
        this.patientMobile,
        this.patientEmail,
        this.providerMobile,
        this.providerEmail,
        this.enableEmailAlerts,
        this.enableSMSAlerts,
        this.enableDesktopNotifications,
        this.enableMobileNotifications,
        this.patientThumbnailUrl,
        this.patientAge,
        this.patientCountryId,
        this.patientCountryCode,
        this.providerCountryId,
        this.providerCountryCode,
        this.visitType,
        this.patientType,
        this.chargeType,
        this.appointmentNo,
        this.previousAppointmentNo,
        this.previousAdmissionNo,
        this.appointmentDate,
        this.appointmentPreviousDate,
        this.admissionDischargeDate,
        this.admissionDischargeTime,
        this.appointmentPreviousTime,
        this.appointmentTime,
        this.appointmentDateTime,
        this.oldAppointmentDateTime,
        this.appointmentTimeString,
        this.previousAppointmentTimeString,
        this.previousAdmissionDischargeTimeString,
        this.appointmentNotes,
        this.couponId,
        this.amount,
        this.discount,
        this.total,
        this.appCharges,
        this.status,
        this.active,
        this.createdBy,
        this.createdDate,
        this.modifiedBy,
        this.modifiedDate,
        this.modifiedByName,
        this.totalItems,
        this.encounterType,
        this.isPrescription,
        this.isFullTranscript,
        this.patientGuid,
        this.providerGuid,
        this.patientDocumentCount,
        this.callStatus,
        this.callStatusText,
        this.patientCallStatus,
        this.callerName,
        this.videoCallStatus,
        this.roomName,
        this.domain,
        this.symptoms,
        this.isOnline,
        this.delay,
        this.patientFamilyId,
        this.logFrom,
        this.doctorMessageCount,
        this.patientMessageCount,
        this.walletAmount,
        this.departmentId,
        this.departmentName,
        this.umrNo,
        this.patientMaritalStatus,
        this.paymentStatus,
        this.paymentType,
        this.payTypeName,
        this.paymentNumber,
        this.isActiveAdmissionExists,
        this.streetAddress,
        this.city,
        this.state,
        this.zipcode,
        this.followUpForAppointmentId,
        this.followUpForAdmissionId,
        this.followUpDays,
        this.freeVisitsCount,
        this.freeFollowUpDaysLimit,
        this.freeFollowUpDays,
        this.startDate,
        this.endDate,
        this.startTime,
        this.endTime,
        this.aadharNo,
        this.referredBy,
        this.referredByName,
        this.visitTypeId,
        this.chargeTypesId,
        this.createdByName,
        this.checkedIn,
        this.checkedOut,
        this.locationId,
        this.tat,
        this.queueStatus,
        this.queueStatusId,
        this.fatherOrHusband,
        this.chargeTypesName,
        this.payType,
        this.locationName,
        this.specializationNames,
        this.languages,
        this.appointmentTypeId,
        this.payTypeId,
        this.tokenNumber,
        this.patientReferredName,
        this.waitingCount,
        this.emailDetailsId,
        this.emailHeadersId,
        this.replyEmailDetailsId,
        this.patientDateOfBirth,
        this.statusName,
        this.appointmentStatusId,
        this.isCc,
        this.telemedicineIds,
        this.callerRoleId,
        this.isUTC,
        this.specializations,
        this.enableMobileAudioCall,
        this.isPrescriptionBlink,
        this.isTaskDone,
        this.noOfEmails,
        this.isPanicOption,
        this.callStatusDate,
        this.callStatusModifiedDate,
        this.inProgress,
        this.callStatusName,
        this.callType,
        this.callTypeName,
        this.callerCallStatus,
        this.callerCallStatusName,
        this.receiverCallStatus,
        this.receiverCallStatusName,
        this.callerCallStatusDate,
        this.receiverCallStatusDate,
        this.telemedicineDuration,
        this.isRequireEmergencyAppointment,
        this.activeUsers,
        this.idProofName,
        this.idProofValue,
        this.appointmentTypeName,
        this.queueEndDate,
        this.queueStartDate,
        this.minutes,
        this.patientPaymentStatus,
        this.patientRegistrationAmount,
        this.visitorName,
        this.specializationId,
        this.specializationName,
        this.transactionId,
        this.providerAvailabilityId,
        this.consultationTypeId,
        this.isWeb,
        this.isPatientApp,
        this.isSalucro,
        this.isEncounter,
        this.cubicleName,
        this.receiptCreatedByName,
        this.receiptDate,
        this.aptRefundAmt,
        this.receiptId,
        this.cancelType,
        this.transaction,
        this.salucroStatusCode,
        this.salucroTransactionId,
        this.message,
        this.messageCount,
        this.totalAmount,
        this.charges,
        this.isSalucroAppointment,
        this.doctorSpecializationChargeModuleDetailsId,
        this.referenceId,
        this.patientSalutation,
        this.patientRelation,
        this.area,
        this.lastConsultedDate,
        this.lastConsultedDoctor,
        this.lastPaidAmount,
        this.nextAppointment,
        this.hwcCategory,
        this.followUpValidityDate,
        this.lastConsultedTime,
        this.otherRemarks,
        this.authorityId,
        this.reasonId,
        this.remarks,
        this.encounterName,
        this.moduleType,
        this.typeOfPayment,
        this.isEmergency,
        this.mapUrl,
        this.transactionCount,
        this.consultationName,
        this.isAppointmentClosed,
        this.patientDiscountInPercentage,
        this.patientDiscountInRupees,
        this.patientTotal,
        this.appointmentDiscountInPercentage,
        this.appointmentDiscountInRupees,
        this.appointmentTotal,
        this.discountInPercentage,
        this.counsellingId,
        this.isDraftCounselling,
        this.afterDiscount,
        this.isHealthCard,
        this.addressLine2,
        this.sessionId,
        this.slotCount,
        this.isEncounterClosed,
        this.urlLink,
        this.isMobile,
        this.isDischarged,
        this.admissionActive,
        this.payTypes,
        this.isNewPatient,
        this.aptAmount,
        this.aptDiscount,
        this.aptTotal,
        this.patAmount,
        this.patDiscount,
        this.patTotal,
        this.packageModuleDetailId,
        this.packageAppointmentId,
        this.admissionPackageId,
        this.isFromPackage,
        this.followUpSpecialization,
        this.fromDate,
        this.toDate,
        this.patientsOrganization,
        this.receptionist,
        this.doctorName,
        this.branchName,
        this.contactNumber,
        this.emergencyTriage,
        this.nursingERForm,
        this.isHdfcAppt,
        this.paymentLink,
        this.encounterTypes,
        this.scanTestName,
        this.requisitionNumber,
        this.appointmentCounts,
        this.pendingAppointment,
        this.completed,
        this.ancNo,
        this.isPatientRegistrationCompleted});

  Value.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointmentId'];
    isAdmission = json['isAdmission'];
    isFollowUpCompleted = json['isFollowUpCompleted'];
    encounterId = json['encounterId'];
    encryptedAppointmentId = json['encryptedAppointmentId'];
    encryptedPatientId = json['encryptedPatientId'];
    encryptedProviderId = json['encryptedProviderId'];
    providerLocationId = json['providerLocationId'];
    providerId = json['providerId'];
    providerName = json['providerName'];
    reason = json['reason'];
    providerGender = json['providerGender'];
    providerAge = json['providerAge'];
    providerThumbnailUrl = json['providerThumbnailUrl'];
    appointmentEndTime = json['appointmentEndTime'];
    practiceName = json['practiceName'];
    providerLocation = json['providerLocation'];
    currencySymbol = json['currencySymbol'];
    patientId = json['patientId'];
    patientAccountId = json['patientAccountId'];
    providerAccountId = json['providerAccountId'];
    patientName = json['patientName'];
    patientGender = json['patientGender'];
    patientMobile = json['patientMobile'];
    patientEmail = json['patientEmail'];
    providerMobile = json['providerMobile'];
    providerEmail = json['providerEmail'];
    enableEmailAlerts = json['enableEmailAlerts'];
    enableSMSAlerts = json['enableSMSAlerts'];
    enableDesktopNotifications = json['enableDesktopNotifications'];
    enableMobileNotifications = json['enableMobileNotifications'];
    patientThumbnailUrl = json['patientThumbnailUrl'];
    patientAge = json['patientAge'];
    patientCountryId = json['patientCountryId'];
    patientCountryCode = json['patientCountryCode'];
    providerCountryId = json['providerCountryId'];
    providerCountryCode = json['providerCountryCode'];
    visitType = json['visitType'];
    patientType = json['patientType'];
    chargeType = json['chargeType'];
    appointmentNo = json['appointmentNo'];
    previousAppointmentNo = json['previousAppointmentNo'];
    previousAdmissionNo = json['previousAdmissionNo'];
    appointmentDate = json['appointmentDate'];
    appointmentPreviousDate = json['appointmentPreviousDate'];
    admissionDischargeDate = json['admissionDischargeDate'];
    admissionDischargeTime = json['admissionDischargeTime'];
    appointmentPreviousTime = json['appointmentPreviousTime'];
    appointmentTime = json['appointmentTime'];
    appointmentDateTime = json['appointmentDateTime'];
    oldAppointmentDateTime = json['oldAppointmentDateTime'];
    appointmentTimeString = json['appointmentTimeString'];
    previousAppointmentTimeString = json['previousAppointmentTimeString'];
    previousAdmissionDischargeTimeString =
    json['previousAdmissionDischargeTimeString'];
    appointmentNotes = json['appointmentNotes'];
    couponId = json['couponId'];
    amount = json['amount'];
    discount = json['discount'];
    total = json['total'];
    appCharges = json['appCharges'];
    status = json['status'];
    active = json['active'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
    modifiedByName = json['modifiedByName'];
    totalItems = json['totalItems'];
    encounterType = json['encounterType'];
    isPrescription = json['isPrescription'];
    isFullTranscript = json['isFullTranscript'];
    patientGuid = json['patientGuid'];
    providerGuid = json['providerGuid'];
    patientDocumentCount = json['patientDocumentCount'];
    callStatus = json['callStatus'];
    callStatusText = json['callStatusText'];
    patientCallStatus = json['patientCallStatus'];
    callerName = json['callerName'];
    videoCallStatus = json['videoCallStatus'];
    roomName = json['roomName'];
    domain = json['domain'];
    symptoms = json['symptoms'];
    isOnline = json['isOnline'];
    delay = json['delay'];
    patientFamilyId = json['patientFamilyId'];
    logFrom = json['logFrom'];
    doctorMessageCount = json['doctorMessageCount'];
    patientMessageCount = json['patientMessageCount'];
    walletAmount = json['walletAmount'];
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
    umrNo = json['umrNo'];
    patientMaritalStatus = json['patientMaritalStatus'];
    paymentStatus = json['paymentStatus'];
    paymentType = json['paymentType'];
    payTypeName = json['payTypeName'];
    paymentNumber = json['paymentNumber'];
    isActiveAdmissionExists = json['isActiveAdmissionExists'];
    streetAddress = json['streetAddress'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    followUpForAppointmentId = json['followUpForAppointmentId'];
    followUpForAdmissionId = json['followUpForAdmissionId'];
    followUpDays = json['followUpDays'];
    freeVisitsCount = json['freeVisitsCount'];
    freeFollowUpDaysLimit = json['freeFollowUpDaysLimit'];
    freeFollowUpDays = json['freeFollowUpDays'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    aadharNo = json['aadharNo'];
    referredBy = json['referredBy'];
    referredByName = json['referredByName'];
    visitTypeId = json['visitTypeId'];
    chargeTypesId = json['chargeTypesId'];
    createdByName = json['createdByName'];
    checkedIn = json['checkedIn'];
    checkedOut = json['checkedOut'];
    locationId = json['locationId'];
    tat = json['tat'];
    queueStatus = json['queueStatus'];
    queueStatusId = json['queueStatusId'];
    fatherOrHusband = json['fatherOrHusband'];
    chargeTypesName = json['chargeTypesName'];
    payType = json['payType'];
    locationName = json['locationName'];
    specializationNames = json['specializationNames'];
    languages = json['languages'];
    appointmentTypeId = json['appointmentTypeId'];
    payTypeId = json['payTypeId'];
    tokenNumber = json['tokenNumber'];
    patientReferredName = json['patientReferredName'];
    waitingCount = json['waitingCount'];
    emailDetailsId = json['emailDetailsId'];
    emailHeadersId = json['emailHeadersId'];
    replyEmailDetailsId = json['replyEmailDetailsId'];
    patientDateOfBirth = json['patientDateOfBirth'];
    statusName = json['statusName'];
    appointmentStatusId = json['appointmentStatusId'];
    isCc = json['isCc'];
    telemedicineIds = json['telemedicineIds'];
    callerRoleId = json['callerRoleId'];
    isUTC = json['isUTC'];
    specializations = json['specializations'];
    enableMobileAudioCall = json['enableMobileAudioCall'];
    isPrescriptionBlink = json['isPrescriptionBlink'];
    isTaskDone = json['isTaskDone'];
    noOfEmails = json['noOfEmails'];
    isPanicOption = json['isPanicOption'];
    callStatusDate = json['callStatusDate'];
    callStatusModifiedDate = json['callStatusModifiedDate'];
    inProgress = json['inProgress'];
    callStatusName = json['callStatusName'];
    callType = json['callType'];
    callTypeName = json['callTypeName'];
    callerCallStatus = json['callerCallStatus'];
    callerCallStatusName = json['callerCallStatusName'];
    receiverCallStatus = json['receiverCallStatus'];
    receiverCallStatusName = json['receiverCallStatusName'];
    callerCallStatusDate = json['callerCallStatusDate'];
    receiverCallStatusDate = json['receiverCallStatusDate'];
    telemedicineDuration = json['telemedicineDuration'];
    isRequireEmergencyAppointment = json['isRequireEmergencyAppointment'];
    activeUsers = json['activeUsers'];
    idProofName = json['idProofName'];
    idProofValue = json['idProofValue'];
    appointmentTypeName = json['appointmentTypeName'];
    queueEndDate = json['queueEndDate'];
    queueStartDate = json['queueStartDate'];
    minutes = json['minutes'];
    patientPaymentStatus = json['patientPaymentStatus'];
    patientRegistrationAmount = json['patientRegistrationAmount'];
    visitorName = json['visitorName'];
    specializationId = json['specializationId'];
    specializationName = json['specializationName'];
    transactionId = json['transactionId'];
    providerAvailabilityId = json['providerAvailabilityId'];
    consultationTypeId = json['consultationTypeId'];
    isWeb = json['isWeb'];
    isPatientApp = json['isPatientApp'];
    isSalucro = json['isSalucro'];
    isEncounter = json['isEncounter'];
    cubicleName = json['cubicleName'];
    receiptCreatedByName = json['receiptCreatedByName'];
    receiptDate = json['receiptDate'];
    aptRefundAmt = json['aptRefundAmt'];
    receiptId = json['receiptId'];
    cancelType = json['cancelType'];
    transaction = json['transaction'];
    salucroStatusCode = json['salucroStatusCode'];
    salucroTransactionId = json['salucroTransactionId'];
    message = json['message'];
    messageCount = json['messageCount'];
    totalAmount = json['totalAmount'];
    charges = json['charges'];
    isSalucroAppointment = json['isSalucroAppointment'];
    doctorSpecializationChargeModuleDetailsId =
    json['doctorSpecializationChargeModuleDetailsId'];
    referenceId = json['referenceId'];
    patientSalutation = json['patientSalutation'];
    patientRelation = json['patientRelation'];
    area = json['area'];
    lastConsultedDate = json['lastConsultedDate'];
    lastConsultedDoctor = json['lastConsultedDoctor'];
    lastPaidAmount = json['lastPaidAmount'];
    nextAppointment = json['nextAppointment'];
    hwcCategory = json['hwcCategory'];
    followUpValidityDate = json['followUpValidityDate'];
    lastConsultedTime = json['lastConsultedTime'];
    otherRemarks = json['otherRemarks'];
    authorityId = json['authorityId'];
    reasonId = json['reasonId'];
    remarks = json['remarks'];
    encounterName = json['encounterName'];
    moduleType = json['moduleType'];
    typeOfPayment = json['typeOfPayment'];
    isEmergency = json['isEmergency'];
    mapUrl = json['mapUrl'];
    transactionCount = json['transactionCount'];
    consultationName = json['consultationName'];
    isAppointmentClosed = json['isAppointmentClosed'];
    patientDiscountInPercentage = json['patientDiscountInPercentage'];
    patientDiscountInRupees = json['patientDiscountInRupees'];
    patientTotal = json['patientTotal'];
    appointmentDiscountInPercentage = json['appointmentDiscountInPercentage'];
    appointmentDiscountInRupees = json['appointmentDiscountInRupees'];
    appointmentTotal = json['appointmentTotal'];
    discountInPercentage = json['discountInPercentage'];
    counsellingId = json['counsellingId'];
    isDraftCounselling = json['isDraftCounselling'];
    afterDiscount = json['afterDiscount'];
    isHealthCard = json['isHealthCard'];
    addressLine2 = json['addressLine2'];
    sessionId = json['sessionId'];
    slotCount = json['slotCount'];
    isEncounterClosed = json['isEncounterClosed'];
    urlLink = json['urlLink'];
    isMobile = json['isMobile'];
    isDischarged = json['isDischarged'];
    admissionActive = json['admissionActive'];
    payTypes = json['payTypes'];
    isNewPatient = json['isNewPatient'];
    aptAmount = json['aptAmount'];
    aptDiscount = json['aptDiscount'];
    aptTotal = json['aptTotal'];
    patAmount = json['patAmount'];
    patDiscount = json['patDiscount'];
    patTotal = json['patTotal'];
    packageModuleDetailId = json['packageModuleDetailId'];
    packageAppointmentId = json['packageAppointmentId'];
    admissionPackageId = json['admissionPackageId'];
    isFromPackage = json['isFromPackage'];
    followUpSpecialization = json['followUpSpecialization'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    patientsOrganization = json['patientsOrganization'];
    receptionist = json['receptionist'];
    doctorName = json['doctorName'];
    branchName = json['branchName'];
    contactNumber = json['contactNumber'];
    emergencyTriage = json['emergencyTriage'];
    nursingERForm = json['nursingERForm'];
    isHdfcAppt = json['isHdfcAppt'];
    paymentLink = json['paymentLink'];
    encounterTypes = json['encounterTypes'];
    scanTestName = json['scanTestName'];
    requisitionNumber = json['requisitionNumber'];
    appointmentCounts = json['appointmentCounts'];
    pendingAppointment = json['pendingAppointment'];
    completed = json['completed'];
    ancNo = json['ancNo'];
    isPatientRegistrationCompleted = json['isPatientRegistrationCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointmentId'] = this.appointmentId;
    data['isAdmission'] = this.isAdmission;
    data['isFollowUpCompleted'] = this.isFollowUpCompleted;
    data['encounterId'] = this.encounterId;
    data['encryptedAppointmentId'] = this.encryptedAppointmentId;
    data['encryptedPatientId'] = this.encryptedPatientId;
    data['encryptedProviderId'] = this.encryptedProviderId;
    data['providerLocationId'] = this.providerLocationId;
    data['providerId'] = this.providerId;
    data['providerName'] = this.providerName;
    data['reason'] = this.reason;
    data['providerGender'] = this.providerGender;
    data['providerAge'] = this.providerAge;
    data['providerThumbnailUrl'] = this.providerThumbnailUrl;
    data['appointmentEndTime'] = this.appointmentEndTime;
    data['practiceName'] = this.practiceName;
    data['providerLocation'] = this.providerLocation;
    data['currencySymbol'] = this.currencySymbol;
    data['patientId'] = this.patientId;
    data['patientAccountId'] = this.patientAccountId;
    data['providerAccountId'] = this.providerAccountId;
    data['patientName'] = this.patientName;
    data['patientGender'] = this.patientGender;
    data['patientMobile'] = this.patientMobile;
    data['patientEmail'] = this.patientEmail;
    data['providerMobile'] = this.providerMobile;
    data['providerEmail'] = this.providerEmail;
    data['enableEmailAlerts'] = this.enableEmailAlerts;
    data['enableSMSAlerts'] = this.enableSMSAlerts;
    data['enableDesktopNotifications'] = this.enableDesktopNotifications;
    data['enableMobileNotifications'] = this.enableMobileNotifications;
    data['patientThumbnailUrl'] = this.patientThumbnailUrl;
    data['patientAge'] = this.patientAge;
    data['patientCountryId'] = this.patientCountryId;
    data['patientCountryCode'] = this.patientCountryCode;
    data['providerCountryId'] = this.providerCountryId;
    data['providerCountryCode'] = this.providerCountryCode;
    data['visitType'] = this.visitType;
    data['patientType'] = this.patientType;
    data['chargeType'] = this.chargeType;
    data['appointmentNo'] = this.appointmentNo;
    data['previousAppointmentNo'] = this.previousAppointmentNo;
    data['previousAdmissionNo'] = this.previousAdmissionNo;
    data['appointmentDate'] = this.appointmentDate;
    data['appointmentPreviousDate'] = this.appointmentPreviousDate;
    data['admissionDischargeDate'] = this.admissionDischargeDate;
    data['admissionDischargeTime'] = this.admissionDischargeTime;
    data['appointmentPreviousTime'] = this.appointmentPreviousTime;
    data['appointmentTime'] = this.appointmentTime;
    data['appointmentDateTime'] = this.appointmentDateTime;
    data['oldAppointmentDateTime'] = this.oldAppointmentDateTime;
    data['appointmentTimeString'] = this.appointmentTimeString;
    data['previousAppointmentTimeString'] = this.previousAppointmentTimeString;
    data['previousAdmissionDischargeTimeString'] =
        this.previousAdmissionDischargeTimeString;
    data['appointmentNotes'] = this.appointmentNotes;
    data['couponId'] = this.couponId;
    data['amount'] = this.amount;
    data['discount'] = this.discount;
    data['total'] = this.total;
    data['appCharges'] = this.appCharges;
    data['status'] = this.status;
    data['active'] = this.active;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedDate'] = this.modifiedDate;
    data['modifiedByName'] = this.modifiedByName;
    data['totalItems'] = this.totalItems;
    data['encounterType'] = this.encounterType;
    data['isPrescription'] = this.isPrescription;
    data['isFullTranscript'] = this.isFullTranscript;
    data['patientGuid'] = this.patientGuid;
    data['providerGuid'] = this.providerGuid;
    data['patientDocumentCount'] = this.patientDocumentCount;
    data['callStatus'] = this.callStatus;
    data['callStatusText'] = this.callStatusText;
    data['patientCallStatus'] = this.patientCallStatus;
    data['callerName'] = this.callerName;
    data['videoCallStatus'] = this.videoCallStatus;
    data['roomName'] = this.roomName;
    data['domain'] = this.domain;
    data['symptoms'] = this.symptoms;
    data['isOnline'] = this.isOnline;
    data['delay'] = this.delay;
    data['patientFamilyId'] = this.patientFamilyId;
    data['logFrom'] = this.logFrom;
    data['doctorMessageCount'] = this.doctorMessageCount;
    data['patientMessageCount'] = this.patientMessageCount;
    data['walletAmount'] = this.walletAmount;
    data['departmentId'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    data['umrNo'] = this.umrNo;
    data['patientMaritalStatus'] = this.patientMaritalStatus;
    data['paymentStatus'] = this.paymentStatus;
    data['paymentType'] = this.paymentType;
    data['payTypeName'] = this.payTypeName;
    data['paymentNumber'] = this.paymentNumber;
    data['isActiveAdmissionExists'] = this.isActiveAdmissionExists;
    data['streetAddress'] = this.streetAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['followUpForAppointmentId'] = this.followUpForAppointmentId;
    data['followUpForAdmissionId'] = this.followUpForAdmissionId;
    data['followUpDays'] = this.followUpDays;
    data['freeVisitsCount'] = this.freeVisitsCount;
    data['freeFollowUpDaysLimit'] = this.freeFollowUpDaysLimit;
    data['freeFollowUpDays'] = this.freeFollowUpDays;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['aadharNo'] = this.aadharNo;
    data['referredBy'] = this.referredBy;
    data['referredByName'] = this.referredByName;
    data['visitTypeId'] = this.visitTypeId;
    data['chargeTypesId'] = this.chargeTypesId;
    data['createdByName'] = this.createdByName;
    data['checkedIn'] = this.checkedIn;
    data['checkedOut'] = this.checkedOut;
    data['locationId'] = this.locationId;
    data['tat'] = this.tat;
    data['queueStatus'] = this.queueStatus;
    data['queueStatusId'] = this.queueStatusId;
    data['fatherOrHusband'] = this.fatherOrHusband;
    data['chargeTypesName'] = this.chargeTypesName;
    data['payType'] = this.payType;
    data['locationName'] = this.locationName;
    data['specializationNames'] = this.specializationNames;
    data['languages'] = this.languages;
    data['appointmentTypeId'] = this.appointmentTypeId;
    data['payTypeId'] = this.payTypeId;
    data['tokenNumber'] = this.tokenNumber;
    data['patientReferredName'] = this.patientReferredName;
    data['waitingCount'] = this.waitingCount;
    data['emailDetailsId'] = this.emailDetailsId;
    data['emailHeadersId'] = this.emailHeadersId;
    data['replyEmailDetailsId'] = this.replyEmailDetailsId;
    data['patientDateOfBirth'] = this.patientDateOfBirth;
    data['statusName'] = this.statusName;
    data['appointmentStatusId'] = this.appointmentStatusId;
    data['isCc'] = this.isCc;
    data['telemedicineIds'] = this.telemedicineIds;
    data['callerRoleId'] = this.callerRoleId;
    data['isUTC'] = this.isUTC;
    data['specializations'] = this.specializations;
    data['enableMobileAudioCall'] = this.enableMobileAudioCall;
    data['isPrescriptionBlink'] = this.isPrescriptionBlink;
    data['isTaskDone'] = this.isTaskDone;
    data['noOfEmails'] = this.noOfEmails;
    data['isPanicOption'] = this.isPanicOption;
    data['callStatusDate'] = this.callStatusDate;
    data['callStatusModifiedDate'] = this.callStatusModifiedDate;
    data['inProgress'] = this.inProgress;
    data['callStatusName'] = this.callStatusName;
    data['callType'] = this.callType;
    data['callTypeName'] = this.callTypeName;
    data['callerCallStatus'] = this.callerCallStatus;
    data['callerCallStatusName'] = this.callerCallStatusName;
    data['receiverCallStatus'] = this.receiverCallStatus;
    data['receiverCallStatusName'] = this.receiverCallStatusName;
    data['callerCallStatusDate'] = this.callerCallStatusDate;
    data['receiverCallStatusDate'] = this.receiverCallStatusDate;
    data['telemedicineDuration'] = this.telemedicineDuration;
    data['isRequireEmergencyAppointment'] = this.isRequireEmergencyAppointment;
    data['activeUsers'] = this.activeUsers;
    data['idProofName'] = this.idProofName;
    data['idProofValue'] = this.idProofValue;
    data['appointmentTypeName'] = this.appointmentTypeName;
    data['queueEndDate'] = this.queueEndDate;
    data['queueStartDate'] = this.queueStartDate;
    data['minutes'] = this.minutes;
    data['patientPaymentStatus'] = this.patientPaymentStatus;
    data['patientRegistrationAmount'] = this.patientRegistrationAmount;
    data['visitorName'] = this.visitorName;
    data['specializationId'] = this.specializationId;
    data['specializationName'] = this.specializationName;
    data['transactionId'] = this.transactionId;
    data['providerAvailabilityId'] = this.providerAvailabilityId;
    data['consultationTypeId'] = this.consultationTypeId;
    data['isWeb'] = this.isWeb;
    data['isPatientApp'] = this.isPatientApp;
    data['isSalucro'] = this.isSalucro;
    data['isEncounter'] = this.isEncounter;
    data['cubicleName'] = this.cubicleName;
    data['receiptCreatedByName'] = this.receiptCreatedByName;
    data['receiptDate'] = this.receiptDate;
    data['aptRefundAmt'] = this.aptRefundAmt;
    data['receiptId'] = this.receiptId;
    data['cancelType'] = this.cancelType;
    data['transaction'] = this.transaction;
    data['salucroStatusCode'] = this.salucroStatusCode;
    data['salucroTransactionId'] = this.salucroTransactionId;
    data['message'] = this.message;
    data['messageCount'] = this.messageCount;
    data['totalAmount'] = this.totalAmount;
    data['charges'] = this.charges;
    data['isSalucroAppointment'] = this.isSalucroAppointment;
    data['doctorSpecializationChargeModuleDetailsId'] =
        this.doctorSpecializationChargeModuleDetailsId;
    data['referenceId'] = this.referenceId;
    data['patientSalutation'] = this.patientSalutation;
    data['patientRelation'] = this.patientRelation;
    data['area'] = this.area;
    data['lastConsultedDate'] = this.lastConsultedDate;
    data['lastConsultedDoctor'] = this.lastConsultedDoctor;
    data['lastPaidAmount'] = this.lastPaidAmount;
    data['nextAppointment'] = this.nextAppointment;
    data['hwcCategory'] = this.hwcCategory;
    data['followUpValidityDate'] = this.followUpValidityDate;
    data['lastConsultedTime'] = this.lastConsultedTime;
    data['otherRemarks'] = this.otherRemarks;
    data['authorityId'] = this.authorityId;
    data['reasonId'] = this.reasonId;
    data['remarks'] = this.remarks;
    data['encounterName'] = this.encounterName;
    data['moduleType'] = this.moduleType;
    data['typeOfPayment'] = this.typeOfPayment;
    data['isEmergency'] = this.isEmergency;
    data['mapUrl'] = this.mapUrl;
    data['transactionCount'] = this.transactionCount;
    data['consultationName'] = this.consultationName;
    data['isAppointmentClosed'] = this.isAppointmentClosed;
    data['patientDiscountInPercentage'] = this.patientDiscountInPercentage;
    data['patientDiscountInRupees'] = this.patientDiscountInRupees;
    data['patientTotal'] = this.patientTotal;
    data['appointmentDiscountInPercentage'] =
        this.appointmentDiscountInPercentage;
    data['appointmentDiscountInRupees'] = this.appointmentDiscountInRupees;
    data['appointmentTotal'] = this.appointmentTotal;
    data['discountInPercentage'] = this.discountInPercentage;
    data['counsellingId'] = this.counsellingId;
    data['isDraftCounselling'] = this.isDraftCounselling;
    data['afterDiscount'] = this.afterDiscount;
    data['isHealthCard'] = this.isHealthCard;
    data['addressLine2'] = this.addressLine2;
    data['sessionId'] = this.sessionId;
    data['slotCount'] = this.slotCount;
    data['isEncounterClosed'] = this.isEncounterClosed;
    data['urlLink'] = this.urlLink;
    data['isMobile'] = this.isMobile;
    data['isDischarged'] = this.isDischarged;
    data['admissionActive'] = this.admissionActive;
    data['payTypes'] = this.payTypes;
    data['isNewPatient'] = this.isNewPatient;
    data['aptAmount'] = this.aptAmount;
    data['aptDiscount'] = this.aptDiscount;
    data['aptTotal'] = this.aptTotal;
    data['patAmount'] = this.patAmount;
    data['patDiscount'] = this.patDiscount;
    data['patTotal'] = this.patTotal;
    data['packageModuleDetailId'] = this.packageModuleDetailId;
    data['packageAppointmentId'] = this.packageAppointmentId;
    data['admissionPackageId'] = this.admissionPackageId;
    data['isFromPackage'] = this.isFromPackage;
    data['followUpSpecialization'] = this.followUpSpecialization;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['patientsOrganization'] = this.patientsOrganization;
    data['receptionist'] = this.receptionist;
    data['doctorName'] = this.doctorName;
    data['branchName'] = this.branchName;
    data['contactNumber'] = this.contactNumber;
    data['emergencyTriage'] = this.emergencyTriage;
    data['nursingERForm'] = this.nursingERForm;
    data['isHdfcAppt'] = this.isHdfcAppt;
    data['paymentLink'] = this.paymentLink;
    data['encounterTypes'] = this.encounterTypes;
    data['scanTestName'] = this.scanTestName;
    data['requisitionNumber'] = this.requisitionNumber;
    data['appointmentCounts'] = this.appointmentCounts;
    data['pendingAppointment'] = this.pendingAppointment;
    data['completed'] = this.completed;
    data['ancNo'] = this.ancNo;
    data['isPatientRegistrationCompleted'] =
        this.isPatientRegistrationCompleted;
    return data;
  }
}
