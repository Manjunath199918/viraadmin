part of 'view.dart';

final _vsProvider = StateNotifierProvider<_VSController, _ViewState>((ref) {
  final stateController = _VSController()..initController();

  return stateController;
});

class _ViewState {
  const _ViewState({this.upgrader});

  final Upgrader? upgrader;

  factory _ViewState.init() {
    return _ViewState();
  }

  _ViewState copyWith({Upgrader? upgrader}) {
    return _ViewState(upgrader: upgrader ?? this.upgrader);
  }
}

class _VSController extends StateNotifier<_ViewState> {
  _VSController() : super(_ViewState.init());
  final persistentStorage = KPersistentStorage();
  final authRepository = AuthRepository();


  void initController() async {
    getLatestVersion();


  // we are  checking is user  opened an app from notification
  final kNotificationBox =KNotificationBox.instance;
   KPushNotification? kPushNotification = await kNotificationBox.startUpNotification;
    if(kPushNotification!=null){
      KAppX.router.onPushNotification(kPushNotification);
    }
    // we are  checking is user  opened an app from deeplink

    final kDeeplinkBox =KDeepLink.instance;
    DeepLink? deepLink = await kDeeplinkBox.startUpDeepLink();
    if(deepLink!=null){
      KAppX.router.onDeepLink(deepLink);
    }

  }

  Future<void> showTermsAndConditions(var currentTheme,BuildContext  context) async {


    String? agreed = await persistentStorage.retrieve(
      key: 'transcorp_agreed',
      decoder: (val) {
        return val;
      },
    );


   if(agreed==null){

   }
  }
  Future<void> getLatestVersion() async {


    final response = await authRepository.getLatestVersion();

    response.resolve(
          (s) async {
            final upgrader = Upgrader(
              debugLogging: true,
              minAppVersion: s.appVersion.message,

            );
            state = state.copyWith(upgrader: upgrader);

      },
          (f) {
        // user has not signed up
        if (f.statusCode == 404) {

        }
      },
    );
  }
}
