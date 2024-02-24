part of '../router.dart';

//Custom route: Transition can be changed
//Auto route: Transition behavior will be cupertino, as intrinsic router is set to cupertino (can be changed)

class KRoutesRegistry {
  KRoutesRegistry._();

  static const List<AutoRoute> routes = <AutoRoute>[
    CustomRoute(
      path: KPathsRegistry.onboarding,
      page: OnboardingScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
    ),
    CustomRoute(
      page: SplashView,
      transitionsBuilder: KRouteTransitionBuilders.none,
       initial: true,
    ),
    CustomRoute(
      page: LoginScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.login,

    ),
    CustomRoute(
      page: DashBoardScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.dashBoardScreen,

    ),
    CustomRoute(
      page: Homework,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.homeWorkScreen,

    ),
    CustomRoute(
      page: Attendance,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.attendanceScreen,

    ),
    CustomRoute(
      page: FeeHomeScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.feeHomeScreen,

    ),
    CustomRoute(
      page: ExamniationScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.examinationScreen,

    ),
    CustomRoute(
      page: ReportCard,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.reportCardScreen,

    ),
    CustomRoute(
      page: CalenderScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.calenderScreen,

    ),
    CustomRoute(
      page: NoticeBoardScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.noticeBoardScreen,

    ),
    CustomRoute(
      page: AddNoticeHome,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.addNotice,

    ),
    CustomRoute(
      page: MultiMedia,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.multiMediaScreen,

    ),
    CustomRoute(
      page: CreateMedia,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.createMedia,

    ),
    CustomRoute(
      page: AddSeriesExam,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.addSeriesExam,

    ),
    CustomRoute(
      page: AddSingleExam,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.addSingleExam,

    ),

    CustomRoute(
      page: SubjectScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.subjectScreen,

    ),
    CustomRoute(
      page: ProfileScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.profileScreen,

    ),

    CustomRoute(
      page: TimeTableScreen,
      transitionsBuilder: KRouteTransitionBuilders.none,
      path: KPathsRegistry.timeTableScreen,

    ),





    // CustomRoute(
    //   path: KPathsRegistry.logout,
    //   page: LogoutScreen,
    //   transitionsBuilder: KRouteTransitionBuilders.none,
    //   // guards: [
    //   //   AuthGuard,
    //   //   HomeGuard,
    //   // ],
    // ),
  ];
}
