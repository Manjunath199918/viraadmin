part of '../auth.dart';

abstract class KAuthActions<T> {
  KAuthActions._();

  Future<T> onLogIn(AuthCred authCred);

  Future<T> onLogOut();

  Future<String?> get token;

}
