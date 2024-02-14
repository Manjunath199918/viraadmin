part of '../my_profile_repository.dart';

class Address {
  String? city;
  String? country;
  String? flatDetails;
  String? phoneNumber;
  String? pinCode;
  String? recipientName;
  String? state;
  String? streetDetails;
  String? userName;
  String? uuid;

  Address(
      {this.city,
        this.country,
        this.flatDetails,
        this.phoneNumber,
        this.pinCode,
        this.recipientName,
        this.state,
        this.streetDetails,
        this.userName,
        this.uuid});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    flatDetails = json['flatDetails'];
    phoneNumber = json['phoneNumber'];
    pinCode = json['pinCode'];
    recipientName = json['recipientName'];
    state = json['state'];
    streetDetails = json['streetDetails'];
    userName = json['userName'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    data['flatDetails'] = this.flatDetails;
    data['phoneNumber'] = this.phoneNumber;
    data['pinCode'] = this.pinCode;
    data['recipientName'] = this.recipientName;
    data['state'] = this.state;
    data['streetDetails'] = this.streetDetails;
    data['userName'] = this.userName;
    data['uuid'] = this.uuid;
    return data;
  }
}