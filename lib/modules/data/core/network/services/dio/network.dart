import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:viraadmin/modules/data/core/network/network.dart';
import 'package:viraadmin/modules/domain/core/auth/auth.dart';
import 'package:viraadmin/modules/domain/core/connectivity/connectivity.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

part 'interceptors/logging.dart';
part 'interceptors/no_token.dart';
part 'interceptors/retry.dart';
part 'network_client.dart';

class DioNetworkingBox
    implements
        KNetworkingBoxService<DioNetworkingClient, DioNetworkingOptions> {
  final DioNetworkingOptions defaultOptions;

  DioNetworkingBox({
    required this.defaultOptions,
  });

  @override
  Future<DioNetworkingClient> client({
    DioNetworkingOptions? options,
    String? accessToken,
    required bool loggingEnabled,
  }) async {
    late DioNetworkingClient client;

    final currentTimezoneRegion =
        await KAppX.services.time.getLocalTimezoneRegion();

    if (accessToken != null) {
      client = await _createSecureClient(
        accessToken: accessToken,
        currentTimezoneRegion: currentTimezoneRegion,
        options: options,
      );
    } else {
      client = await _createUnsecureClient(
        currentTimezoneRegion: currentTimezoneRegion,
        options: options,
      );
    }

    if (loggingEnabled) {
      client.addLoggingIntercept();
    }

    return client;
  }

  Future<DioNetworkingClient> _createUnsecureClient({
    required String currentTimezoneRegion,
    DioNetworkingOptions? options,
  }) async {
    final client = options != null
        ? DioNetworkingClient.fromOptions(
            this,
            options,
            timezone: currentTimezoneRegion,
          )
        : DioNetworkingClient(
            this,
            timezone: currentTimezoneRegion,
          );

    return client;
  }

  Future<DioNetworkingClient> _createSecureClient({
    required String accessToken,
    required String currentTimezoneRegion,
    DioNetworkingOptions? options,
  }) async {
    final client = options != null
        ? DioNetworkingClient.fromOptions(
            this,
            options,
            authorizationToken: accessToken,
            timezone: currentTimezoneRegion,
          )
        : DioNetworkingClient(
            this,
            authorizationToken: accessToken,
            timezone: currentTimezoneRegion,
          );

    return client;
  }
}

extension DioNetworkingClientX on DioNetworkingClient {
  void addLoggingIntercept() {
    interceptors.add(DioRetryInterceptor(client: this));
    interceptors.add(DioNetworkLoggingInterceptor());
    interceptors.add(DioTokenInvalidInterceptor(client: this));
  }
}
