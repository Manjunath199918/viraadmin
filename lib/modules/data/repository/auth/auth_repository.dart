import 'package:viraadmin/environment/environment.dart';
import 'package:viraadmin/modules/domain/core/auth/auth.dart';
import 'package:viraadmin/modules/domain/core/network/network.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/appversionresponse.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
import 'package:viraadmin/modules/domain/repository/profile/my_profile_repository.dart';
import 'package:viraadmin/modules/domain/repository/repository_responses_abstract.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'end_points.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Result<VerifyOTPSuccess, VerifyOTPFailure>> verifyOTP({
    required VerifyOTPRequest request,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: request.verificationId,
      smsCode: request.code,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (f) {
      return Failure(VerifyOTPFailure(message: f.message));
    } catch (e) {
      return Failure(VerifyOTPFailure(message: 'Enter the correct OTP.'));
    }

    return Success(VerifyOTPSuccess());
  }

  @override
  Future<Result<FetchUserDetailsByPhoneSuccess, FetchUserDetailsByPhoneFailure>>
      fetchUserDetailsByPhone({
    required FetchUserDetailsByPhoneRequest request,
  }) async {
    final client = await KNetworkingBox.instance.unsecureClient(loggingEnabled: false);
    final url = KEnvironment.config.apiUrl +
        _EndPoint.userDetailsByPhone +
        request.phone;


   String? firebaseToken = await KAuth.instance.getters.token;


    try {
      final response = await client!.get(url,options:
      Options(headers: {'verificationToken':firebaseToken ?? ''}));


      Map<String, dynamic> headers = {
        'accessToken': response.headers.value('authorization'),
        'refreshToken': response.headers.value('authorization'),
      };

      if (response.statusCode.isSuccess) {
        KAuth.instance.actions.onLogIn(AuthCred.fromJson(headers));
        return Success(
          FetchUserDetailsByPhoneSuccess(
            statusCode: response.statusCode!,
            user: UserModel.fromJson(response.data),
            authCred: AuthCred.fromJson(headers),
          ),
        );
      }

      return Failure(FetchUserDetailsByPhoneFailure(
        statusCode: response.statusCode,
      ));
    } catch (e) {
      return Failure(FetchUserDetailsByPhoneFailure());
    }
  }

  @override
  Future<Result<SignInWithGoogleSuccess, SignInWithGoogleFailure>>
      signInWithGoogle({required SignInWithGoogleRequest request}) async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      return Success(SignInWithGoogleSuccess(
        email: googleUser!.email,
      ));
    } catch (e) {
      return Failure(SignInWithGoogleFailure());
    }
  }

  @override
  Future<Result<CreateUserSuccess, CreateUserFailure>> createUser({
    required CreateUserRequest request,
    required String firebaseToken,

  }) async {
    final client = await KNetworkingBox.instance.unsecureClient(loggingEnabled: false);
    final url = KEnvironment.config.apiUrl + _EndPoint.createUser;

    final data = request.toJson();
    data['appSecurityPin'] = '';

    try {
      final response = await client!.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
            'verificationToken':firebaseToken
          },
        ),
      );

      if (response.statusCode == 201) {
        return Success(
          CreateUserSuccess(
            user: UserModel.fromJson(response.data),
          ),
        );
      }
      return Failure(CreateUserFailure());
    } catch (e) {
      return Failure(CreateUserFailure());
    }
  }

  @override
  Future<Result<UpdateUserSuccess, UpdateUserFailure>> updateUser({
    required String userUuid,
    required UserDetails request,
  }) async {
    final client = await KNetworkingBox.instance.unsecureClient(loggingEnabled: false);
    final url =
        '${KEnvironment.config.apiUrl}${_EndPoint.updateUser}?userUuid=$userUuid';

    final data = request.toJson();
    data['appSecurityPin'] = '';

    try {
      final response = await client!.put(
        url,
        data: data,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json'
          },
        ),
      );

      if (response.statusCode == 200) {
        return Success(
          UpdateUserSuccess(),
        );
      }
      return Failure(UpdateUserFailure());
    } catch (e) {
      return Failure(UpdateUserFailure());
    }
  }

  @override
  Future<Result<DeleteUserSuccess, DeleteUserFailure>> deleteUser(
      String userId) async {
    final client =
        await KNetworkingBox.instance.unsecureClient(loggingEnabled: false);
    if (client != null) {
      final response = await client
          .delete(_EndPoint.deleteUser, queryParameters: {'userUuid': userId});

      if (response.statusCode.isSuccess) {
        final data = response.data;

        return Success(DeleteUserSuccess());
      } else {
        return Failure(DeleteUserFailure());
      }
    } else {
      return Failure(DeleteUserFailure());
    }
  }

  @override
  Future<Result<GetLatestVersionSuccess, GetLatestVersionFailure>> getLatestVersion() async {
    final client = await KNetworkingBox.instance.unsecureClient(loggingEnabled: false);
    final url = KEnvironment.config.apiUrl +
        _EndPoint.getAppVersion ;

    try {
      final response = await client!.get(url);


      if (response.statusCode.isSuccess) {

        return Success(
          GetLatestVersionSuccess(
            appVersion: AppVersionModel.fromJson(response.data)


          ),
        );
      }

      return Failure(GetLatestVersionFailure(

      ));
    } catch (e) {
      return Failure(GetLatestVersionFailure());
    }
  }
}
