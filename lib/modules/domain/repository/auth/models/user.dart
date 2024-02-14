class UserModel {
  UserModel({
    required this.id,
    required this.birthYear,
    required this.displayName,
    required this.emailId,
    required this.gender,
    required this.phoneNumber,
    required this.profilePhotoUrl,
    required this.referCode,
    required this.appSecurityPin,
    this.createTime,
    this.modifyTime,
    this.deviceOperatingSystem,
    this.fcmToken,
    this.referredBy,
    required this.emailEnabled,
    required this.smsEnabled,
    required this.contactEnabled,
    required this.oneTimeContactsSet,
    required this.kycCompleted,
  });

  String appSecurityPin,
      birthYear,
      displayName,
      emailId,
      gender,
      phoneNumber,
      profilePhotoUrl,
      referCode,
      id;
  String? deviceOperatingSystem, fcmToken, referredBy;

  final bool? emailEnabled, smsEnabled, contactEnabled, oneTimeContactsSet,kycCompleted;

  int? createTime, modifyTime;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      birthYear: json['birthYear'],
      displayName: json['displayName'],
      emailId: json['emailId'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      profilePhotoUrl: json['profilePhotoUrl'],
      referCode: json['referCode'],
      appSecurityPin: json['appSecurityPin'],
      createTime: json['createTime'],
      modifyTime: json['modifyTime'],
      deviceOperatingSystem: json['deviceOperatingSystem'],
      fcmToken: json['fcmToken'],
      referredBy: json['referredBy'],
      emailEnabled: json['emailEnabled'],
      smsEnabled: json['smsEnabled'],
      contactEnabled: json['contactEnabled'],
      oneTimeContactsSet: json['oneTimeContactsSet'],
        kycCompleted: json['kycCompleted']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'appSecurityPin': appSecurityPin,
      'birthYear': birthYear,
      'emailId': emailId,
      'displayName': displayName,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'profilePhotoUrl': profilePhotoUrl,
      'referCode': referCode,
      'createTime': createTime,
      'modifyTime': modifyTime,
      'deviceOperatingSystem': deviceOperatingSystem,
      'fcmToken': fcmToken,
      'referredBy': referredBy,
      'emailEnabled': emailEnabled,
      'smsEnabled': smsEnabled,
      'contactEnabled': contactEnabled,
      'oneTimeContactsSet': oneTimeContactsSet,
      'kycCompleted':kycCompleted
    };
  }
}
