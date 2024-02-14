part of '../app_extension.dart';

final _currentProfileProvider = StateNotifierProvider<_CurrentProfileController, ProfileDetails?>((ref) {
  return _CurrentProfileController();
});

class _CurrentProfileController extends StateNotifier<ProfileDetails?> {
  _CurrentProfileController() : super(null);

  void onUpdate({required ProfileDetails profileDetails}) {
    state = profileDetails;
  }

  void onLogIn({required ProfileDetails profileDetails}) {
    state = profileDetails;
  }

  void onLogOut() async {
    state = null;
  }
}
