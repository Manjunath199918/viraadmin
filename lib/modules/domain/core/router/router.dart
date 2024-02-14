import 'package:viraadmin/modules/data/core/router/router.dart';
import 'package:viraadmin/modules/domain/core/core.dart';
import 'package:viraadmin/modules/domain/core/deep_link/deep_link.dart';
import 'package:viraadmin/modules/domain/core/notification/notification.dart';
import 'package:flutter/material.dart';

part 'utils/guard.dart';
part 'utils/observer.dart';

abstract class KRouterBox<I> implements KCoreModule<void> {
  static final KRouterBoxImpl instance = KRouterBoxImpl();

  void navigateToPage(I route);

  void onDeepLink(DeepLink deepLink);

  void onPushNotification(KPushNotification pushNotification);
}
