class LabReportsModel {
  int? labTransferHeaderId;
  String? transferNumber;
  String? typeOfPayment;
  String? fromDate;
  String? receivedFromDate;
  String? receivedToDate;
  String? toDate;
  int? transferedBy;
  String? transferedDate;
  String? bookedDate;
  int? transferedLocationId;
  String? transferedLocation;
  String? receivedBy;
  String? receivedDate;
  String? transferByName;
  String? recievedByName;
  String? testName;
  String? testCode;
  String? status;
  String? patientName;
  String? requisitionNumber;
  String? mobile;
  String? doctorName;
  String? employeeName;
  String? fromLocation;
  String? fromLocationId;
  String? umrNo;
  String? gender;
  String? age;
  String? collectionDate;
  String? barcodeDate;
  bool? isBarcodeGenerated;
  String? sampleCollectedByName;
  String? barcodeGeneratedByName;
  String? transferedToLocation;
  int? totalItems;
  String? pageSize;
  String? pageIndex;
  String? createdLabLocationId;
  String? labs;
  int? doctorId;
  int? newLabBookingDetailId;
  int? newLabBookingHeaderId;
  String? dateOfBirth;
  String? rowColor;
  String? providerId;
  String? roleId;
  int? patientId;
  String? encryptedId;
  String? approved;
  String? assignedDoctor;
  String? createdByName;
  String? createdDate;
  String? comment;
  int? labMainDetailId;
  String? transferredTemperature;
  String? transferredTemperatureComments;
  String? receivedTemperature;
  int? labBookingStatusId;
  int? templateCount;
  String? receivedTemperatureComments;
  String? holdComments;
  String? departmentName;
  String? sampleCollectionLocation;
  String? technicianComment;
  String? technicianName;
  String? technicianVerificationDate;
  bool? emergency;
  bool? quickReport;
  String? bookingType;
  String? appointmentId;
  String? encryptedAppointmentId;
  String? labSampleCollectionDetailId;
  String? subSampleCollectedBy;
  String? subBarcodeGeneratedBy;
  String? subCollectionDate;
  String? subBarcodeDate;
  bool? subIsBarcodeGenerated;
  String? sampleName;
  String? subSampleCollectedByName;
  String? subBarcodeGeneratedByName;
  String? subSampleCollectionLocation;
  String? noOfSamplesCollectText;
  int? noOfSamplesCollect;
  String? subStatus;
  String? fromTech;
  String? encounterType;
  String? paymentType;
  String? sampleUsage;
  bool? isExcelImport;
  String? assignDoctorRequired;
  String? isNablRequired;
  String? nablRequired;
  String? paymentStatus;
  String? subSampleCollectedByRole;
  String? transferByRole;
  String? recievedByRole;
  String? sampleCollectedByRole;
  String? encryptedNewLabBookingDetailId;
  String? verifiedBy;
  String? verifiedDate;
  bool? isExternalLab;
  bool? isInternalLab;
  String? messageCount;
  String? labDepartmentId;
  String? sampleID;
  String? consentFormUrl;
  String? email;
  String? fullName;
  String? departmentIds;
  List<Templates>? templates;
  String? encryptedLabMainDetailId;
  String? headerFormUrl;
  String? bottomFormUrl;
  String? relativeName;
  String? relation;
  String? referredBy;
  String? admissionNo;
  String? bedNumber;
  String? referredByName;

  LabReportsModel(
      {this.labTransferHeaderId,
        this.transferNumber,
        this.typeOfPayment,
        this.fromDate,
        this.receivedFromDate,
        this.receivedToDate,
        this.toDate,
        this.transferedBy,
        this.transferedDate,
        this.bookedDate,
        this.transferedLocationId,
        this.transferedLocation,
        this.receivedBy,
        this.receivedDate,
        this.transferByName,
        this.recievedByName,
        this.testName,
        this.testCode,
        this.status,
        this.patientName,
        this.requisitionNumber,
        this.mobile,
        this.doctorName,
        this.employeeName,
        this.fromLocation,
        this.fromLocationId,
        this.umrNo,
        this.gender,
        this.age,
        this.collectionDate,
        this.barcodeDate,
        this.isBarcodeGenerated,
        this.sampleCollectedByName,
        this.barcodeGeneratedByName,
        this.transferedToLocation,
        this.totalItems,
        this.pageSize,
        this.pageIndex,
        this.createdLabLocationId,
        this.labs,
        this.doctorId,
        this.newLabBookingDetailId,
        this.newLabBookingHeaderId,
        this.dateOfBirth,
        this.rowColor,
        this.providerId,
        this.roleId,
        this.patientId,
        this.encryptedId,
        this.approved,
        this.assignedDoctor,
        this.createdByName,
        this.createdDate,
        this.comment,
        this.labMainDetailId,
        this.transferredTemperature,
        this.transferredTemperatureComments,
        this.receivedTemperature,
        this.labBookingStatusId,
        this.templateCount,
        this.receivedTemperatureComments,
        this.holdComments,
        this.departmentName,
        this.sampleCollectionLocation,
        this.technicianComment,
        this.technicianName,
        this.technicianVerificationDate,
        this.emergency,
        this.quickReport,
        this.bookingType,
        this.appointmentId,
        this.encryptedAppointmentId,
        this.labSampleCollectionDetailId,
        this.subSampleCollectedBy,
        this.subBarcodeGeneratedBy,
        this.subCollectionDate,
        this.subBarcodeDate,
        this.subIsBarcodeGenerated,
        this.sampleName,
        this.subSampleCollectedByName,
        this.subBarcodeGeneratedByName,
        this.subSampleCollectionLocation,
        this.noOfSamplesCollectText,
        this.noOfSamplesCollect,
        this.subStatus,
        this.fromTech,
        this.encounterType,
        this.paymentType,
        this.sampleUsage,
        this.isExcelImport,
        this.assignDoctorRequired,
        this.isNablRequired,
        this.nablRequired,
        this.paymentStatus,
        this.subSampleCollectedByRole,
        this.transferByRole,
        this.recievedByRole,
        this.sampleCollectedByRole,
        this.encryptedNewLabBookingDetailId,
        this.verifiedBy,
        this.verifiedDate,
        this.isExternalLab,
        this.isInternalLab,
        this.messageCount,
        this.labDepartmentId,
        this.sampleID,
        this.consentFormUrl,
        this.email,
        this.fullName,
        this.departmentIds,
        this.templates,
        this.encryptedLabMainDetailId,
        this.headerFormUrl,
        this.bottomFormUrl,
        this.relativeName,
        this.relation,
        this.referredBy,
        this.admissionNo,
        this.bedNumber,
        this.referredByName});

  LabReportsModel.fromJson(Map<String, dynamic> json) {
    labTransferHeaderId = json['labTransferHeaderId'];
    transferNumber = json['transferNumber'];
    typeOfPayment = json['typeOfPayment'];
    fromDate = json['fromDate'];
    receivedFromDate = json['receivedFromDate'];
    receivedToDate = json['receivedToDate'];
    toDate = json['toDate'];
    transferedBy = json['transferedBy'];
    transferedDate = json['transferedDate'];
    bookedDate = json['bookedDate'];
    transferedLocationId = json['transferedLocationId'];
    transferedLocation = json['transferedLocation'];
    receivedBy = json['receivedBy'];
    receivedDate = json['receivedDate'];
    transferByName = json['transferByName'];
    recievedByName = json['recievedByName'];
    testName = json['testName'];
    testCode = json['testCode'];
    status = json['status'];
    patientName = json['patientName'];
    requisitionNumber = json['requisitionNumber'];
    mobile = json['mobile'];
    doctorName = json['doctorName'];
    employeeName = json['employeeName'];
    fromLocation = json['fromLocation'];
    fromLocationId = json['fromLocationId'];
    umrNo = json['umrNo'];
    gender = json['gender'];
    age = json['age'];
    collectionDate = json['collectionDate'];
    barcodeDate = json['barcodeDate'];
    isBarcodeGenerated = json['isBarcodeGenerated'];
    sampleCollectedByName = json['sampleCollectedByName'];
    barcodeGeneratedByName = json['barcodeGeneratedByName'];
    transferedToLocation = json['transferedToLocation'];
    totalItems = json['totalItems'];
    pageSize = json['pageSize'];
    pageIndex = json['pageIndex'];
    createdLabLocationId = json['createdLabLocationId'];
    labs = json['labs'];
    doctorId = json['doctorId'];
    newLabBookingDetailId = json['newLabBookingDetailId'];
    newLabBookingHeaderId = json['newLabBookingHeaderId'];
    dateOfBirth = json['dateOfBirth'];
    rowColor = json['rowColor'];
    providerId = json['providerId'];
    roleId = json['roleId'];
    patientId = json['patientId'];
    encryptedId = json['encryptedId'];
    approved = json['approved'];
    assignedDoctor = json['assignedDoctor'];
    createdByName = json['createdByName'];
    createdDate = json['createdDate'];
    comment = json['comment'];
    labMainDetailId = json['labMainDetailId'];
    transferredTemperature = json['transferredTemperature'];
    transferredTemperatureComments = json['transferredTemperatureComments'];
    receivedTemperature = json['receivedTemperature'];
    labBookingStatusId = json['labBookingStatusId'];
    templateCount = json['templateCount'];
    receivedTemperatureComments = json['receivedTemperatureComments'];
    holdComments = json['holdComments'];
    departmentName = json['departmentName'];
    sampleCollectionLocation = json['sampleCollectionLocation'];
    technicianComment = json['technicianComment'];
    technicianName = json['technicianName'];
    technicianVerificationDate = json['technicianVerificationDate'];
    emergency = json['emergency'];
    quickReport = json['quickReport'];
    bookingType = json['bookingType'];
    appointmentId = json['appointmentId'];
    encryptedAppointmentId = json['encryptedAppointmentId'];
    labSampleCollectionDetailId = json['labSampleCollectionDetailId'];
    subSampleCollectedBy = json['subSampleCollectedBy'];
    subBarcodeGeneratedBy = json['subBarcodeGeneratedBy'];
    subCollectionDate = json['subCollectionDate'];
    subBarcodeDate = json['subBarcodeDate'];
    subIsBarcodeGenerated = json['subIsBarcodeGenerated'];
    sampleName = json['sampleName'];
    subSampleCollectedByName = json['subSampleCollectedByName'];
    subBarcodeGeneratedByName = json['subBarcodeGeneratedByName'];
    subSampleCollectionLocation = json['subSampleCollectionLocation'];
    noOfSamplesCollectText = json['noOfSamplesCollectText'];
    noOfSamplesCollect = json['noOfSamplesCollect'];
    subStatus = json['subStatus'];
    fromTech = json['fromTech'];
    encounterType = json['encounterType'];
    paymentType = json['paymentType'];
    sampleUsage = json['sampleUsage'];
    isExcelImport = json['isExcelImport'];
    assignDoctorRequired = json['assignDoctorRequired'];
    isNablRequired = json['isNablRequired'];
    nablRequired = json['nablRequired'];
    paymentStatus = json['paymentStatus'];
    subSampleCollectedByRole = json['subSampleCollectedByRole'];
    transferByRole = json['transferByRole'];
    recievedByRole = json['recievedByRole'];
    sampleCollectedByRole = json['sampleCollectedByRole'];
    encryptedNewLabBookingDetailId = json['encryptedNewLabBookingDetailId'];
    verifiedBy = json['verifiedBy'];
    verifiedDate = json['verifiedDate'];
    isExternalLab = json['isExternalLab'];
    isInternalLab = json['isInternalLab'];
    messageCount = json['messageCount'];
    labDepartmentId = json['labDepartmentId'];
    sampleID = json['sampleID'];
    consentFormUrl = json['consentFormUrl'];
    email = json['email'];
    fullName = json['fullName'];
    departmentIds = json['departmentIds'];
    if (json['templates'] != null) {
      templates = <Templates>[];
      json['templates'].forEach((v) {
        templates!.add(new Templates.fromJson(v));
      });
    }
    encryptedLabMainDetailId = json['encryptedLabMainDetailId'];
    headerFormUrl = json['headerFormUrl'];
    bottomFormUrl = json['bottomFormUrl'];
    relativeName = json['relativeName'];
    relation = json['relation'];
    referredBy = json['referredBy'];
    admissionNo = json['admissionNo'];
    bedNumber = json['bedNumber'];
    referredByName = json['referredByName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labTransferHeaderId'] = this.labTransferHeaderId;
    data['transferNumber'] = this.transferNumber;
    data['typeOfPayment'] = this.typeOfPayment;
    data['fromDate'] = this.fromDate;
    data['receivedFromDate'] = this.receivedFromDate;
    data['receivedToDate'] = this.receivedToDate;
    data['toDate'] = this.toDate;
    data['transferedBy'] = this.transferedBy;
    data['transferedDate'] = this.transferedDate;
    data['bookedDate'] = this.bookedDate;
    data['transferedLocationId'] = this.transferedLocationId;
    data['transferedLocation'] = this.transferedLocation;
    data['receivedBy'] = this.receivedBy;
    data['receivedDate'] = this.receivedDate;
    data['transferByName'] = this.transferByName;
    data['recievedByName'] = this.recievedByName;
    data['testName'] = this.testName;
    data['testCode'] = this.testCode;
    data['status'] = this.status;
    data['patientName'] = this.patientName;
    data['requisitionNumber'] = this.requisitionNumber;
    data['mobile'] = this.mobile;
    data['doctorName'] = this.doctorName;
    data['employeeName'] = this.employeeName;
    data['fromLocation'] = this.fromLocation;
    data['fromLocationId'] = this.fromLocationId;
    data['umrNo'] = this.umrNo;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['collectionDate'] = this.collectionDate;
    data['barcodeDate'] = this.barcodeDate;
    data['isBarcodeGenerated'] = this.isBarcodeGenerated;
    data['sampleCollectedByName'] = this.sampleCollectedByName;
    data['barcodeGeneratedByName'] = this.barcodeGeneratedByName;
    data['transferedToLocation'] = this.transferedToLocation;
    data['totalItems'] = this.totalItems;
    data['pageSize'] = this.pageSize;
    data['pageIndex'] = this.pageIndex;
    data['createdLabLocationId'] = this.createdLabLocationId;
    data['labs'] = this.labs;
    data['doctorId'] = this.doctorId;
    data['newLabBookingDetailId'] = this.newLabBookingDetailId;
    data['newLabBookingHeaderId'] = this.newLabBookingHeaderId;
    data['dateOfBirth'] = this.dateOfBirth;
    data['rowColor'] = this.rowColor;
    data['providerId'] = this.providerId;
    data['roleId'] = this.roleId;
    data['patientId'] = this.patientId;
    data['encryptedId'] = this.encryptedId;
    data['approved'] = this.approved;
    data['assignedDoctor'] = this.assignedDoctor;
    data['createdByName'] = this.createdByName;
    data['createdDate'] = this.createdDate;
    data['comment'] = this.comment;
    data['labMainDetailId'] = this.labMainDetailId;
    data['transferredTemperature'] = this.transferredTemperature;
    data['transferredTemperatureComments'] =
        this.transferredTemperatureComments;
    data['receivedTemperature'] = this.receivedTemperature;
    data['labBookingStatusId'] = this.labBookingStatusId;
    data['templateCount'] = this.templateCount;
    data['receivedTemperatureComments'] = this.receivedTemperatureComments;
    data['holdComments'] = this.holdComments;
    data['departmentName'] = this.departmentName;
    data['sampleCollectionLocation'] = this.sampleCollectionLocation;
    data['technicianComment'] = this.technicianComment;
    data['technicianName'] = this.technicianName;
    data['technicianVerificationDate'] = this.technicianVerificationDate;
    data['emergency'] = this.emergency;
    data['quickReport'] = this.quickReport;
    data['bookingType'] = this.bookingType;
    data['appointmentId'] = this.appointmentId;
    data['encryptedAppointmentId'] = this.encryptedAppointmentId;
    data['labSampleCollectionDetailId'] = this.labSampleCollectionDetailId;
    data['subSampleCollectedBy'] = this.subSampleCollectedBy;
    data['subBarcodeGeneratedBy'] = this.subBarcodeGeneratedBy;
    data['subCollectionDate'] = this.subCollectionDate;
    data['subBarcodeDate'] = this.subBarcodeDate;
    data['subIsBarcodeGenerated'] = this.subIsBarcodeGenerated;
    data['sampleName'] = this.sampleName;
    data['subSampleCollectedByName'] = this.subSampleCollectedByName;
    data['subBarcodeGeneratedByName'] = this.subBarcodeGeneratedByName;
    data['subSampleCollectionLocation'] = this.subSampleCollectionLocation;
    data['noOfSamplesCollectText'] = this.noOfSamplesCollectText;
    data['noOfSamplesCollect'] = this.noOfSamplesCollect;
    data['subStatus'] = this.subStatus;
    data['fromTech'] = this.fromTech;
    data['encounterType'] = this.encounterType;
    data['paymentType'] = this.paymentType;
    data['sampleUsage'] = this.sampleUsage;
    data['isExcelImport'] = this.isExcelImport;
    data['assignDoctorRequired'] = this.assignDoctorRequired;
    data['isNablRequired'] = this.isNablRequired;
    data['nablRequired'] = this.nablRequired;
    data['paymentStatus'] = this.paymentStatus;
    data['subSampleCollectedByRole'] = this.subSampleCollectedByRole;
    data['transferByRole'] = this.transferByRole;
    data['recievedByRole'] = this.recievedByRole;
    data['sampleCollectedByRole'] = this.sampleCollectedByRole;
    data['encryptedNewLabBookingDetailId'] =
        this.encryptedNewLabBookingDetailId;
    data['verifiedBy'] = this.verifiedBy;
    data['verifiedDate'] = this.verifiedDate;
    data['isExternalLab'] = this.isExternalLab;
    data['isInternalLab'] = this.isInternalLab;
    data['messageCount'] = this.messageCount;
    data['labDepartmentId'] = this.labDepartmentId;
    data['sampleID'] = this.sampleID;
    data['consentFormUrl'] = this.consentFormUrl;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['departmentIds'] = this.departmentIds;
    if (this.templates != null) {
      data['templates'] = this.templates!.map((v) => v.toJson()).toList();
    }
    data['encryptedLabMainDetailId'] = this.encryptedLabMainDetailId;
    data['headerFormUrl'] = this.headerFormUrl;
    data['bottomFormUrl'] = this.bottomFormUrl;
    data['relativeName'] = this.relativeName;
    data['relation'] = this.relation;
    data['referredBy'] = this.referredBy;
    data['admissionNo'] = this.admissionNo;
    data['bedNumber'] = this.bedNumber;
    data['referredByName'] = this.referredByName;
    return data;
  }
}

class Templates {
  int? labMainDetailTemplateId;
  int? labMainDetailId;
  int? labTemplateHeaderId;
  int? priority;
  String? templateName;
  String? templateId;

  Templates(
      {this.labMainDetailTemplateId,
        this.labMainDetailId,
        this.labTemplateHeaderId,
        this.priority,
        this.templateName,
        this.templateId});

  Templates.fromJson(Map<String, dynamic> json) {
    labMainDetailTemplateId = json['labMainDetailTemplateId'];
    labMainDetailId = json['labMainDetailId'];
    labTemplateHeaderId = json['labTemplateHeaderId'];
    priority = json['priority'];
    templateName = json['templateName'];
    templateId = json['templateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labMainDetailTemplateId'] = this.labMainDetailTemplateId;
    data['labMainDetailId'] = this.labMainDetailId;
    data['labTemplateHeaderId'] = this.labTemplateHeaderId;
    data['priority'] = this.priority;
    data['templateName'] = this.templateName;
    data['templateId'] = this.templateId;
    return data;
  }
}
