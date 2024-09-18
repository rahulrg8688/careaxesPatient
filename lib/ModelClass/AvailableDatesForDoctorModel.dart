class AvailableDates {
  int? providerAvailabilityId;
  int? providerId;
  int? providerLocationId;
  String? providerLocationName;
  String? practiceLocationName;
  String? practiceName;
  String? practiceTIN;
  String? date;
  String? dayName;
  int? dateNumber;
  String? status;
  String? from24HrsTime;
  String? to24HrsTime;
  String? from12HrsTime;
  String? to12HrsTime;
  bool? isNewPatientDateAvailable;
  bool? isExistingPatientDateAvailable;

  AvailableDates(
      {this.providerAvailabilityId,
        this.providerId,
        this.providerLocationId,
        this.providerLocationName,
        this.practiceLocationName,
        this.practiceName,
        this.practiceTIN,
        this.date,
        this.dayName,
        this.dateNumber,
        this.status,
        this.from24HrsTime,
        this.to24HrsTime,
        this.from12HrsTime,
        this.to12HrsTime,
        this.isNewPatientDateAvailable,
        this.isExistingPatientDateAvailable});

  AvailableDates.fromJson(Map<String, dynamic> json) {
    providerAvailabilityId = json['providerAvailabilityId'];
    providerId = json['providerId'];
    providerLocationId = json['providerLocationId'];
    providerLocationName = json['providerLocationName'];
    practiceLocationName = json['practiceLocationName'];
    practiceName = json['practiceName'];
    practiceTIN = json['practiceTIN'];
    date = json['date'];
    dayName = json['dayName'];
    dateNumber = json['dateNumber'];
    status = json['status'];
    from24HrsTime = json['from24HrsTime'];
    to24HrsTime = json['to24HrsTime'];
    from12HrsTime = json['from12HrsTime'];
    to12HrsTime = json['to12HrsTime'];
    isNewPatientDateAvailable = json['isNewPatientDateAvailable'];
    isExistingPatientDateAvailable = json['isExistingPatientDateAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['providerAvailabilityId'] = this.providerAvailabilityId;
    data['providerId'] = this.providerId;
    data['providerLocationId'] = this.providerLocationId;
    data['providerLocationName'] = this.providerLocationName;
    data['practiceLocationName'] = this.practiceLocationName;
    data['practiceName'] = this.practiceName;
    data['practiceTIN'] = this.practiceTIN;
    data['date'] = this.date;
    data['dayName'] = this.dayName;
    data['dateNumber'] = this.dateNumber;
    data['status'] = this.status;
    data['from24HrsTime'] = this.from24HrsTime;
    data['to24HrsTime'] = this.to24HrsTime;
    data['from12HrsTime'] = this.from12HrsTime;
    data['to12HrsTime'] = this.to12HrsTime;
    data['isNewPatientDateAvailable'] = this.isNewPatientDateAvailable;
    data['isExistingPatientDateAvailable'] =
        this.isExistingPatientDateAvailable;
    return data;
  }
}
