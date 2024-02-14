import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:viraadmin/modules/data/core/router/router.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/auth/auth.dart';
import 'package:viraadmin/modules/domain/core/router/router.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/core/theme/theme.dart';
import 'package:viraadmin/modules/domain/repository/users/users_repository.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/users/users_repository.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'package:url_launcher/url_launcher_string.dart' as urlStringLauncher;

part 'extended_router/extended_router.dart';
part 'extended_router/routes/dialogs.dart';
part 'launcher/launcher.dart';
part 'launcher/urls.dart';
part 'profile/profile.dart';
part 'profile/provider.dart';
part 'services/service/haptics.dart';
part 'services/service/time.dart';
part 'services/services.dart';
part 'settings/app_setting.dart';
part 'settings/theme/theme.dart';
part 'settings/theme/theme_provider.dart';

final kProviderContainer = ProviderContainer();

/// Add global-providers or services shortcut for easy accessibility
class KAppX {
  KAppX._();

  static final globalProvider = kProviderContainer;

  static BuildContext? get currentContext => router.navigatorKey.currentContext;

  //TODO: It should be KRouteBox type: make module more generic
  static final KRouterBoxImpl router = KRouterBox.instance;

  static final KThemeSetting theme = KThemeSetting._();

  static final KServices services = KServices._();

  static final KProfile profile = KProfile._();

  static final KExtendedRouter extendedRouter = KExtendedRouter._();

  static final KLauncher launcher = KLauncher._();

  static final KUrls urls = KUrls._();
}
