part of 'environment.dart';

class _KEnvironmentKeys {
  final Map<String, String> _envConfig;

  _KEnvironmentKeys(this._envConfig);

  /// Either `production` or `staging`
  String get environment => _envConfig['ENVIRONMENT']!;

  String get clientSecret => _envConfig['CLIENT_SECRET']!;
  String get clientId => _envConfig['CLIENT_ID']!;

  String get apiUrl => _envConfig['API_URL']!;

  String get deepLinkUrl => _envConfig['DEEP_LINK_URL']!;

  String get websiteUrl => _envConfig['WEBSITE_URL']!;

  bool get enableCaching => _envConfig['ENABLE_CACHING']!.parseToBool();

  bool get enableCrashlytics => _envConfig['ENABLE_CRASHLYTICS']!.parseToBool();

  String get sentryDSN => _envConfig['SENTRY_DSN']!;
}
