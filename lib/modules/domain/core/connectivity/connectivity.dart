import 'package:viraadmin/modules/data/core/connectivity/connectivity.dart';
import 'package:viraadmin/modules/domain/core/core.dart';

enum ConnectivityStatus {
  connected,
  disconnected,
}

abstract class KConnectivity implements KCoreModule<void> {
  static final KConnectivity instance = KConnectivityImpl();

  Future<ConnectivityStatus> get currentConnectivityStatus;

  Stream<ConnectivityStatus> get onConnectivityStatusChanged;
}
