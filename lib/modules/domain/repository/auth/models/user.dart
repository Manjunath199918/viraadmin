class UserModel {
  UserModel({
    required this.id,
    required this.bloodGroup,
    required this.dateOfBirth,
    required this.emeregencyConatct,
    required this.firstName,
    required this.lastName,
    required this.passWord,
    required this.schoolCode,
    required this.schoolId,
    required this.schoolName,
    required this.createdAt,
    required  this.updateAt,
    required this.teacherId,

  });





  String id,
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


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
}
