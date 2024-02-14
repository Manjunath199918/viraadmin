import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelManager {
  static Mixpanel? _instance;

  static Future<Mixpanel> get instance async {
    if (_instance == null) await init();

    return _instance!;
  }

  static Future<Mixpanel> init() async {
    _instance ??= await Mixpanel.init('',
        optOutTrackingDefault: false, trackAutomaticEvents: true);
    return _instance!;
  }
}
