part of '../my_profile_repository.dart';

class EditProfile {
  String? birthYear;
  String? displayName;
  String? emailId;
  String? gender;
  String? profilePhotoUrl;

  EditProfile(
      {this.birthYear,
        this.displayName,
        this.emailId,
        this.gender,
        this.profilePhotoUrl});

  EditProfile.fromJson(Map<String, dynamic> json) {
    birthYear = json['birthYear'];
    displayName = json['displayName'];
    emailId = json['emailId'];
    gender = json['gender'];
    profilePhotoUrl = json['profilePhotoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthYear'] = this.birthYear;
    data['displayName'] = this.displayName;
    data['emailId'] = this.emailId;
    data['gender'] = this.gender;
    data['profilePhotoUrl'] = this.profilePhotoUrl;
    return data;
  }
}