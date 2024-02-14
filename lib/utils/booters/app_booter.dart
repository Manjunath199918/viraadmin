import 'dart:collection';

import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.gr.dart';
import 'package:viraadmin/modules/domain/amenities/amenity.dart';
import 'package:viraadmin/modules/domain/core/core.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../../modules/domain/booter_abstract.dart';

final appBooterProvider =
    StateNotifierProvider<AppBooter, AppBooterStatus>((ref) {
  final controller = AppBooter();

  controller._bootUp();

  ref.onDispose(() {
    controller._bootDown();
  });

  return controller;
});

enum AppBooterStatus { booting, booted }

class AppBooter extends StateNotifier<AppBooterStatus> {
  AppBooter() : super(AppBooterStatus.booting);

  void _bootUp() async {
    //If few services need to be boot above all
    final preBootUpSequence = UnmodifiableListView<Future<dynamic>>([
      KCoreModule.instance.bootUp(),
      KAmenityModule.instance.bootUp(),
    ]);
    await Future.wait(preBootUpSequence);

    final bootUpProcesses = UnmodifiableListView<Future<dynamic>>([]);
    await Future.wait(bootUpProcesses);

    state = AppBooterStatus.booted;

    _onBootUp();
  }

  void _onBootUp() async {
    KCoreModule.instance.onBootUp();
    KAmenityModule.instance.onBootUp();

    //TODO: handle all deep link and push notification navigation here with conditional rendering

    // final bottomNavigatorRoute = BottomNavigatorRoute();
    // KAppX.router.replace(
    //   bottomNavigatorRoute,
    // );
  }

  void _bootDown() {
    KCoreModule.instance.bootDown();
    KAmenityModule.instance.bootDown();
  }
}
