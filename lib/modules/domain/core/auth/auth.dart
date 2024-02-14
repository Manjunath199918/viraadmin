import 'package:viraadmin/modules/data/core/auth/auth.dart';
import 'package:viraadmin/modules/domain/core/core.dart';

part 'utils/actions.dart';
part 'utils/events.dart';
part 'utils/getters.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthCred {
  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  final String accessToken;
  final String refreshToken;

  AuthCred({
    required this.accessToken,
    required this.refreshToken,
  });

  AuthCred.fromJson(Map<String, dynamic> json)
      : this(
          accessToken: json[_accessTokenKey],
          refreshToken: json[_refreshTokenKey],
        );

  Map<String, dynamic> toJson() => {
        _accessTokenKey: accessToken,
        _refreshTokenKey: refreshToken,
      };
}

abstract class KAuth implements KCoreModule<void> {
  static final KAuth instance = KAuthImpl();

  static const String authenticationCredKey = 'authentication_cred';

  KAuthGetters get getters => instance.getters;

  KAuthEvents get events => instance.events;

  KAuthActions get actions => instance.actions;
}
