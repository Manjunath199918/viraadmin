part of '../app_extension.dart';

class KProfile {
  KProfile._();

  static const storageKey = 'current_profile_key';

  StateNotifierProvider<_CurrentProfileController, ProfileDetails?> get current => _currentProfileProvider;

  final _persistentStorage = KPersistentStorage();

  Future<void> storeProfileData(ProfileDetails profileDetails) async {
    try {
      await _persistentStorage.store(
        key: storageKey,
        data: profileDetails.toJson(),
        encoder: jsonEncode,
        overwrite: true,
      );
    } catch (e, st) {
      log('Error saving profile data to persistent storage: $e\n $st');
    }
    return;
  }

  Future<bool> refresh({ProfileDetails? cachedProfileDetails}) async {
    final completer = Completer<bool>();

    final currentProfileController = KAppX.globalProvider.read(_currentProfileProvider.notifier);

    final isUserAuthenticated = KAuth.instance.getters.authStatus == AuthStatus.authenticated;

    Future<void> _onSuccess(ProfileDetails profileDetails) async {
      if (cachedProfileDetails == null) {
        storeProfileData(profileDetails);
      } else {
        _silentlyUpdateCache();
      }

      completer.complete(true);

      currentProfileController.onLogIn(
        profileDetails: profileDetails,
      );

      FirebaseCrashlytics.instance.setUserIdentifier('<profile: identifier:email/phone xyz>');
      FirebaseCrashlytics.instance.setCustomKey('id', '<profile: uid>');
      FirebaseCrashlytics.instance.setCustomKey('username', '<profile: username>');
    }

    Future<void> _onFailure() async {
      completer.complete(false);
      currentProfileController.onLogOut();
      _persistentStorage.delete(key: storageKey);

      //TODO: redirect to page of something went wrong
    }

    if (isUserAuthenticated) {
      log('[QProfile.refresh] refreshing...');

      if (cachedProfileDetails != null) {
        _onSuccess(cachedProfileDetails);
      } else {
        //TODO: get profile details, update onSuccess or onFailure

        //TODO: update/register notification token to backend
      }
    } else {
      completer.complete(false);
      log('[QProfile.refresh] logging out...');

      currentProfileController.onLogOut();
      _persistentStorage.delete(key: storageKey);
    }

    return completer.future;
  }

  //TODO:Add response types
  Future<dynamic> updateProfile({required ProfileDetails updatedProfileDetails}) async {
    //TODO:Update to backend
    //TODO:Update to controller
  }

  Future<void> _silentlyUpdateCache() async {
    //TODO: get new profile details
    //TODO: update controller
    //TODO: update store
  }
}
