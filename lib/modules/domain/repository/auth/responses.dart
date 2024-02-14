part of 'auth_repository.dart';

enum AuthFailureReason {
  unknown,
  invalidRequest,
}

class AuthSucess extends RepositorySuccess {
  AuthSucess({
    String? message,
  }) : super(message: message);
}

class AuthFailure extends RepositoryFailure {
  AuthFailure({
    String? message,
    int? statusCode,
    this.reason = AuthFailureReason.unknown,
  }) : super(message: message, statusCode: statusCode);

  final AuthFailureReason reason;
}

class VerifyOTPSuccess extends AuthSucess {}

class VerifyOTPFailure extends AuthFailure {
  VerifyOTPFailure({
    String? message,
    int? statusCode,
  }) : super(message: message, statusCode: statusCode);
}

class FetchUserDetailsByPhoneSuccess extends AuthSucess {
  FetchUserDetailsByPhoneSuccess({
    String? message,
    this.statusCode,
    required this.user,
    required this.authCred,
  });

  final int? statusCode;
  final UserModel user;
  final AuthCred authCred;
}

class FetchUserDetailsByPhoneFailure extends AuthFailure {
  FetchUserDetailsByPhoneFailure({
    String? message,
    int? statusCode,
  }) : super(message: message, statusCode: statusCode);
}

class SignInWithGoogleSuccess extends AuthSucess {
  SignInWithGoogleSuccess({this.email});

  final String? email;
}

class SignInWithGoogleFailure extends AuthFailure {}

class CreateUserSuccess extends AuthSucess {
  CreateUserSuccess({required this.user});

  final UserModel user;
}

class CreateUserFailure extends AuthFailure {}
class GetLatestVersionSuccess extends AuthSucess {
  GetLatestVersionSuccess({required this.appVersion});

  final AppVersionModel appVersion;
}

class GetLatestVersionFailure extends AuthFailure {}

class UpdateUserSuccess extends AuthSucess {
  UpdateUserSuccess();
}

class UpdateUserFailure extends AuthFailure {}

class DeleteUserSuccess extends AuthSucess {
  DeleteUserSuccess();
}

class DeleteUserFailure extends AuthFailure {}
