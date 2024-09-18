class CategoriesList {
  int? id;
  String? appointmentNo;
  String? salutation;
  String? encryptedId;
  String? value;
  String? name;
  String? optionalId;
  String? optionalText;
  String? optionalText2;
  String? cost;
  String? optionalText1;
  String? optionalData;
  String? isSelected;
  String? date;
  String? time;
  String? isSalucro;
  String? status;
  String? duration;
  String? optionalId1;
  String? optionalText3;
  String? exists;
  String? gender;
  String? type;
  String? optionalId2;
  String? optionalId3;
  String? optionalId4;
  String? discountType;
  String? discountPercentage;
  String? discountAmount;
  String? optionalText4;
  String? dietSlotName;
  String? admissionId;
  String? mobile;
  String? patientId;
  String? patientName;
  String? fromDate;
  String? toDate;
  String? admissionNo;
  String? billNumber;
  String? locationId;
  String? age;
  String? aadharNo;
  String? maritalStatus;
  String? address;
  String? lookupId;
  String? lookupName;
  String? grnNumber;
  String? imageUrl;

  CategoriesList(
      {this.id,
        this.appointmentNo,
        this.salutation,
        this.encryptedId,
        this.value,
        this.name,
        this.optionalId,
        this.optionalText,
        this.optionalText2,
        this.cost,
        this.optionalText1,
        this.optionalData,
        this.isSelected,
        this.date,
        this.time,
        this.isSalucro,
        this.status,
        this.duration,
        this.optionalId1,
        this.optionalText3,
        this.exists,
        this.gender,
        this.type,
        this.optionalId2,
        this.optionalId3,
        this.optionalId4,
        this.discountType,
        this.discountPercentage,
        this.discountAmount,
        this.optionalText4,
        this.dietSlotName,
        this.admissionId,
        this.mobile,
        this.patientId,
        this.patientName,
        this.fromDate,
        this.toDate,
        this.admissionNo,
        this.billNumber,
        this.locationId,
        this.age,
        this.aadharNo,
        this.maritalStatus,
        this.address,
        this.lookupId,
        this.lookupName,
        this.grnNumber,
        this.imageUrl});

  CategoriesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentNo = json['appointmentNo'];
    salutation = json['salutation'];
    encryptedId = json['encryptedId'];
    value = json['value'];
    name = json['name'];
    optionalId = json['optionalId'];
    optionalText = json['optionalText'];
    optionalText2 = json['optionalText2'];
    cost = json['cost'];
    optionalText1 = json['optionalText1'];
    optionalData = json['optionalData'];
    isSelected = json['isSelected'];
    date = json['date'];
    time = json['time'];
    isSalucro = json['isSalucro'];
    status = json['status'];
    duration = json['duration'];
    optionalId1 = json['optionalId1'];
    optionalText3 = json['optionalText3'];
    exists = json['exists'];
    gender = json['gender'];
    type = json['type'];
    optionalId2 = json['optionalId2'];
    optionalId3 = json['optionalId3'];
    optionalId4 = json['optionalId4'];
    discountType = json['discountType'];
    discountPercentage = json['discountPercentage'];
    discountAmount = json['discountAmount'];
    optionalText4 = json['optionalText4'];
    dietSlotName = json['dietSlotName'];
    admissionId = json['admissionId'];
    mobile = json['mobile'];
    patientId = json['patientId'];
    patientName = json['patientName'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    admissionNo = json['admissionNo'];
    billNumber = json['billNumber'];
    locationId = json['locationId'];
    age = json['age'];
    aadharNo = json['aadharNo'];
    maritalStatus = json['maritalStatus'];
    address = json['address'];
    lookupId = json['lookupId'];
    lookupName = json['lookupName'];
    grnNumber = json['grnNumber'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointmentNo'] = this.appointmentNo;
    data['salutation'] = this.salutation;
    data['encryptedId'] = this.encryptedId;
    data['value'] = this.value;
    data['name'] = this.name;
    data['optionalId'] = this.optionalId;
    data['optionalText'] = this.optionalText;
    data['optionalText2'] = this.optionalText2;
    data['cost'] = this.cost;
    data['optionalText1'] = this.optionalText1;
    data['optionalData'] = this.optionalData;
    data['isSelected'] = this.isSelected;
    data['date'] = this.date;
    data['time'] = this.time;
    data['isSalucro'] = this.isSalucro;
    data['status'] = this.status;
    data['duration'] = this.duration;
    data['optionalId1'] = this.optionalId1;
    data['optionalText3'] = this.optionalText3;
    data['exists'] = this.exists;
    data['gender'] = this.gender;
    data['type'] = this.type;
    data['optionalId2'] = this.optionalId2;
    data['optionalId3'] = this.optionalId3;
    data['optionalId4'] = this.optionalId4;
    data['discountType'] = this.discountType;
    data['discountPercentage'] = this.discountPercentage;
    data['discountAmount'] = this.discountAmount;
    data['optionalText4'] = this.optionalText4;
    data['dietSlotName'] = this.dietSlotName;
    data['admissionId'] = this.admissionId;
    data['mobile'] = this.mobile;
    data['patientId'] = this.patientId;
    data['patientName'] = this.patientName;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    data['admissionNo'] = this.admissionNo;
    data['billNumber'] = this.billNumber;
    data['locationId'] = this.locationId;
    data['age'] = this.age;
    data['aadharNo'] = this.aadharNo;
    data['maritalStatus'] = this.maritalStatus;
    data['address'] = this.address;
    data['lookupId'] = this.lookupId;
    data['lookupName'] = this.lookupName;
    data['grnNumber'] = this.grnNumber;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
