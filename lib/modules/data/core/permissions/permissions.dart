import 'package:viraadmin/modules/domain/core/permissions/permissions.dart';
// import 'package:viraadmin/presentation/screens/profile/user_consent/permanentDenyDialog.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class KPermissionsBoxImpl implements KPermissionBox {
  @override
  void bootDown() {
    // TODO: implement bootDown
  }

  @override
  Future<void> bootUp() async {
    // TODO: implement bootUp
    //throw UnimplementedError();
  }

  @override
  void onBootUp() {
    // TODO: implement onBootUp
  }

  @override
  Future<bool> requestPermission(PermissionTypes permission) async {
    var value = false;
    var permanentDeny = false;

    var permissionStatus = await _checkPermission(permission);

    if (permissionStatus == PermissionValues.allowed) {
      value = true;
    }

    if (permissionStatus == PermissionValues.denied) {
      value = await _askPermission(permission);
    }

    if (value == false) {
      permanentDeny = await _checkIfPermanentDeny(permission);
    }

    if (permissionStatus == PermissionValues.permanentlyDenied ||
        permanentDeny) {
      await _showPermissionPermanentlyDeniedNotification(permission);
      value = await checkPermission(permission);
    }
    return value;
  }

  @override
  Future<bool> checkPermission(PermissionTypes permission) async {
    var value = false;
    var permanentDeny = false;

    var permissionStatus = await _checkPermission(permission);

    if (permissionStatus == PermissionValues.allowed) {
      value = true;
    }

    //Sometimes when permanently denied by os and not user the above function does not return anything.
    final noPermissionReturned =
        value == false && permissionStatus != PermissionValues.denied;

    if (noPermissionReturned) {
      permanentDeny = await _checkIfPermanentDeny(permission);
    }

    if (permissionStatus == PermissionValues.permanentlyDenied ||
        permanentDeny) {
      // _showPermissionPermanentlyDeniedNotification(permission);
    }
    return value;
  }

  Future<bool> _askPermission(PermissionTypes permission) async {
    var value = false;
    try {
      switch (permission) {
        case PermissionTypes.contacts:
          var req = await Permission.contacts.request();
          if (req.isPermanentlyDenied) {
            _showPermissionPermanentlyDeniedNotification(permission);
          }
          value = req.isGranted || req.isRestricted || req.isLimited;
          break;
        case PermissionTypes.sms:
          var req = await Permission.sms.request();
          if (req.isPermanentlyDenied) {
            _showPermissionPermanentlyDeniedNotification(permission);
          }
          value = req.isGranted || req.isRestricted || req.isLimited;
          break;
        case PermissionTypes.appTrackingTransparency:
          var req = await Permission.appTrackingTransparency.request();
          if (req.isPermanentlyDenied) {
            _showPermissionPermanentlyDeniedNotification(permission);
          }
          value = req.isGranted || req.isRestricted || req.isLimited;
          break;
        case PermissionTypes.camera:
          var req = await Permission.camera.request();
          if (req.isPermanentlyDenied) {
            _showPermissionPermanentlyDeniedNotification(permission);
          }
          value = req.isGranted || req.isRestricted || req.isLimited;
          break;
      }
      return value;
    } catch (e) {
      return false;
    }
  }

  Future<PermissionValues> _checkPermission(PermissionTypes permission) async {
    var value = PermissionValues.denied;

    late PermissionStatus status;

    switch (permission) {
      case PermissionTypes.contacts:
        status = await Permission.contacts.status;
        break;
      case PermissionTypes.sms:
        status = await Permission.sms.status;
        break;
      case PermissionTypes.appTrackingTransparency:
        status = await Permission.appTrackingTransparency.status;
        break;
      case PermissionTypes.camera:
        status = await Permission.camera.status;
        break;
    }

    if (status.isGranted || status.isLimited || status.isRestricted) {
      value = PermissionValues.allowed;
    } else if (status == PermissionStatus.permanentlyDenied) {
      value = PermissionValues.permanentlyDenied;
    }
    return value;
  }

  Future<bool> _checkIfPermanentDeny(PermissionTypes permission) async {
    var value = false;
    try {
      switch (permission) {
        case PermissionTypes.contacts:
          var req = await Permission.contacts.isPermanentlyDenied;
          value = req;
          break;
        case PermissionTypes.sms:
          var req = await Permission.sms.isPermanentlyDenied;
          value = req;
          break;
        case PermissionTypes.appTrackingTransparency:
          var req =
              await Permission.appTrackingTransparency.isPermanentlyDenied;
          value = req;
          break;
        case PermissionTypes.camera:
          var req = await Permission.camera.isPermanentlyDenied;
          value = req;
          break;
      }
      return value;
    } catch (e) {
      return false;
    }
  }

  Future<void> _showPermissionPermanentlyDeniedNotification(
      PermissionTypes permission) async {
    //TODO: show snack bar
    switch (permission) {
      case PermissionTypes.contacts:
        // await showAppSettings('Allow app to access your contacts list ?',
        //     'You need to allow contact access in Permission settings to add contacts');
        break;
      case PermissionTypes.sms:
        break;
      case PermissionTypes.appTrackingTransparency:
        break;
      case PermissionTypes.camera:
        // await showAppSettings('Allow app to access your camera?',
        //     'You need to allow camera access in Permission setting to scan QR code');
    }
  }

  // @override
  // Future<void> showAppSettings(String title, String content) async {
  //   await KAppX.extendedRouter.dialogs.openDialog(
  //     barrierDismissible: false,
  //     body: (BuildContext context) {
  //       return PermanentDenyDialogScreen(
  //         title: title,
  //         content: content,
  //       );
  //     },
  //   );
  // }
}
