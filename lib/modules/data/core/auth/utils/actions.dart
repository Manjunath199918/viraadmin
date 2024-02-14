part of '../auth.dart';

class KAuthActionsImpl implements KAuthActions<void> {
  final KAuthImpl _auth;
  KAuthActionsImpl(this._auth);

  AuthCred? authCred;
  AuthStatus authStatus = AuthStatus.unauthenticated;
// when app boots up or restarts it will retrieve the access token for further use
  Future<void> onBootUp() async {
    authStatus = AuthStatus.unauthenticated;

    final persistentStorage = KPersistentStorage();

    authCred = await persistentStorage.retrieve(
      key: _auth.authenticationCredKey,
      decoder: (data) {
        final retrievedData = jsonDecode(data);

        return AuthCred.fromJson(retrievedData);
      },
    );

    if (authCred != null) {
      authStatus = AuthStatus.authenticated;
    }
    _notifyListeners(authStatus);
  }
// when user login to app  it will store the access token in local storage for further use

  @override
  Future<void> onLogIn(AuthCred authCred) async {
    // 1. Store in memory & for getter
    this.authCred = authCred;

    // 2. Store on persistent storage for later access
    final persistentStorage = KPersistentStorage();

    await persistentStorage.store<AuthCred>(
      key: _auth.authenticationCredKey,
      data: authCred,
      encoder: (authCred) {
        final jsonString = jsonEncode(authCred.toJson());

        return jsonString;
      },
      overwrite: true,
    );

    authStatus = AuthStatus.authenticated;
    _notifyListeners(authStatus);

    //TODO: check if its right place
    await KAppX.profile.refresh();
  }
  // when user logout from app  we have to delete access token and notify listeners about auth status
  @override
  Future<void> onLogOut() async {
    // 1. Remove from memory & changed in getter
    authCred = null;

    // 2. Remove from persistent storage
    final persistentStorage = KPersistentStorage();

    await persistentStorage.delete(
      key: _auth.authenticationCredKey,
    );

    // remove the user details on log out
    await persistentStorage.delete(key: 'user_details');

    authStatus = AuthStatus.unauthenticated;
    _notifyListeners(authStatus);

    await KAppX.profile.refresh();
  }
  //getter helps to get a current user token
  @override
  Future<String?> get token async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    log('[FirebaseAuth.token] token: $token');

    return token;
  }
// it will notify all auth listeners in app when auth status changed
  void _notifyListeners(AuthStatus newAuthStatus) {
    _auth.events.onAuthStatusChanged(newAuthStatus);
  }
}
