part of 'view.dart';

final _splashController =
    StateNotifierProvider<_SplashController, _SplashState>((ref) {

  return _SplashController();
});

class _SplashState {
  final bool animationShown;
  final List<PageRouteInfo> routes;

  _SplashState({
    required this.animationShown,
    required this.routes,
  });

  factory _SplashState.initial() {
    return _SplashState(animationShown: false, routes: []);
  }

  _SplashState copyWith({bool? animationShown, List<PageRouteInfo>? routes}) {
    return _SplashState(
      animationShown: animationShown ?? this.animationShown,
      routes: routes ?? this.routes,
    );
  }
}

class _SplashController extends StateNotifier<_SplashState> {
  _SplashController() : super(_SplashState.initial());

  final quickActions = QuickActions();
  final persistentStorage = KPersistentStorage();

  void fetchLatestVersion() {
    // TODO: fetch latest version of the app
  }

  void initQuickActions() async {

    await setBaseRoute();
    await quickActions.initialize((type) async {
      final isLoggedIn = await persistentStorage.exists(key: 'user_details');
      if (!isLoggedIn) return;

      KAppX.router.popUntilRoot();
      switch (type) {
        case 'action_upi':
          break;
      }
    });

    quickActions.setShortcutItems(AppShortcuts.items);
  }


  Future<void> setBaseRoute() async {
    final bool isLoggedInFirst =
        !(await persistentStorage.exists(key: 'is_logged_in_first'));

    final isLoggedIn = await persistentStorage.exists(key: 'user_details');

    late List<PageRouteInfo> routes;
    if (isLoggedInFirst) {
      routes = [OnboardingRoute()];
      persistentStorage.store(
        key: 'is_logged_in_first',
        data: false,
        encoder: (data) {
          return '$data';
        },
      );
    } else if (isLoggedIn) {
      routes = [LoginRoute()];
    } else {
      //routes = [OnboardingRoute()];

      routes = [LoginRoute()];
    }

    Future.delayed(const Duration(milliseconds: 250), () {
      KAppX.router.replaceAll(routes);
    });
    state = state.copyWith(routes: routes);
  }

  void onAmnimationComplete() {
    state = state.copyWith(animationShown: true);
  }
}
