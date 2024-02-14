import 'dart:async';
import 'dart:isolate';

import 'package:viraadmin/environment/environment.dart';
import 'package:viraadmin/firebase_options.dart';
import 'package:viraadmin/presentation/app.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  // Required to bind method & event channels before calling runApp.
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  await ScreenUtil.ensureScreenSize();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
    );
  }).sendPort);

  await KEnvironment.initialize();
  runApp(
    UncontrolledProviderScope(
      container: kProviderContainer,
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );

  // runZonedGuarded(() async {
  //   // if (KEnvironment.config.sentryDSN.isNotEmpty) {
  //   //   await SentryFlutter.init(
  //   //     (SentryFlutterOptions options) {
  //   //       options
  //   //         ..dsn = KEnvironment.config.sentryDSN
  //   //         ..tracesSampleRate = 1.0
  //   //         ..reportPackages = true
  //   //         ..debug = kDebugMode;
  //   //     },
  //   //   );
  //   // }
  //   // Can add run wrappers
  //   runApp(
  //     UncontrolledProviderScope(
  //       container: kProviderContainer,
  //       child: ProviderScope(
  //         child: MyApp(),
  //       ),
  //     ),
  //   );
  // }, (exception, stackTrace) async {
  //   if (KEnvironment.config.sentryDSN.isNotEmpty) {
  //     // Sentry.captureException(exception, stackTrace: stackTrace);
  //   }
  //   if (KEnvironment.config.enableCrashlytics) {
  //     await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
  //   }
  // });
}
