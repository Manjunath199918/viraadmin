import 'dart:collection';

import 'package:viraadmin/modules/data/amenities/amenity.dart';
import 'package:viraadmin/modules/domain/amenities/incoming_share_intent/incoming_share_intent.dart';
import 'package:viraadmin/utils/booters/app_booter.dart';

abstract class KAmenityModule<T> implements Booter<T> {
  static final KAmenityModule instance = KAmenityModuleImpl();

  static final bootUpProcesses = UnmodifiableListView([
    IncomingShareIntentAmenity.instance,
  ]);
}
