class LabsInvoiceModel {
  int? newLabBookingHeaderId;
  String? requisitionNumber;
  String? billType;
  String? patientId;
  String? createdDate;
  int? amount;
  int? headerId;
  String? patientName;
  String? umrNo;
  String? doctorName;
  String? pageIndex;
  String? pageSize;
  int? totalItems;
  String? encryptedHeaderId;

  LabsInvoiceModel(
      {this.newLabBookingHeaderId,
        this.requisitionNumber,
        this.billType,
        this.patientId,
        this.createdDate,
        this.amount,
        this.headerId,
        this.patientName,
        this.umrNo,
        this.doctorName,
        this.pageIndex,
        this.pageSize,
        this.totalItems,
        this.encryptedHeaderId});

  LabsInvoiceModel.fromJson(Map<String, dynamic> json) {
    newLabBookingHeaderId = json['newLabBookingHeaderId'];
    requisitionNumber = json['requisitionNumber'];
    billType = json['billType'];
    patientId = json['patientId'];
    createdDate = json['createdDate'];
    amount = json['amount'];
    headerId = json['headerId'];
    patientName = json['patientName'];
    umrNo = json['umrNo'];
    doctorName = json['doctorName'];
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    totalItems = json['totalItems'];
    encryptedHeaderId = json['encryptedHeaderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newLabBookingHeaderId'] = this.newLabBookingHeaderId;
    data['requisitionNumber'] = this.requisitionNumber;
    data['billType'] = this.billType;
    data['patientId'] = this.patientId;
    data['createdDate'] = this.createdDate;
    data['amount'] = this.amount;
    data['headerId'] = this.headerId;
    data['patientName'] = this.patientName;
    data['umrNo'] = this.umrNo;
    data['doctorName'] = this.doctorName;
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['totalItems'] = this.totalItems;
    data['encryptedHeaderId'] = this.encryptedHeaderId;
    return data;
  }
}
