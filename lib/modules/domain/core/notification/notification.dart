import 'dart:convert';
import 'dart:developer';

import 'package:viraadmin/modules/data/core/notification/notification.dart';
import 'package:viraadmin/modules/domain/core/core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'defaults.dart';
part 'helper.dart';
part 'models.dart';

abstract class KNotificationBox implements KCoreModule<void> {
  static final KNotificationBox instance = KNotificationBoxImpl();

  Future<String?> get token;

  Stream<String> get onTokenRefresh;

  Future<KPushNotification?> get startUpNotification;

  Stream<KPushNotification> get onNotification;



  Future<void> triggerLocalNotification({
    int? id,
    required String title,
    required String message,
    required Map<String, dynamic> payload,
    String? image,
    bool isSilent = true,
    String? groupKey,
  });

  Future<void> triggerPersistentNotification({
    required int id,
    required String title,
    required String body,
    String? image,
    String? payload,
  });

  Future<void> cancelNotification({
    required int id,
  });

  Future<void> startForegroundService({
    required int id,
    required String title,
    required String body,
    String? image,
    String? payload,
    required Set<AndroidServiceForegroundType> serviceTypes,
  });

  Future<void> stopForegroundService();
  Future<void> deleteTokenOnLogOut();
  Future<void> onLogin();
}
