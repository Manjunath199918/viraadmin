import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:viraadmin/modules/domain/core/device_info/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';

class KDeviceInfoImpl implements KDeviceInfo {
  @override
  late final DeviceInfo info;

  @override
  Future<void> bootUp() async {
    log('[DeviceInfo.bootUp]');

    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;

      info = DeviceInfo(
        osName: 'iOS',
        osVersion: iosInfo.systemVersion ?? '',
        deviceName: iosInfo.name ?? '',
        deviceId: iosInfo.identifierForVendor ?? '',
      );
    } else if (Platform.isAndroid) {
      final futures = UnmodifiableListView([
        deviceInfo.androidInfo,
        FirebaseInstallations.instance.getId(),
      ]);

      final results = await Future.wait(futures);
      final androidInfo = results[0] as AndroidDeviceInfo;
      final deviceId = results[1] as String;

      info = DeviceInfo(
        osName: 'Android',
        osVersion: androidInfo.version.release,
        deviceName: androidInfo.model,
        deviceId: deviceId,
      );
    }

    log('DeviceInfo: $info');
  }

  @override
  void onBootUp() {
    // TODO: implement onBootUp
  }

  @override
  void bootDown() {
    log('[DeviceInfo.bootDown]');
    // TODO: implement bootDown
  }
}
