part of '../network.dart';

class DioNetworkLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // log('RequestOptions : $options');
    // log('RequestOptions Headers: ${options.headers}');
    // log('RequestOptions.url : ${options.uri}');
    // log('RequestOptions.data : ${options.data}');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // log('Response : $response');

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('Error : $err');

    return super.onError(
      err,
      handler,
    );
  }
}
