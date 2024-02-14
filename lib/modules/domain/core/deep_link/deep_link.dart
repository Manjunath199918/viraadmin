import 'package:viraadmin/modules/data/core/deep_link/deep_link.dart';
import 'package:viraadmin/modules/domain/core/core.dart';

class DeepLink {
  final Uri? link;
  final bool backward;

  DeepLink({
    this.link,
    this.backward = false,
  });

  @override
  String toString() {
    return {
      'link': link,
    }.toString();
  }
}

abstract class KDeepLink implements KCoreModule<void> {
  static final KDeepLink instance = KDeepLinkImpl();

  Future<DeepLink?> startUpDeepLink();

  Stream<DeepLink> get onDeepLink;

  Future<Uri> createDynamicLink(String referId);
}
