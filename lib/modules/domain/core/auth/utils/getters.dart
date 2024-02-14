part of '../auth.dart';

abstract class KAuthGetters {
  KAuthGetters._();

  AuthStatus get authStatus;

  AuthCred? get authCred;

  Future<String?> get token;
}
