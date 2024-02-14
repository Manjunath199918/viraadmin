part of 'auth_repository.dart';

class _EndPoint {
  _EndPoint._();

  static const String userDetailsByPhone = '/user/getByPhoneNumber?phoneNumber=';
  static const String createUser = '/user/create';
  static const String updateUser = '/user/update';
  static const String deleteUser = '/user/deleteUserHistory';
  static const String getAppVersion ='/home/minimum/appVersion';
}
