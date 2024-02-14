part of 'my_profile_repository.dart';

class _EndPoint {
  _EndPoint._();

  static const String getPrivacyPolicy = '/policy/privacy';
  static const String getFaq = '/policy/faq';
  static const String getUserSavedAddresses = '/address/getUserAddress';
  static const String getAddress = '/address/get';
  static const String addAddress = '/address/create';
  static const String updateAddress = '/address/update';
  static const String locationFromPinCode =
      'https://api.postalpincode.in/pincode/';
}
