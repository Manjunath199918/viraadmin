import 'package:viraadmin/modules/data/repository/auth/auth_repository.dart';
import 'package:viraadmin/modules/domain/core/auth/auth.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/appversionresponse.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
import 'package:viraadmin/modules/domain/repository/profile/my_profile_repository.dart';
import 'package:viraadmin/modules/domain/repository/repository_responses_abstract.dart';


part 'requests.dart';
part 'responses.dart';

abstract class AuthRepository {
  factory AuthRepository() => AuthRepositoryImpl();

  Future<Result<VerifyOTPSuccess, VerifyOTPFailure>> verifyOTP({
    required VerifyOTPRequest request,
  });

  Future<Result<FetchUserDetailsByPhoneSuccess, FetchUserDetailsByPhoneFailure>>
      fetchUserDetailsByPhone({
    required FetchUserDetailsByPhoneRequest request,
  });

  Future<Result<SignInWithGoogleSuccess, SignInWithGoogleFailure>>
      signInWithGoogle({required SignInWithGoogleRequest request});

  Future<Result<CreateUserSuccess, CreateUserFailure>> createUser({
    required CreateUserRequest request,
    required String firebaseToken,

  });
  Future<Result<GetLatestVersionSuccess, GetLatestVersionFailure>> getLatestVersion();

  Future<Result<UpdateUserSuccess, UpdateUserFailure>> updateUser({
    required String userUuid,
    required UserDetails request,
  });

  Future<Result<DeleteUserSuccess, DeleteUserFailure>> deleteUser(String userUuid);

}
