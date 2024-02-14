import 'package:viraadmin/modules/data/core/app_info/app_info.dart';
import 'package:viraadmin/modules/domain/core/core.dart';

class AppInfo {
  final String name;
  final String version;
  final String buildNumber;

  AppInfo({
    required this.name,
    required this.version,
    required this.buildNumber,
  });

  @override
  String toString() {
    return {
      'name': name,
      'version': version,
      'buildNumber': buildNumber,
    }.toString();
  }
}

abstract class KAppInfo implements KCoreModule<void> {
  static final KAppInfo instance = KAppInfoImpl();

  AppInfo get info;
}
