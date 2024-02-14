import 'package:viraadmin/modules/data/core/device_info/device_info.dart';
import 'package:viraadmin/modules/domain/core/core.dart';

class DeviceInfo {
  final String osName;
  final String osVersion;
  final String deviceName;
  final String deviceId;

  DeviceInfo({
    required this.osName,
    required this.osVersion,
    required this.deviceName,
    required this.deviceId,
  });

  @override
  String toString() {
    return {
      'osName': osName,
      'osVersion': osVersion,
      'deviceName': deviceName,
      'deviceId': deviceId,
    }.toString();
  }
}

abstract class KDeviceInfo implements KCoreModule<void> {
  static final KDeviceInfo instance = KDeviceInfoImpl();

  DeviceInfo get info;
}
