import 'dart:async';
import 'dart:developer';

import 'package:viraadmin/modules/domain/amenities/incoming_share_intent/incoming_share_intent.dart';

class IncomingShareIntentAmenityImpl implements IncomingShareIntentAmenity {
  String? _initialText;

  late Stream<String> _streamText;

  @override
  Future<void> bootUp() async {
    log('[IncomingShareIntentAmenity.bootUp]');

    // _streamText = ReceiveSharingIntent.getTextStream();
    //
    // _initialText = await ReceiveSharingIntent.getInitialText();
  }

  @override
  void onBootUp() {
    log('[IncomingShareIntentAmenity.onBootUp]');
    // if (_initialText != null) {
    //   _handleOnTextIntent(_initialText!);
    // }
    //
    // _streamText.listen(_handleOnTextIntent);
  }

  @override
  void bootDown() {
    log('[IncomingShareIntentAmenity.onBootDown]');
  }

  // void _handleOnTextIntent(String text) {
  //   KAppX.router.navigate(IncomingDialogRoute(productUrl: text));
  //
  // }

  @override
  String? get initialText => _initialText;

  @override
  Stream<String> get onTextShareReceived => _streamText;
}
