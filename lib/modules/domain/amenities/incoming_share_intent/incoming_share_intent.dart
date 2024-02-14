import 'package:viraadmin/modules/data/amenities/incoming_share_intent/incoming_share_intent.dart';
import 'package:viraadmin/modules/domain/amenities/amenity.dart';

abstract class IncomingShareIntentAmenity implements KAmenityModule<void> {
  // TODO: Use dependency injection instead
  static final IncomingShareIntentAmenity instance = IncomingShareIntentAmenityImpl();

  String? get initialText;

  Stream<String>? get onTextShareReceived;
}
