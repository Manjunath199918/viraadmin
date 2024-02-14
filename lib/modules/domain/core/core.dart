import 'dart:collection';

import 'package:viraadmin/modules/data/core/core.dart';
import 'package:viraadmin/modules/domain/core/app_info/app_info.dart';
import 'package:viraadmin/modules/domain/core/auth/auth.dart';
import 'package:viraadmin/modules/domain/core/connectivity/connectivity.dart';
import 'package:viraadmin/modules/domain/core/deep_link/deep_link.dart';
import 'package:viraadmin/modules/domain/core/device_info/device_info.dart';
import 'package:viraadmin/modules/domain/core/notification/notification.dart';
import 'package:viraadmin/modules/domain/core/permissions/permissions.dart';
import 'package:viraadmin/modules/domain/core/theme/theme.dart';
import 'package:viraadmin/utils/booters/app_booter.dart';

abstract class KCoreModule<T> implements Booter<T> {
  static final KCoreModule instance = KCoreModuleImpl();

  static final bootUpProcesses = UnmodifiableListView([
    KPermissionBox.instance,
    KConnectivity.instance,
    KAppInfo.instance,
    KDeviceInfo.instance,
    KAuth.instance,
    KThemeBox.instance,
    KDeepLink.instance,
    KNotificationBox.instance,

  ]);
}
