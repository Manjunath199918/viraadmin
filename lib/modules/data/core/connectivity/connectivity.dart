import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:viraadmin/modules/domain/core/connectivity/connectivity.dart';

class KConnectivityImpl implements KConnectivity {
  late StreamSubscription<ConnectivityResult> _connectivityResultStreamSubscription;

  final StreamController<ConnectivityStatus> _connectivityStatusStreamController = StreamController<ConnectivityStatus>.broadcast();

  @override
  void bootDown() {
    log('[ConnectivityStatus.bootDown]');

    _connectivityResultStreamSubscription.cancel();
    _connectivityStatusStreamController.close();
  }

  @override
  Future<void> bootUp() async {
    log('[ConnectivityStatus.bootUp]');

    final connectivity = Connectivity();

    _connectivityResultStreamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        log('[connectivity.onConnectivityChanged] disconnected');
        _connectivityStatusStreamController.add(ConnectivityStatus.disconnected);
      } else {
        log('[connectivity.onConnectivityChanged] connected');
        _connectivityStatusStreamController.add(ConnectivityStatus.connected);
      }
    });
  }

  @override
  void onBootUp() {
    // TODO: implement onBootUp
  }

  @override
  Future<ConnectivityStatus> get currentConnectivityStatus async {
    var connectivityStatus = ConnectivityStatus.connected;

    final connectivity = Connectivity();
    final connectivityResult = await connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      connectivityStatus = ConnectivityStatus.disconnected;
    }

    return connectivityStatus;
  }

  @override
  // TODO: implement onConnectivityStatusChanged
  Stream<ConnectivityStatus> get onConnectivityStatusChanged => _connectivityStatusStreamController.stream;
}
