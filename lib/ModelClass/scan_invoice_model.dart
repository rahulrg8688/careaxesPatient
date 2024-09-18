class ScanInvoiceModel {
  int? bookScanAppointmentId;
  String? encryptedBookScanAppointmentId;
  String? encryptedRecieptId;
  String? scanMachineMasterId;
  int? scanMachineMasterIds;
  int? chargeCategoryId;
  String? encryptedPatientId;
  String? scanTestMasterId;
  int? patientId;
  String? providerId;
  bool? paymentStatus;
  bool? pndtReport;
  String? scanScrollResult;
  bool? patientPaymentStatus;
  String? isNewPatient;
  int? payTypeId;
  int? locationId;
  String? locationName;
  bool? active;
  int? createdBy;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;
  String? patientName;
  String? createdByName;
  String? scanTestName;
  String? machineName;
  String? mobile;
  String? practiceName;
  String? appointmentStartDateTime;
  String? appointmentDate;
  String? umrno;
  String? appointmentTime;
  String? appointmentEndTime;
  String? gender;
  String? fatherOrHusband;
  String? fullAddress;
  int? slotDuration;
  int? age;
  String? ageInYMD;
  String? appointmentEndDateTime;
  String? status;
  String? reason;
  String? payTypeName;
  String? fromDate;
  String? toDate;
  String? appointmentTimeString;
  String? chargeCategoryName;
  int? amount;
  int? paidAmount;
  String? refundAmount;
  int? paidAmt;
  int? regCharges;
  int? scanAmount;
  int? netAmount;
  int? totalDiscount;
  int? discountAmount;
  bool? isSalucroAppointment;
  String? requisitionNumber;
  String? totalItems;
  int? pageIndex;
  int? pageSize;
  String? typeOfPayment;
  String? scanAppointmentType;
  String? actualAmount;
  int? amt;
  String? regDiscountInRupees;
  bool? isDispatched;
  String? gravida;
  String? periodOfGestation;
  String? edd;
  String? paymentType;
  int? receiptId;
  String? scanDocumentId;
  String? hwcPatientId;
  String? type;
  String? providerName;
  String? backgroundColor;
  String? indication;
  String? scanDoctors;
  bool? isPatRegPaid;
  int? paidScanAmount;
  String? isIncludedInPackage;
  String? packageName;
  String? createdByRole;
  String? payTypes;
  String? isAccepted;
  String? scanServiceId;
  int? dueAmount;
  String? practiceMobile;

  ScanInvoiceModel(
      {this.bookScanAppointmentId,
        this.encryptedBookScanAppointmentId,
        this.encryptedRecieptId,
        this.scanMachineMasterId,
        this.scanMachineMasterIds,
        this.chargeCategoryId,
        this.encryptedPatientId,
        this.scanTestMasterId,
        this.patientId,
        this.providerId,
        this.paymentStatus,
        this.pndtReport,
        this.scanScrollResult,
        this.patientPaymentStatus,
        this.isNewPatient,
        this.payTypeId,
        this.locationId,
        this.locationName,
        this.active,
        this.createdBy,
        this.createdDate,
        this.modifiedBy,
        this.modifiedDate,
        this.patientName,
        this.createdByName,
        this.scanTestName,
        this.machineName,
        this.mobile,
        this.practiceName,
        this.appointmentStartDateTime,
        this.appointmentDate,
        this.umrno,
        this.appointmentTime,
        this.appointmentEndTime,
        this.gender,
        this.fatherOrHusband,
        this.fullAddress,
        this.slotDuration,
        this.age,
        this.ageInYMD,
        this.appointmentEndDateTime,
        this.status,
        this.reason,
        this.payTypeName,
        this.fromDate,
        this.toDate,
        this.appointmentTimeString,
        this.chargeCategoryName,
        this.amount,
        this.paidAmount,
        this.refundAmount,
        this.paidAmt,
        this.regCharges,
        this.scanAmount,
        this.netAmount,
        this.totalDiscount,
        this.discountAmount,
        this.isSalucroAppointment,
        this.requisitionNumber,
        this.totalItems,
        this.pageIndex,
        this.pageSize,
        this.typeOfPayment,
        this.scanAppointmentType,
        this.actualAmount,
        this.amt,
        this.regDiscountInRupees,
        this.isDispatched,
        this.gravida,
        this.periodOfGestation,
        this.edd,
        this.paymentType,
        this.receiptId,
        this.scanDocumentId,
        this.hwcPatientId,
        this.type,
        this.providerName,
        this.backgroundColor,
        this.indication,
        this.scanDoctors,
        this.isPatRegPaid,
        this.paidScanAmount,
        this.isIncludedInPackage,
        this.packageName,
        this.createdByRole,
        this.payTypes,
        this.isAccepted,
        this.scanServiceId,
        this.dueAmount,
        this.practiceMobile});

  ScanInvoiceModel.fromJson(Map<String, dynamic> json) {
    bookScanAppointmentId = json['bookScanAppointmentId'];
    encryptedBookScanAppointmentId = json['encryptedBookScanAppointmentId'];
    encryptedRecieptId = json['encryptedRecieptId'];
    scanMachineMasterId = json['scanMachineMasterId'];
    scanMachineMasterIds = json['scanMachineMasterIds'];
    chargeCategoryId = json['chargeCategoryId'];
    encryptedPatientId = json['encryptedPatientId'];
    scanTestMasterId = json['scanTestMasterId'];
    patientId = json['patientId'];
    providerId = json['providerId'];
    paymentStatus = json['paymentStatus'];
    pndtReport = json['pndtReport'];
    scanScrollResult = json['scanScrollResult'];
    patientPaymentStatus = json['patientPaymentStatus'];
    isNewPatient = json['isNewPatient'];
    payTypeId = json['payTypeId'];
    locationId = json['locationId'];
    locationName = json['locationName'];
    active = json['active'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
    patientName = json['patientName'];
    createdByName = json['createdByName'];
    scanTestName = json['scanTestName'];
    machineName = json['machineName'];
    mobile = json['mobile'];
    practiceName = json['practiceName'];
    appointmentStartDateTime = json['appointmentStartDateTime'];
    appointmentDate = json['appointmentDate'];
    umrno = json['umrno'];
    appointmentTime = json['appointmentTime'];
    appointmentEndTime = json['appointmentEndTime'];
    gender = json['gender'];
    fatherOrHusband = json['fatherOrHusband'];
    fullAddress = json['fullAddress'];
    slotDuration = json['slotDuration'];
    age = json['age'];
    ageInYMD = json['ageInYMD'];
    appointmentEndDateTime = json['appointmentEndDateTime'];
    status = json['status'];
    reason = json['reason'];
    payTypeName = json['payTypeName'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    appointmentTimeString = json['appointmentTimeString'];
    chargeCategoryName = json['chargeCategoryName'];
    amount = json['amount'];
    paidAmount = json['paidAmount'];
    refundAmount = json['refundAmount'];
    paidAmt = json['paidAmt'];
    regCharges = json['regCharges'];
    scanAmount = json['scanAmount'];
    netAmount = json['netAmount'];
    totalDiscount = json['totalDiscount'];
    discountAmount = json['discountAmount'];
    isSalucroAppointment = json['isSalucroAppointment'];
    requisitionNumber = json['requisitionNumber'];
    totalItems = json['totalItems'];
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    typeOfPayment = json['typeOfPayment'];
    scanAppointmentType = json['scanAppointmentType'];
    actualAmount = json['actualAmount'];
    amt = json['amt'];
    regDiscountInRupees = json['regDiscountInRupees'];
    isDispatched = json['isDispatched'];
    gravida = json['gravida'];
    periodOfGestation = json['periodOfGestation'];
    edd = json['edd'];
    paymentType = json['paymentType'];
    receiptId = json['receiptId'];
    scanDocumentId = json['scanDocumentId'];
    hwcPatientId = json['hwcPatientId'];
    type = json['type'];
    providerName = json['providerName'];
    backgroundColor = json['backgroundColor'];
    indication = json['indication'];
    scanDoctors = json['scanDoctors'];
    isPatRegPaid = json['isPatRegPaid'];
    paidScanAmount = json['paidScanAmount'];
    isIncludedInPackage = json['isIncludedInPackage'];
    packageName = json['packageName'];
    createdByRole = json['createdByRole'];
    payTypes = json['payTypes'];
    isAccepted = json['isAccepted'];
    scanServiceId = json['scanServiceId'];
    dueAmount = json['dueAmount'];
    practiceMobile = json['practiceMobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookScanAppointmentId'] = this.bookScanAppointmentId;
    data['encryptedBookScanAppointmentId'] =
        this.encryptedBookScanAppointmentId;
    data['encryptedRecieptId'] = this.encryptedRecieptId;
    data['scanMachineMasterId'] = this.scanMachineMasterId;
    data['scanMachineMasterIds'] = this.scanMachineMasterIds;
    data['chargeCategoryId'] = this.chargeCategoryId;
    data['encryptedPatientId'] = this.encryptedPatientId;
    data['scanTestMasterId'] = this.scanTestMasterId;
    data['patientId'] = this.patientId;
    data['providerId'] = this.providerId;
    data['paymentStatus'] = this.paymentStatus;
    data['pndtReport'] = this.pndtReport;
    data['scanScrollResult'] = this.scanScrollResult;
    data['patientPaymentStatus'] = this.patientPaymentStatus;
    data['isNewPatient'] = this.isNewPatient;
    data['payTypeId'] = this.payTypeId;
    data['locationId'] = this.locationId;
    data['locationName'] = this.locationName;
    data['active'] = this.active;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedDate'] = this.modifiedDate;
    data['patientName'] = this.patientName;
    data['createdByName'] = this.createdByName;
    data['scanTestName'] = this.scanTestName;
    data['machineName'] = this.machineName;
    data['mobile'] = this.mobile;
    data['practiceName'] = this.practiceName;
    data['appointmentStartDateTime'] = this.appointmentStartDateTime;
    data['appointmentDate'] = this.appointmentDate;
    data['umrno'] = this.umrno;
    data['appointmentTime'] = this.appointmentTime;
    data['appointmentEndTime'] = this.appointmentEndTime;
    data['gender'] = this.gender;
    data['fatherOrHusband'] = this.fatherOrHusband;
    data['fullAddress'] = this.fullAddress;
    data['slotDuration'] = this.slotDuration;
    data['age'] = this.age;
    data['ageInYMD'] = this.ageInYMD;
    data['appointmentEndDateTime'] = this.appointmentEndDateTime;
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['payTypeName'] = this.payTypeName;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['appointmentTimeString'] = this.appointmentTimeString;
    data['chargeCategoryName'] = this.chargeCategoryName;
    data['amount'] = this.amount;
    data['paidAmount'] = this.paidAmount;
    data['refundAmount'] = this.refundAmount;
    data['paidAmt'] = this.paidAmt;
    data['regCharges'] = this.regCharges;
    data['scanAmount'] = this.scanAmount;
    data['netAmount'] = this.netAmount;
    data['totalDiscount'] = this.totalDiscount;
    data['discountAmount'] = this.discountAmount;
    data['isSalucroAppointment'] = this.isSalucroAppointment;
    data['requisitionNumber'] = this.requisitionNumber;
    data['totalItems'] = this.totalItems;
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['typeOfPayment'] = this.typeOfPayment;
    data['scanAppointmentType'] = this.scanAppointmentType;
    data['actualAmount'] = this.actualAmount;
    data['amt'] = this.amt;
    data['regDiscountInRupees'] = this.regDiscountInRupees;
    data['isDispatched'] = this.isDispatched;
    data['gravida'] = this.gravida;
    data['periodOfGestation'] = this.periodOfGestation;
    data['edd'] = this.edd;
    data['paymentType'] = this.paymentType;
    data['receiptId'] = this.receiptId;
    data['scanDocumentId'] = this.scanDocumentId;
    data['hwcPatientId'] = this.hwcPatientId;
    data['type'] = this.type;
    data['providerName'] = this.providerName;
    data['backgroundColor'] = this.backgroundColor;
    data['indication'] = this.indication;
    data['scanDoctors'] = this.scanDoctors;
    data['isPatRegPaid'] = this.isPatRegPaid;
    data['paidScanAmount'] = this.paidScanAmount;
    data['isIncludedInPackage'] = this.isIncludedInPackage;
    data['packageName'] = this.packageName;
    data['createdByRole'] = this.createdByRole;
    data['payTypes'] = this.payTypes;
    data['isAccepted'] = this.isAccepted;
    data['scanServiceId'] = this.scanServiceId;
    data['dueAmount'] = this.dueAmount;
    data['practiceMobile'] = this.practiceMobile;
    return data;
  }
}
