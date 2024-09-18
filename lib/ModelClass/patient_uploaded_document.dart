class UploadedDocument {
  int? patientDocumentId;
  int? patientId;
  String? patientName;
  int? uploadedBy;
  String? uploadedByName;
  String? uploadedByRole;
  String? documentName;
  String? documentType;
  String? contentType;
  int? size;
  String? description;
  String? documentUrl;
  String? thumbnailUrl;
  String? uploadedDate;
  bool? active;
  String? modifiedBy;
  String? modifiedDate;
  int? totalItems;
  bool? isRead;
  String? encryptedPatientId;

  UploadedDocument(
      {this.patientDocumentId,
        this.patientId,
        this.patientName,
        this.uploadedBy,
        this.uploadedByName,
        this.uploadedByRole,
        this.documentName,
        this.documentType,
        this.contentType,
        this.size,
        this.description,
        this.documentUrl,
        this.thumbnailUrl,
        this.uploadedDate,
        this.active,
        this.modifiedBy,
        this.modifiedDate,
        this.totalItems,
        this.isRead,
        this.encryptedPatientId});

  UploadedDocument.fromJson(Map<String, dynamic> json) {
    patientDocumentId = json['patientDocumentId'];
    patientId = json['patientId'];
    patientName = json['patientName'];
    uploadedBy = json['uploadedBy'];
    uploadedByName = json['uploadedByName'];
    uploadedByRole = json['uploadedByRole'];
    documentName = json['documentName'];
    documentType = json['documentType'];
    contentType = json['contentType'];
    size = json['size'];
    description = json['description'];
    documentUrl = json['documentUrl'];
    thumbnailUrl = json['thumbnailUrl'];
    uploadedDate = json['uploadedDate'];
    active = json['active'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
    totalItems = json['totalItems'];
    isRead = json['isRead'];
    encryptedPatientId = json['encryptedPatientId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientDocumentId'] = this.patientDocumentId;
    data['patientId'] = this.patientId;
    data['patientName'] = this.patientName;
    data['uploadedBy'] = this.uploadedBy;
    data['uploadedByName'] = this.uploadedByName;
    data['uploadedByRole'] = this.uploadedByRole;
    data['documentName'] = this.documentName;
    data['documentType'] = this.documentType;
    data['contentType'] = this.contentType;
    data['size'] = this.size;
    data['description'] = this.description;
    data['documentUrl'] = this.documentUrl;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['uploadedDate'] = this.uploadedDate;
    data['active'] = this.active;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedDate'] = this.modifiedDate;
    data['totalItems'] = this.totalItems;
    data['isRead'] = this.isRead;
    data['encryptedPatientId'] = this.encryptedPatientId;
    return data;
  }
}
