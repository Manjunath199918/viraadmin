part of '../auth.dart';

class KAuthGettersImpl implements KAuthGetters {
  final KAuthImpl _auth;
  KAuthGettersImpl(this._auth);
 // for getting auth status and authctred
  @override
  AuthStatus get authStatus => _auth.actions.authStatus;

  @override
  AuthCred? get authCred => _auth.actions.authCred;
  @override
  Future<String?> get token => _auth.actions.token;
}
