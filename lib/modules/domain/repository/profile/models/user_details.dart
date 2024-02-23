part of '../my_profile_repository.dart';
class UserDetails {
  UserDetails({
     this.id,
     this.bloodGroup,
     this.dateOfBirth,
     this.emeregencyConatct,
     this.firstName,
     this.lastName,
     this.passWord,
     this.schoolCode,
     this.schoolId,
     this.schoolName,
     this.createdAt,
      this.updateAt,
     this.teacherId,

  });





  String? id,
      bloodGroup,
      emeregencyConatct,
      lastName,
      passWord,
      schoolCode,
      schoolId,
      schoolName,
      teacherId,
      firstName;
  DateTime? createdAt, updateAt, dateOfBirth;


  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
        id: json['id'],
        createdAt: json['crtdAt'],
        dateOfBirth: json['dob'],
        emeregencyConatct: json['emercnct'],
        firstName: json['fstname'],
        lastName: json['lstname'],
        passWord: json['pasWrd'],
        schoolCode: json['schCode'],
        schoolId: json['schId'],
        schoolName: json['sclname'],
        teacherId: json['tchrId'],
        updateAt: json['updtAt'],
        bloodGroup: json['bldgrp']

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'crtdAt': createdAt,
      'dob': dateOfBirth,
      'emercnct': emeregencyConatct,
      'fstname': firstName,
      'lstname': lastName,
      'pasWrd': passWord,
      'schCode': schoolCode,
      'schId': schoolId,
      'sclname': schoolName,
      'tchrId': teacherId,
      'updtAt': updateAt,
      'bldgrp': bloodGroup,

    };
  }
  UserDetails.getUserDetailsFromModel(UserModel userModel) {
    UserDetails userDetails = UserDetails();

    userDetails.bloodGroup = userModel.bloodGroup;
    userDetails.updateAt = userModel.updateAt;
    userDetails.createdAt = userModel.createdAt;
    userDetails.schoolName = userModel.schoolName;
    userDetails.schoolId = userModel.schoolId;
    userDetails.schoolCode = userModel.schoolCode;
    userDetails.teacherId = userModel.teacherId;
    userDetails.firstName = userModel.firstName;
    userDetails.lastName = userModel.lastName;
    userDetails.id = userModel.id;
    userDetails.passWord = userModel.passWord;
    userDetails.dateOfBirth = userModel.dateOfBirth;
    userDetails.emeregencyConatct = userModel.emeregencyConatct;

  }
}

