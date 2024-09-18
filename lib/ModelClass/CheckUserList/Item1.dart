class Item1 {
  int? accountId;
  int? roleId;
  String? roleName;
  int? referenceId;
  String? saltKey;
  String? fullName;
  String? email;
  String? mobile;
  int? countryId;
  String? countryCode;
  bool? isAgreed;
  String? agreedDate;
  bool? isLocked;
  bool? otpVerified;
  bool? manualVerified;
  bool? passwordExist;
  int? failedLoginAttempts;
  String? lastFailedLoginDate;
  String? lastLoginDate;
  bool? active;
  String? createdBy;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;
  String? status;
  int? totalItems;
  String? patientGuid;
  String? guid2;
  String? description;
  String? locationIdentifiers;
  String? userName;
  String? thumbnailUrl;

  Item1(
      {this.accountId,
        this.roleId,
        this.roleName,
        this.referenceId,
        this.saltKey,
        this.fullName,
        this.email,
        this.mobile,
        this.countryId,
        this.countryCode,
        this.isAgreed,
        this.agreedDate,
        this.isLocked,
        this.otpVerified,
        this.manualVerified,
        this.passwordExist,
        this.failedLoginAttempts,
        this.lastFailedLoginDate,
        this.lastLoginDate,
        this.active,
        this.createdBy,
        this.createdDate,
        this.modifiedBy,
        this.modifiedDate,
        this.status,
        this.totalItems,
        this.patientGuid,
        this.guid2,
        this.description,
        this.locationIdentifiers,
        this.userName,
        this.thumbnailUrl});

  Item1.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    roleId = json['roleId'];
    roleName = json['roleName'];
    referenceId = json['referenceId'];
    saltKey = json['saltKey'];
    fullName = json['fullName'];
    email = json['email'];
    mobile = json['mobile'];
    countryId = json['countryId'];
    countryCode = json['countryCode'];
    isAgreed = json['isAgreed'];
    agreedDate = json['agreedDate'];
    isLocked = json['isLocked'];
    otpVerified = json['otpVerified'];
    manualVerified = json['manualVerified'];
    passwordExist = json['passwordExist'];
    failedLoginAttempts = json['failedLoginAttempts'];
    lastFailedLoginDate = json['lastFailedLoginDate'];
    lastLoginDate = json['lastLoginDate'];
    active = json['active'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    modifiedBy = json['modifiedBy'];
    modifiedDate = json['modifiedDate'];
    status = json['status'];
    totalItems = json['totalItems'];
    patientGuid = json['patientGuid'];
    guid2 = json['guid2'];
    description = json['description'];
    locationIdentifiers = json['locationIdentifiers'];
    userName = json['userName'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountId'] = this.accountId;
    data['roleId'] = this.roleId;
    data['roleName'] = this.roleName;
    data['referenceId'] = this.referenceId;
    data['saltKey'] = this.saltKey;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['countryId'] = this.countryId;
    data['countryCode'] = this.countryCode;
    data['isAgreed'] = this.isAgreed;
    data['agreedDate'] = this.agreedDate;
    data['isLocked'] = this.isLocked;
    data['otpVerified'] = this.otpVerified;
    data['manualVerified'] = this.manualVerified;
    data['passwordExist'] = this.passwordExist;
    data['failedLoginAttempts'] = this.failedLoginAttempts;
    data['lastFailedLoginDate'] = this.lastFailedLoginDate;
    data['lastLoginDate'] = this.lastLoginDate;
    data['active'] = this.active;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedDate'] = this.modifiedDate;
    data['status'] = this.status;
    data['totalItems'] = this.totalItems;
    data['patientGuid'] = this.patientGuid;
    data['guid2'] = this.guid2;
    data['description'] = this.description;
    data['locationIdentifiers'] = this.locationIdentifiers;
    data['userName'] = this.userName;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}