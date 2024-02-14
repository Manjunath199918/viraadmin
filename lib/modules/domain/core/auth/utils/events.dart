part of '../auth.dart';

typedef OnAuthStatusChanged = void Function(AuthStatus authStatus);

abstract class KAuthEvents {
  KAuthEvents._();

  void registerOnAuthStatusChanged(OnAuthStatusChanged callback);
}
