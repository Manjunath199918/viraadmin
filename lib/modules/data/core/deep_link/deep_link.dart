import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:viraadmin/modules/domain/core/deep_link/deep_link.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

class KDeepLinkImpl implements KDeepLink {
  final StreamController<DeepLink> _deepLinksStreamController = StreamController.broadcast();
  late StreamSubscription _uniLinksStreamSubscription;

  @override
  Future<void> bootUp() async {
    log('[DeepLink.bootUp]');


    _uniLinksStreamSubscription = uriLinkStream.listen(
      (deepLinkUri) async {
        log('[uriLinkStream.listen] deepLinkUri: $deepLinkUri');

        if (deepLinkUri != null) {
          final deepLink = DeepLink(
            link: deepLinkUri,
          );

          _deepLinksStreamController.sink.add(deepLink);
        }
      },

      onError: (error) {
        log('[uriLinkStream.onError] error: $error');
      },
    );

    FirebaseDynamicLinks.instance.onLink.listen((event) {
      final deepLink = event.link;



      final deepLinkObj = DeepLink(
        link: deepLink,
        backward: true,
      );

      _deepLinksStreamController.sink.add(deepLinkObj);

    }).onError((e) async {
      log('[firebaseStream.onError] error: ${e.message}');
    });
  }

  @override
  void bootDown() {
    log('[DeepLink.bootDown]');
    _uniLinksStreamSubscription.cancel();
    _deepLinksStreamController.close();

    _onDeepLinkStreamSubscription.cancel();
  }

  late StreamSubscription<DeepLink> _onDeepLinkStreamSubscription;

  @override
  void onBootUp() {
    _onDeepLinkStreamSubscription = onDeepLink.listen((DeepLink newDeepLink) {
      KAppX.router.onDeepLink(newDeepLink);

    });
  }

  @override
  Stream<DeepLink> get onDeepLink => _deepLinksStreamController.stream;

  DeepLink? _startUpDeepLink;
  @override
  Future<DeepLink?> startUpDeepLink() async {
    final uri = await _getInitialUrl();
    final uniLink = uri ?? await getInitialUri();

    _startUpDeepLink = DeepLink(link: uniLink);

    final data = await FirebaseDynamicLinks.instance.getInitialLink();
    final deepLink = data?.link;
    if (deepLink != null) {
      _startUpDeepLink = DeepLink(link: deepLink, backward: true);
    }

    return _startUpDeepLink;
  }

  Future<Uri?> _getInitialUrl() async {

    String? deepLink;

    if (Platform.isIOS) {
      final copiedValue = await Clipboard.getData(Clipboard.kTextPlain);
      if (copiedValue != null && copiedValue.text != null && copiedValue.text!.isNotEmpty) {
        deepLink = copiedValue.text;
        await Clipboard.setData(ClipboardData(text: ''));
      }
    }

    return deepLink != null ? Uri.parse(deepLink) : null;
  }
  @override
  Future<Uri> createDynamicLink(String referId)async{
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse('https://credwise.page.link/referId/$referId'),
      uriPrefix: 'https://credwise.page.link',
      androidParameters: const AndroidParameters(packageName: 'com.credwise.android'),
      iosParameters: const IOSParameters(bundleId: 'com.credwise.ios'),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'text to be scripted here',
        //TODO

      ),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
    return dynamicLink;
  }

}
