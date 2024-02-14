part of '../network.dart';

class DioTokenInvalidInterceptor extends Interceptor {
  final DioNetworkingClient client;
  DioTokenInvalidInterceptor({
    required this.client,
  });
  UserModel? user;
  final KPersistentStorage persistentStorage = KPersistentStorage();
  final AuthRepository _authRepository = AuthRepository();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //Deep link url interception issues can be fixed here

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    try {
      if (response.statusCode == 401) {
        if (response.headers['authorizationResponse']![0] == 'expired') {
          await retryResponse(response, handler);
          return;
        }
      } else if (response.statusCode == 403 ||
          KAuth.instance.getters.authCred == null) {
        await retryResponse(response, handler);
        return;
      }
    } catch (e) {
      await retryResponse(response, handler);
      return;
    }

    return super.onResponse(response, handler);
  }

  Future<dynamic> retryResponse(Response response, ResponseInterceptorHandler handler) async {
    user = await persistentStorage.retrieve(
      key: 'user_details',
      decoder: (val) {
        return UserModel.fromJson(jsonDecode(val));
      },
    );
    await _authRepository.fetchUserDetailsByPhone(
        request: FetchUserDetailsByPhoneRequest(phone: user!.phoneNumber));
    final requestOptions = response.requestOptions;

    requestOptions.headers['authorization'] =
        KAuth.instance.getters.authCred?.accessToken;
    requestOptions.headers['content-length'] = null;
    final newRetryResponse = await client.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
      queryParameters: requestOptions.queryParameters,
      onSendProgress: requestOptions.onSendProgress,
      onReceiveProgress: requestOptions.onReceiveProgress,
    );
    handler.resolve(newRetryResponse);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(
      err,
      handler,
    );
  }
}
