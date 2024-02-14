part of '../my_profile_repository.dart';

class UserDetails {
  String? appSecurityPin;
  String? birthYear;
  bool? contactEnabled;
  int? createTime;
  String? deviceOperatingSystem;
  String? displayName;
  bool? emailEnabled;
  String? emailId;
  String? fcmToken;
  String? gender;
  String? id;
  int? modifyTime;
  bool? oneTimeContactsSet;
  String? phoneNumber;
  String? profilePhotoUrl;
  String? referCode;
  String? referredBy;
  bool? smsEnabled;

  UserDetails(
      {this.appSecurityPin,
        this.birthYear,
        this.contactEnabled,
        this.createTime,
        this.deviceOperatingSystem,
        this.displayName,
        this.emailEnabled,
        this.emailId,
        this.fcmToken,
        this.gender,
        this.id,
        this.modifyTime,
        this.oneTimeContactsSet,
        this.phoneNumber,
        this.profilePhotoUrl,
        this.referCode,
        this.referredBy,
        this.smsEnabled});

  UserDetails.fromJson(Map<String, dynamic> json) {
    appSecurityPin = json['appSecurityPin'];
    birthYear = json['birthYear'];
    contactEnabled = json['contactEnabled'];
    createTime = json['createTime'];
    deviceOperatingSystem = json['deviceOperatingSystem'];
    displayName = json['displayName'];
    emailEnabled = json['emailEnabled'];
    emailId = json['emailId'];
    fcmToken = json['fcmToken'];
    gender = json['gender'];
    id = json['id'];
    modifyTime = json['modifyTime'];
    oneTimeContactsSet = json['oneTimeContactsSet'];
    phoneNumber = json['phoneNumber'];
    profilePhotoUrl = json['profilePhotoUrl'];
    referCode = json['referCode'];
    referredBy = json['referredBy'];
    smsEnabled = json['smsEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appSecurityPin'] = this.appSecurityPin;
    data['birthYear'] = this.birthYear;
    data['contactEnabled'] = this.contactEnabled;
    data['createTime'] = this.createTime;
    data['deviceOperatingSystem'] = this.deviceOperatingSystem;
    data['displayName'] = this.displayName;
    data['emailEnabled'] = this.emailEnabled;
    data['emailId'] = this.emailId;
    data['fcmToken'] = this.fcmToken;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['modifyTime'] = this.modifyTime;
    data['oneTimeContactsSet'] = this.oneTimeContactsSet;
    data['phoneNumber'] = this.phoneNumber;
    data['profilePhotoUrl'] = this.profilePhotoUrl;
    data['referCode'] = this.referCode;
    data['referredBy'] = this.referredBy;
    data['smsEnabled'] = this.smsEnabled;
    return data;
  }

  UserDetails.getUserDetailsFromModel(UserModel userModel) {
    UserDetails userDetails = UserDetails();

    userDetails.appSecurityPin = userModel.appSecurityPin;
    userDetails.birthYear = userModel.birthYear;
    userDetails.createTime = userModel.createTime;
    userDetails.deviceOperatingSystem = userModel.deviceOperatingSystem;
    userDetails.displayName = userModel.displayName;
    userDetails.emailEnabled = userModel.emailEnabled;
    userDetails.emailId = userModel.emailId;
    userDetails.fcmToken = userModel.fcmToken;
    userDetails.gender = userModel.gender;
    userDetails.id = userModel.id;
    userDetails.modifyTime = userModel.modifyTime;
    userDetails.phoneNumber = userModel.phoneNumber;
    userDetails.profilePhotoUrl = userModel.profilePhotoUrl;
    userDetails.referCode = userModel.referCode;
    userDetails.referredBy = userModel.referredBy;
    userDetails.smsEnabled = userModel.smsEnabled;
    userDetails.contactEnabled = userModel.contactEnabled;
    userDetails.oneTimeContactsSet = userModel.oneTimeContactsSet;
  }
}