part of 'auth_repository.dart';

class VerifyOTPRequest extends RepositoryRequest {
  final String verificationId, code;

  VerifyOTPRequest({required this.verificationId, required this.code});

  @override
  Map<String, dynamic> toJson() {
    return {
      'verification_id': verificationId,
      'code': code,
    };
  }
}

class FetchUserDetailsByPhoneRequest extends RepositoryRequest {
  final String phone;

  FetchUserDetailsByPhoneRequest({required this.phone});

  @override
  Map<String, dynamic> toJson() {
    return {'phone': phone};
  }
}

class SignInWithGoogleRequest extends RepositoryRequest {
  SignInWithGoogleRequest();

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateUserRequest extends RepositoryRequest {
  CreateUserRequest({
    required this.birthYear,
    required this.displayName,
    required this.emailId,
    required this.gender,
    required this.phoneNumber,
    required this.profilePhotoUrl,
    required this.referredBy,
     this.fcmToken,
  });

  final String birthYear,
      displayName,
      emailId,
      gender,
      phoneNumber,
      profilePhotoUrl,
      referredBy;
   String?   fcmToken;


  @override
  Map<String, dynamic> toJson() {
    return {
      'birthYear': birthYear,
      'emailId': emailId,
      'displayName': displayName,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'profilePhotoUrl': profilePhotoUrl,
      'referredBy': referredBy,
      'fcmToken':fcmToken
    };
  }
}
