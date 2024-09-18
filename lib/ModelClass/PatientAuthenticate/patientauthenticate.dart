class PatientAuthenticate {
  int? accountId;
  int? referenceId;
  String? encryptedReferenceId;
  String? fullName;
  int? roleId;
  String? roleName;
  String? email;
  String? mobile;
  int? countryId;
  String? countryCode;
  String? countryName;
  String? isoCode;
  int? sessionId;
  String? lastLoginDate;
  String? thumbnailUrl;
  bool? isAgreed;
  bool? isNew;
  String? token;
  String? referenceToken;
  String? expires;
  String? guid;
  String? referralCode;
  bool? allowVideoCall;
  String? locationId;
  String? locationName;
  String? userName;
  String? umrNo;
  List<dynamic>? roleDepartments;
  String? specializationNames;
  String? departmentIds;

  PatientAuthenticate(
      {this.accountId,
        this.referenceId,
        this.encryptedReferenceId,
        this.fullName,
        this.roleId,
        this.roleName,
        this.email,
        this.mobile,
        this.countryId,
        this.countryCode,
        this.countryName,
        this.isoCode,
        this.sessionId,
        this.lastLoginDate,
        this.thumbnailUrl,
        this.isAgreed,
        this.isNew,
        this.token,
        this.referenceToken,
        this.expires,
        this.guid,
        this.referralCode,
        this.allowVideoCall,
        this.locationId,
        this.locationName,
        this.userName,
        this.umrNo,
        this.roleDepartments,
        this.specializationNames,
        this.departmentIds});

  factory PatientAuthenticate.fromJson(Map<String, dynamic> json) {
    return PatientAuthenticate(
      accountId: json['accountId'],
      referenceId: json['referenceId'],
      encryptedReferenceId: json['encryptedReferenceId'],
      fullName: json['fullName'],
      roleId: json['roleId'],
      roleName: json['roleName'],
      email: json['email'],
      mobile: json['mobile'],
      countryId: json['countryId'],
      countryCode: json['countryCode'],
      countryName: json['countryName'],
      isoCode: json['isoCode'],
      sessionId: json['sessionId'],
      lastLoginDate: json['lastLoginDate'],
      thumbnailUrl: json['thumbnailUrl'],
      isAgreed: json['isAgreed'],
      isNew: json['isNew'],
      token: json['token'],
      referenceToken: json['referenceToken'],
      expires: json['expires'],
      guid: json['guid'],
      referralCode: json['referralCode'],
      allowVideoCall: json['allowVideoCall'],
      locationId: json['locationId'],
      locationName: json['locationName'],
      userName: json['userName'],
      umrNo: json['umrNo'],
      roleDepartments: [],


      specializationNames: json['specializationNames'],
      departmentIds: json['departmentIds'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'referenceId': referenceId,
      'encryptedReferenceId': encryptedReferenceId,
      'fullName': fullName,
      'roleId': roleId,
      'roleName': roleName,
      'email': email,
      'mobile': mobile,
      'countryId': countryId,
      'countryCode': countryCode,
      'countryName': countryName,
      'isoCode': isoCode,
      'sessionId': sessionId,
      'lastLoginDate': lastLoginDate,
      'thumbnailUrl': thumbnailUrl,
      'isAgreed': isAgreed,
      'isNew': isNew,
      'token': token,
      'referenceToken': referenceToken,
      'expires': expires,
      'guid': guid,
      'referralCode': referralCode,
      'allowVideoCall': allowVideoCall,
      'locationId': locationId,
      'locationName': locationName,
      'userName': userName,
      'umrNo': umrNo,
      'roleDepartments': roleDepartments != null ? roleDepartments!.map((x) => x.toJson()).toList() : null,
      'specializationNames': specializationNames,
      'departmentIds': departmentIds,
    };
  }
}

