import 'dart:developer';

import 'package:viraadmin/modules/domain/amenities/amenity.dart';

class KAmenityModuleImpl implements KAmenityModule<void> {
  @override
  Future<void> bootUp() async {
    log('[AmenityModule.bootUp]');

    for (final amenity in KAmenityModule.bootUpProcesses) {
      try {
        await amenity.bootUp().then(
              (value) => amenity.onBootUp(),
            );
      } catch (err) {
        //
      }
    }
  }

  @override
  void bootDown() {
    log('[AmenityModule.bootDown]');

    for (final amenity in KAmenityModule.bootUpProcesses.reversed) {
      try {
        amenity.bootDown();
      } catch (err) {
        //
      }
    }
  }

  @override
  void onBootUp() {
    // TODO: implement onBootUp
    log('[AmenityModule.onBootUp]');
  }
}
