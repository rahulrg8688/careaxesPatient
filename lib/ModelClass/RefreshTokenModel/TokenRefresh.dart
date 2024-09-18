class RefreshToken {
  String? token;
  String? referenceToken;
  String? expires;
  bool? allowVideoCall;

  RefreshToken(
      {this.token, this.referenceToken, this.expires, this.allowVideoCall});

  RefreshToken.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    referenceToken = json['referenceToken'];
    expires = json['expires'];
    allowVideoCall = json['allowVideoCall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['referenceToken'] = this.referenceToken;
    data['expires'] = this.expires;
    data['allowVideoCall'] = this.allowVideoCall;
    return data;
  }
}
