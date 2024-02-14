import 'package:viraadmin/modules/data/core/permissions/permissions.dart';
import 'package:viraadmin/modules/domain/core/core.dart';

enum PermissionTypes { contacts, sms, appTrackingTransparency, camera }

enum PermissionValues { denied, allowed, permanentlyDenied }

abstract class KPermissionBox implements KCoreModule<void> {
  static final KPermissionBox instance = KPermissionsBoxImpl();

  Future<bool> requestPermission(PermissionTypes permission);

  Future<bool> checkPermission(PermissionTypes permission);

 // Future<void> showAppSettings(String title, String content);

  static const Map<PermissionTypes, String> permissionMessages = {
    PermissionTypes.contacts:
        'It looks like you\'ve disabled contacts permission for Credwise',
    PermissionTypes.appTrackingTransparency:
        'It looks like you\'ve disabled app Tracking permission for Credwise',
    PermissionTypes.camera:
        'It looks like you\'ve disabled app Camer permission for Credwise'
  };
}
