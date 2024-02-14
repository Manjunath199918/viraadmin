import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:viraadmin/modules/domain/core/deep_link/deep_link.dart';
import 'package:viraadmin/modules/domain/core/router/router.dart';
import 'package:viraadmin/modules/domain/core/permissions/permissions.dart';
import 'package:viraadmin/modules/domain/core/theme/theme.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/booters/app_booter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);


  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      log('[AppState] App resumed');
    } else if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      log('[AppState] App in background');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final _ = ref.watch(appBooterProvider);
        final currentTheme = ref.watch(KAppX.theme.current);

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Credwise',
            color: currentTheme.themeBox.colors.primary,
            supportedLocales: const [Locale('en', '')],
            //TODO: supportedLocales:
            //TODO: localizationsDelegates:
            //TODO: localeResolutionCallback:
            theme: ThemeData(
              brightness: currentTheme.type == KThemeType.dark
                  ? Brightness.dark
                  : Brightness.light,
              primaryIconTheme: Theme.of(context)
                  .primaryIconTheme
                  .copyWith(color: Colors.white),
              fontFamily: 'Circular Std',
              shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
              textTheme: TextTheme(
                headline1: _buildTextStyle(),
                headline2: _buildTextStyle(),
                headline3: _buildTextStyle(),
                headline4: _buildTextStyle(),
                headline5: _buildTextStyle(),
                headline6: _buildTextStyle(),
                subtitle1: _buildTextStyle(),
                subtitle2: _buildTextStyle(),
                bodyText1: _buildTextStyle(),
                bodyText2: _buildTextStyle(),
                caption: _buildTextStyle(),
                button: _buildTextStyle(),
                overline: _buildTextStyle(),
              ),
            ),
            routerDelegate: AutoRouterDelegate(
              KAppX.router,
              navigatorObservers: () => [
                KRouterObserver.instance,
                // Can add more router observer
              ],
            ),
            routeInformationParser: KAppX.router.defaultRouteParser(),
            scrollBehavior: CupertinoScrollBehavior(),
            builder: (context, child) {
              // Can add wrapper over app here
              ScreenUtil.init(context, designSize: const Size(360, 800));
              return child!;
            },
          ),
        );
      },
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      fontFamily: 'Circular Std',
      letterSpacing: 0.2,
    );
  }
}
