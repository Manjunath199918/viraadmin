import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class GoogleAnalytics {
  static FirebaseAnalytics? _instance;

  static FirebaseAnalytics get instance {
    if (_instance == null) init();

    return _instance!;
  }

  static FirebaseAnalytics init() {
    _instance ??= FirebaseAnalytics.instance;
    return _instance!;
  }
}
