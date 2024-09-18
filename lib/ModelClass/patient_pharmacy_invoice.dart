class PatientPharmacyInvoice{
  int? pharmacySaleHeaderId;
  String? billNumber;
  String? paidVia;
  int? paymentNumber;
  String? saleDate;
  String? patientName;
  String? mobile;
  String? umrNo;
  int? patientId;
  String? providerName;
  String? createdByName;
  String? role;
  int? accountId;
  String? createdBy;
  int? totalAmount;
  bool? pharmacyBillType;
  int? saleReturnHeaderId;
  double? totalGST;
  String? retailName;
  int? totalItems;
  int? locationId;
  int? pageSize;
  int? pageIndex;
  String? encryptedPharmacySaleHeaderId;

  PatientPharmacyInvoice(
      {this.pharmacySaleHeaderId,
        this.billNumber,
        this.paidVia,
        this.paymentNumber,
        this.saleDate,
        this.patientName,
        this.mobile,
        this.umrNo,
        this.patientId,
        this.providerName,
        this.createdByName,
        this.role,
        this.accountId,
        this.createdBy,
        this.totalAmount,
        this.pharmacyBillType,
        this.saleReturnHeaderId,
        this.totalGST,
        this.retailName,
        this.totalItems,
        this.locationId,
        this.pageSize,
        this.pageIndex,
        this.encryptedPharmacySaleHeaderId});

  PatientPharmacyInvoice.fromJson(Map<String, dynamic> json) {
    pharmacySaleHeaderId = json['pharmacySaleHeaderId'];
    billNumber = json['billNumber'];
    paidVia = json['paidVia'];
    paymentNumber = json['paymentNumber'];
    saleDate = json['saleDate'];
    patientName = json['patientName'];
    mobile = json['mobile'];
    umrNo = json['umrNo'];
    patientId = json['patientId'];
    providerName = json['providerName'];
    createdByName = json['createdByName'];
    role = json['role'];
    accountId = json['accountId'];
    createdBy = json['createdBy'];
    totalAmount = json['totalAmount'];
    pharmacyBillType = json['pharmacyBillType'];
    saleReturnHeaderId = json['saleReturnHeaderId'];
    totalGST = (json['totalGST'] as num?)?.toDouble();
    retailName = json['retailName'];
    totalItems = json['totalItems'];
    locationId = json['locationId'];
    pageSize = json['pageSize'];
    pageIndex = json['pageIndex'];
    encryptedPharmacySaleHeaderId = json['encryptedPharmacySaleHeaderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pharmacySaleHeaderId'] = this.pharmacySaleHeaderId;
    data['billNumber'] = this.billNumber;
    data['paidVia'] = this.paidVia;
    data['paymentNumber'] = this.paymentNumber;
    data['saleDate'] = this.saleDate;
    data['patientName'] = this.patientName;
    data['mobile'] = this.mobile;
    data['umrNo'] = this.umrNo;
    data['patientId'] = this.patientId;
    data['providerName'] = this.providerName;
    data['createdByName'] = this.createdByName;
    data['role'] = this.role;
    data['accountId'] = this.accountId;
    data['createdBy'] = this.createdBy;
    data['totalAmount'] = this.totalAmount;
    data['pharmacyBillType'] = this.pharmacyBillType;
    data['saleReturnHeaderId'] = this.saleReturnHeaderId;
    data['totalGST'] = this.totalGST;
    data['retailName'] = this.retailName;
    data['totalItems'] = this.totalItems;
    data['locationId'] = this.locationId;
    data['pageSize'] = this.pageSize;
    data['pageIndex'] = this.pageIndex;
    data['encryptedPharmacySaleHeaderId'] = this.encryptedPharmacySaleHeaderId;
    return data;
  }
}
