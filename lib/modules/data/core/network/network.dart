import 'dart:developer';

import 'package:viraadmin/modules/data/core/network/services/dio/network.dart';
import 'package:viraadmin/modules/domain/core/auth/auth.dart';
import 'package:viraadmin/modules/domain/core/network/network.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';

part 'services/network_service.dart';

//It was time consuming to create implement complete client, for now directly type casted clients from dio service, still plug and play
class KNetworkingBoxImpl
    implements KNetworkingBox<DioNetworkingClient, DioNetworkingOptions> {
  late final KNetworkingBoxService<DioNetworkingClient, DioNetworkingOptions>
      _networkingBoxService;
  UserModel? user;
  final KPersistentStorage persistentStorage = KPersistentStorage();

  KNetworkingBoxImpl() {
    _networkingBoxService = DioNetworkingBox(
      defaultOptions: DioNetworkingOptions(
        baseUrl: KNetworkingBox.defaults.baseUrl,
        headers: KNetworkingBox.defaults.defaultHeaders,
      ),
    );
  }

  @override
  void bootDown() {
    log('[NetworkingBox.bootDown]');
    // TODO: implement bootDown
  }

  @override
  Future bootUp() {
    log('[NetworkingBox.bootUp]');
    // TODO: implement bootUp
    throw UnimplementedError();
  }

  @override
  void onBootUp() {
    // TODO: implement onBootUp
  }

  @override
  Future<DioNetworkingClient?> secureClient({
    DioNetworkingOptions? options,
    bool loggingEnabled = true,
  }) async {
    DioNetworkingClient? client;

    try {
      final accessToken = KAuth.instance.getters.authCred!.accessToken;
      client = await _networkingBoxService.client(
        options: options,
        accessToken: accessToken.split(' ')[1],
        loggingEnabled: loggingEnabled,
      );
      return client;
    } catch (e) {
      log('[Secure Client Exception]: ${e.toString()}');
      return unsecureClient(options: options, loggingEnabled: loggingEnabled);
    }
  }

  @override
  Future<DioNetworkingClient?> unsecureClient({
    DioNetworkingOptions? options,
    bool loggingEnabled = true,
  }) async {
    final client = await _networkingBoxService.client(
      options: options,
      loggingEnabled: loggingEnabled,
    );

    return client;
  }
}
