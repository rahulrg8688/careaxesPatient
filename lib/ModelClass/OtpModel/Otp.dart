class Otp {
  String? otp;
  int? otpExpiresIn;
  int? accountId;
  Null? fullName;
  bool? error;
  String? errorDescription;

  Otp(
      {this.otp,
        this.otpExpiresIn,
        this.accountId,
        this.fullName,
        this.error,
        this.errorDescription});

  Otp.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    otpExpiresIn = json['otpExpiresIn'];
    accountId = json['accountId'];
    fullName = json['fullName'];
    error = json['error'];
    errorDescription = json['errorDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['otpExpiresIn'] = this.otpExpiresIn;
    data['accountId'] = this.accountId;
    data['fullName'] = this.fullName;
    data['error'] = this.error;
    data['errorDescription'] = this.errorDescription;
    return data;
  }
}
