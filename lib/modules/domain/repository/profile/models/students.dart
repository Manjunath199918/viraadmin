part of '../my_profile_repository.dart';
class StudentDetails {
  StudentDetails({
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
    this.fatherName,
    this.motherName,
  this. UIN,
    this.section,
    this.classId,


  });




  String? id,
      bloodGroup,
      emeregencyConatct,
      lastName,
      passWord,
      schoolCode,
      schoolId,
      schoolName,
  fatherName,
  motherName,
  UIN,
  section,
  classId,


      firstName;
  String? createdAt, updateAt, dateOfBirth;


  factory StudentDetails.fromJson(Map<String, dynamic> json) {
    return StudentDetails(
        id: json['id'],
        createdAt: json["crtdAt"].toString(),
        dateOfBirth:json["dob"].toString(),
        emeregencyConatct: json['emercnct'],
        firstName: json['fstname'],
        lastName: json['lstname'],
        passWord: json['pasWrd'],
        schoolCode: json['schCode'],
        schoolId: json['schId'],
        schoolName: json['sclname'],

        updateAt:json["updtAt"].toString(),
        bloodGroup: json['bldgrp'],
        UIN: json['UIN'],
       classId: json['clsId'],
      fatherName: json['fterName'],
      motherName: json['mterName'],
      section: json['section'],





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
      'updtAt': updateAt,
      'bldgrp': bloodGroup,
      'UIN':UIN,
      'clsId':classId,
       'fterName':fatherName,
       'mterName':motherName,
     'section': section,

    };
  }
 
}

