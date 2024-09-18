class AboutSessionDoctorModel {
  String? status;
  List<Data>? data;
  String? message;
  String? id;
  Null? value;

  AboutSessionDoctorModel(
      {this.status, this.data, this.message, this.id, this.value});

  AboutSessionDoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

class Data {
  String? date;
  String? time;
  Null? leaveTime;
  List<Slots>? slots;
  Null? message;

  Data({this.date, this.time, this.leaveTime, this.slots, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    leaveTime = json['leaveTime'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(new Slots.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['leaveTime'] = this.leaveTime;
    if (this.slots != null) {
      data['slots'] = this.slots!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Slots {
  String? slotValue;
  String? slotTime;
  String? slotName;
  String? status;
  int? tokenNumber;
  int? charge;
  int? duration;
  int? providerAvailabilityId;
  int? sessionId;
  int? doctorSpecializationChargeModuleDetailsId;
  Null? value;
  Null? slotValue24HoursEnd;
  Null? slotName12HoursEnd;
  Null? availableDate;
  Null? id;
  String? slotType;
  Null? otRoomAvailabilityId;
  Null? roomName;
  Null? otRoomId;
  Null? chargeTypesId;
  int? slotCount;
  Null? appointmentId;

  Slots(
      {this.slotValue,
        this.slotTime,
        this.slotName,
        this.status,
        this.tokenNumber,
        this.charge,
        this.duration,
        this.providerAvailabilityId,
        this.sessionId,
        this.doctorSpecializationChargeModuleDetailsId,
        this.value,
        this.slotValue24HoursEnd,
        this.slotName12HoursEnd,
        this.availableDate,
        this.id,
        this.slotType,
        this.otRoomAvailabilityId,
        this.roomName,
        this.otRoomId,
        this.chargeTypesId,
        this.slotCount,
        this.appointmentId});

  Slots.fromJson(Map<String, dynamic> json) {
    slotValue = json['slotValue'];
    slotTime = json['slotTime'];
    slotName = json['slotName'];
    status = json['status'];
    tokenNumber = json['tokenNumber'];
    charge = json['charge'];
    duration = json['duration'];
    providerAvailabilityId = json['providerAvailabilityId'];
    sessionId = json['sessionId'];
    doctorSpecializationChargeModuleDetailsId =
    json['doctorSpecializationChargeModuleDetailsId'];
    value = json['value'];
    slotValue24HoursEnd = json['slotValue24HoursEnd'];
    slotName12HoursEnd = json['slotName12HoursEnd'];
    availableDate = json['availableDate'];
    id = json['id'];
    slotType = json['slotType'];
    otRoomAvailabilityId = json['otRoomAvailabilityId'];
    roomName = json['roomName'];
    otRoomId = json['otRoomId'];
    chargeTypesId = json['chargeTypesId'];
    slotCount = json['slotCount'];
    appointmentId = json['appointmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slotValue'] = this.slotValue;
    data['slotTime'] = this.slotTime;
    data['slotName'] = this.slotName;
    data['status'] = this.status;
    data['tokenNumber'] = this.tokenNumber;
    data['charge'] = this.charge;
    data['duration'] = this.duration;
    data['providerAvailabilityId'] = this.providerAvailabilityId;
    data['sessionId'] = this.sessionId;
    data['doctorSpecializationChargeModuleDetailsId'] =
        this.doctorSpecializationChargeModuleDetailsId;
    data['value'] = this.value;
    data['slotValue24HoursEnd'] = this.slotValue24HoursEnd;
    data['slotName12HoursEnd'] = this.slotName12HoursEnd;
    data['availableDate'] = this.availableDate;
    data['id'] = this.id;
    data['slotType'] = this.slotType;
    data['otRoomAvailabilityId'] = this.otRoomAvailabilityId;
    data['roomName'] = this.roomName;
    data['otRoomId'] = this.otRoomId;
    data['chargeTypesId'] = this.chargeTypesId;
    data['slotCount'] = this.slotCount;
    data['appointmentId'] = this.appointmentId;
    return data;
  }
}
