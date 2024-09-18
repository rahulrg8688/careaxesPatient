class Specialitions {
  List<dynamic> ? providers;
  List<Specializations>? specializations;
  List<dynamic> ? appointments;

  Specialitions({this.providers, this.specializations, this.appointments});

  Specialitions.fromJson(Map<String, dynamic> json) {
    if (json['providers'] != null) {
      providers = [];
      json['providers'].forEach((v) {
        //providers!.add(new Provider.fromJson(v));
      });
    }
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(new Specializations.fromJson(v));
      });
    }
    if (json['appointments'] != null) {
      appointments =[];
      json['appointments'].forEach((v) {
        // appointments!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.providers != null) {
      data['providers'] = this.providers!.map((v) => v.toJson()).toList();
    }
    if (this.specializations != null) {
      data['specializations'] =
          this.specializations!.map((v) => v.toJson()).toList();
    }
    if (this.appointments != null) {
      data['appointments'] = this.appointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specializations {
  int? id;
  dynamic appointmentNo;
  dynamic encryptedId;
  String? value;
  String? name;
  dynamic optionalId;
  String? optionalText;
  dynamic optionalText2;
  dynamic cost;
  String? optionalText1;
  dynamic optionalData;
  dynamic isSelected;
  dynamic date;
  dynamic time;
  dynamic isSalucro;
  dynamic status;
  dynamic duration;
  dynamic optionalId1;
  dynamic optionalText3;
  dynamic exists;
  dynamic gender;
  dynamic type;
  dynamic optionalId2;
  dynamic optionalId3;
  dynamic optionalId4;
  dynamic discountType;
  dynamic discountPercentage;
  dynamic discountAmount;
  dynamic optionalText4;
  dynamic dietSlotName;
  dynamic admissionId;
  dynamic mobile;
  dynamic patientId;
  dynamic patientName;
  String? fromDate;
  String? toDate;
  dynamic admissionNo;
  dynamic billNumber;
  dynamic locationId;

  Specializations(
      {this.id,
        this.appointmentNo,
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
        this.locationId});

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentNo = json['appointmentNo'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointmentNo'] = this.appointmentNo;
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
    return data;
  }
}
