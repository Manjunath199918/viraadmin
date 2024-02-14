part of '../auth.dart';

class KAuthEventsImpl implements KAuthEvents {
  final KAuthImpl _auth;
  KAuthEventsImpl(this._auth);

  final List<OnAuthStatusChanged> listeners = [];

  @override
  void registerOnAuthStatusChanged(OnAuthStatusChanged callback) {
    listeners.add(callback);
  }
// calling or attaching all listeners when auth status changed
  void onAuthStatusChanged(AuthStatus newAuthStatus) {
    for (final listener in listeners) {
      listener.call(newAuthStatus);
    }
  }
}
