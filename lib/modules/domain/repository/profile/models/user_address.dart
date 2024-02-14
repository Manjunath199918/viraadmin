part of '../my_profile_repository.dart';

class UserAddress {
  List<Address>? addressList;
  String? id;
  int? createTime;
  int? modifyTime;
  String? primaryUserUuid;

  UserAddress(
      {this.addressList,
        this.id,
        this.createTime,
        this.modifyTime,
        this.primaryUserUuid});

  UserAddress.fromJson(Map<String, dynamic> json) {
    if (json['addressList'] != null) {
      addressList = <Address>[];
      json['addressList'].forEach((v) {
        addressList!.add(new Address.fromJson(v));
      });
    }
    id = json['id'];
    createTime = json['createTime'];
    modifyTime = json['modifyTime'];
    primaryUserUuid = json['primaryUserUuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressList != null) {
      data['addressList'] = this.addressList!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['createTime'] = this.createTime;
    data['modifyTime'] = this.modifyTime;
    data['primaryUserUuid'] = this.primaryUserUuid;
    return data;
  }
}