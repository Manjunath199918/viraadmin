import 'dart:convert';
import 'dart:developer';

import 'package:viraadmin/modules/domain/core/auth/auth.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'utils/actions.dart';
part 'utils/events.dart';
part 'utils/getters.dart';

class KAuthImpl implements KAuth {
  @override
  late final KAuthActionsImpl actions;

  @override
  late final KAuthEventsImpl events;

  @override
  late final KAuthGettersImpl getters;

  KAuthImpl() {
    actions = KAuthActionsImpl(this);
    events = KAuthEventsImpl(this);
    getters = KAuthGettersImpl(this);
  }

  final String authenticationCredKey = KAuth.authenticationCredKey;
 //This method will work on when app restarts/starts
  @override
  Future<void> bootUp() async {
    log('[Auth.bootUp]');

    actions.onBootUp();
  }

  @override
  void bootDown() {
    log('[Auth.onBootDown]');
  // this will disable all the listeners attached to auth status
    events.listeners.clear();
  }
  //This method will execute on after firing bootup method
  @override
  void onBootUp() {
    // TODO: implement onBootUp
  }
}
