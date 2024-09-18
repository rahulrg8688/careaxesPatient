class GetSlotsTimeForDoctors {
  String? status;
  List<Data>? data;
  String? message;
  String? id;

  GetSlotsTimeForDoctors({this.status, this.data, this.message, this.id});

  GetSlotsTimeForDoctors.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['id'] = this.id;
    return data;
  }
}

class Data {
  String? date;
  List<Slots>? slots;
  String? roomSlots;
  String? message;
  String? otRoom;

  Data({this.date, this.slots, this.roomSlots, this.message, this.otRoom});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(new Slots.fromJson(v));
      });
    }
    roomSlots = json['roomSlots'];
    message = json['message'];
    otRoom = json['otRoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.slots != null) {
      data['slots'] = this.slots!.map((v) => v.toJson()).toList();
    }
    data['roomSlots'] = this.roomSlots;
    data['message'] = this.message;
    data['otRoom'] = this.otRoom;
    return data;
  }
}

class Slots {
  String? slotValue;
  String? slotTime;
  String? slotName;
  String? status;
  int? tokenNumber;
  dynamic? charge;
  int? duration;
  int? providerAvailabilityId;
  int? sessionId;
  int? doctorSpecializationChargeModuleDetailsId;
  String? value;
  String? slotValue24HoursEnd;
  String? slotName12HoursEnd;
  String? availableDate;
  String? id;
  String? slotType;
  String? otRoomAvailabilityId;
  String? roomName;
  String? otRoomId;
  int? chargeTypesId;
  String? slotCount;
  int? appointmentId;

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
