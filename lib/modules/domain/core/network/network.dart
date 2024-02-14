import 'package:viraadmin/environment/environment.dart';
import 'package:viraadmin/modules/data/core/network/network.dart';
import 'package:viraadmin/modules/domain/core/app_info/app_info.dart';
import 'package:viraadmin/modules/domain/core/core.dart';
import 'package:viraadmin/modules/domain/core/device_info/device_info.dart';

part 'network_defaults.dart';

abstract class KNetworkingBox<C, O> implements KCoreModule<void> {
  //TODO: it should be type of KNetworkingBoxCore
  static final KNetworkingBoxImpl instance = KNetworkingBoxImpl();

  static final KNetworkingDefaults defaults = KNetworkingDefaults._();

  Future<C?> secureClient({
    O? options,
    bool loggingEnabled = true,
  });

  Future<C?> unsecureClient({
    O? options,
    bool loggingEnabled = true,
  });
}
