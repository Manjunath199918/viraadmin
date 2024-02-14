import 'package:quick_actions/quick_actions.dart';

class AppShortcuts {
  static const items = <ShortcutItem>[actionUpi];

  static const actionUpi = ShortcutItem(
    type: 'action_upi',
    localizedTitle: 'Scan & Pay',
    icon: 'ic_qr_scanner',
  );
}
