import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.gr.dart'
    as ir;
import 'package:viraadmin/modules/domain/core/deep_link/deep_link.dart';
import 'package:viraadmin/modules/domain/core/notification/notification.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/core/router/router.dart';
import 'package:viraadmin/presentation/screens/attendence/view.dart';
import 'package:viraadmin/presentation/screens/calender/view.dart';
import 'package:viraadmin/presentation/screens/dashboard/view.dart';
import 'package:viraadmin/presentation/screens/examination/add_series_exam/view.dart';
import 'package:viraadmin/presentation/screens/examination/add_single_exam/view.dart';
import 'package:viraadmin/presentation/screens/examination/view.dart';
import 'package:viraadmin/presentation/screens/fee_details/view.dart';
import 'package:viraadmin/presentation/screens/homework/view.dart';
import 'package:viraadmin/presentation/screens/login/view.dart';
import 'package:viraadmin/presentation/screens/multimedia/add_media/view.dart';
import 'package:viraadmin/presentation/screens/multimedia/view.dart';
import 'package:viraadmin/presentation/screens/notice_board/add_notice/view.dart';
import 'package:viraadmin/presentation/screens/notice_board/view.dart';
import 'package:viraadmin/presentation/screens/profile/view.dart';
import 'package:viraadmin/presentation/screens/report_card/view.dart';
import 'package:viraadmin/presentation/screens/splash/view.dart';
import 'package:viraadmin/presentation/screens/onboarding/view.dart';
import 'package:viraadmin/presentation/screens/subjects/view.dart';
import 'package:viraadmin/presentation/screens/timetable/view.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';



part 'registry/paths.dart';
part 'registry/routes.dart';
part 'utils/guards/auth.dart';
part 'utils/guards/home.dart';
part 'utils/observers/route_observer.dart';
part 'utils/transitions/transitions.dart';

class KRouterBoxImpl extends ir.IntrinsicRouter
    implements KRouterBox<PageRouteInfo<dynamic>> {
  KRouterBoxImpl()
      : super(
        // authGuard: AuthGuard(),
        // homeGuard: HomeGuard(),
        );

  @override
  void bootDown() {
    log('[Router.bootDown]');
    // TODO: implement bootDown
  }

  @override
  Future<void> bootUp() {
    log('[Router.bootUp]');
    // TODO: implement bootUp
    throw UnimplementedError();
  }

  @override
  void onBootUp() {
    // TODO: implement onBootUp
  }

  @override
  void navigateToPage(PageRouteInfo<dynamic> route) {
    final currentStack = KAppX.router.stackData;

    final currentRoute = currentStack.last.route;

    var isSameCurrentRoute = false;
    final hasSameCurrentRouteName = currentRoute.name == route.routeName;

    final hasRoute = currentStack.any((element) {
      var sameRoute = false;

      final sameNameRoute = element.route.name == route.routeName;

      if (sameNameRoute) {
        ///implement, deep link and push notification navigation will not update pages properly
        //TODO: handle new page with different arguments or not

        sameRoute = true;
      }

      return sameRoute;
    });

    if (hasRoute && !isSameCurrentRoute) {
      KAppX.router.push(
        route,
      );
    } else {
      KAppX.router.navigate(
        route,
      );
    }
  }

  @override
  void onDeepLink(DeepLink deepLink) {
    if (deepLink.link == null) {
      return;
    }
    log('[Router.onDeepLink]:Received deep link:${deepLink.link}');
    log('[Router.onDeepLink]:Received deep link:${deepLink.link?.path}');
    log('[Router.onDeepLink]:Received deep link:${deepLink.link?.queryParameters}');
    log('[Router.onDeepLink]:Received deep link:${deepLink.link?.data}');
    final persistentStorage = KPersistentStorage();
    switch(deepLink.link!.path) {

      case '/cards':
        break;
      default:
        persistentStorage.store(
          key: 'referPlatform',
          data: deepLink.link!.path,
          encoder: (data) {
            return '$data';
          },
        );
    }

    if(deepLink.link!.pathSegments.contains('referId')){
      persistentStorage.store(
        key: 'referId',
        data: deepLink.link!.pathSegments[1],
        encoder: (data) {
          return '$data';
        },
      );
    }


    //TODO: implement
  }

  @override
  void onPushNotification(KPushNotification pushNotification) {
    log('[Router.onPushNotification]:Received push notification:${pushNotification.title}');


    switch (pushNotification.runtimeType) {
      case KUnknownPushNotification:
        log('[KPushNotification.fromJson] opened app with PN:type:unknown');
        _onUnknownPushNotification(
          pushNotification as KUnknownPushNotification,
        );
        break;

      default:

    }
  }

  void _onUnknownPushNotification(
      KUnknownPushNotification unknownPushNotification) {
    void runNotificationClickedLogic() async {


      await KAppX.profile.refresh();
      try {
        switch (unknownPushNotification.json!['id']) {

          case 'notification':
            {
              // KAppX.router.navigate(ir.NotificationsRoute());
            }
            break;

          default:
            {
              // KAppX.router.navigate(bottomNavigationRoute);
            }
            break;
        }
      } catch (e) {
        // KAppX.router.navigate(bottomNavigationRoute);

      }
    }

    void runNotificationTriggerLogic() {
      KNotificationBox.instance.triggerLocalNotification(
        title: unknownPushNotification.title,
        message: unknownPushNotification.body,
        image: unknownPushNotification.image,
        payload: unknownPushNotification.toJson(),
        // isSilent: unknownPushNotification.metaData.isSilent,
        // groupKey: unknownPushNotification.metaData.groupKey,
      );
    }

    if (unknownPushNotification.isFromNotificationTray) {
      runNotificationClickedLogic();
    } else {
      runNotificationTriggerLogic();
    }
  }
}
