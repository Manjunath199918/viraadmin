part of 'users_repository.dart';

class RegisterTokenRequest extends RepositoryRequest {
  final String deviceToken;
  final String deviceId;
  final String type;

  RegisterTokenRequest({
    required this.deviceToken,
  })  : deviceId = KDeviceInfo.instance.info.deviceId,
        type = Platform.isIOS ? 'ios' : 'android';

  @override
  Map<String, dynamic> toJson() => {
        'device_token': deviceToken,
        'device_id': deviceId,
        'type': type,
      };
}

class AddNewAddressRequest extends RepositoryRequest {
  final Address newAddress;

  AddNewAddressRequest({
    required this.newAddress,
  });

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = newAddress.city;
    map['country'] = newAddress.country;
    map['flatDetails'] = newAddress.flatDetails;
    // map['isDefault'] = newAddress.isDefault;
    //TODO:
    // map['landmark'] = newAddress.landmark;
    map['phoneNumber'] = newAddress.phoneNumber;
    map['pinCode'] = newAddress.pinCode;
    map['state'] = newAddress.state;
    map['streetDetails'] = newAddress.streetDetails;
    map['userName'] = newAddress.userName;
    //TODO:
    // map['uuid'] = uuid;
    return map;
  }
}
