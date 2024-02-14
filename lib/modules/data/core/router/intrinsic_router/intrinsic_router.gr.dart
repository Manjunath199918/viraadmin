// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;

import '../../../../../presentation/screens/attendence/view.dart' as _i6;
import '../../../../../presentation/screens/calender/view.dart' as _i10;
import '../../../../../presentation/screens/dashboard/view.dart' as _i4;
import '../../../../../presentation/screens/examination/add_series_exam/view.dart'
    as _i15;
import '../../../../../presentation/screens/examination/add_single_exam/view.dart'
    as _i16;
import '../../../../../presentation/screens/examination/view.dart' as _i8;
import '../../../../../presentation/screens/fee_details/view.dart' as _i7;
import '../../../../../presentation/screens/homework/view.dart' as _i5;
import '../../../../../presentation/screens/login/view.dart' as _i3;
import '../../../../../presentation/screens/multimedia/add_media/view.dart'
    as _i14;
import '../../../../../presentation/screens/multimedia/mediaScreen/view.dart'
    as _i19;
import '../../../../../presentation/screens/multimedia/view.dart' as _i13;
import '../../../../../presentation/screens/notice_board/add_notice/view.dart'
    as _i12;
import '../../../../../presentation/screens/notice_board/view.dart' as _i11;
import '../../../../../presentation/screens/onboarding/view.dart' as _i1;
import '../../../../../presentation/screens/profile/view.dart' as _i18;
import '../../../../../presentation/screens/report_card/view.dart' as _i9;
import '../../../../../presentation/screens/splash/view.dart' as _i2;
import '../../../../../presentation/screens/subjects/view.dart' as _i17;
import '../../../../../presentation/screens/timetable/view.dart' as _i20;
import '../router.dart' as _i23;

class IntrinsicRouter extends _i21.RootStackRouter {
  IntrinsicRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.OnboardingScreen(),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SplashView.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashView(),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashBoardRoute.name: (routeData) {
      final args = routeData.argsAs<DashBoardRouteArgs>(
          orElse: () => const DashBoardRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.DashBoardScreen(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Homework.name: (routeData) {
      final args =
          routeData.argsAs<HomeworkArgs>(orElse: () => const HomeworkArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.Homework(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Attendance.name: (routeData) {
      final args = routeData.argsAs<AttendanceArgs>(
          orElse: () => const AttendanceArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.Attendance(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FeeHomeRoute.name: (routeData) {
      final args = routeData.argsAs<FeeHomeRouteArgs>(
          orElse: () => const FeeHomeRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.FeeHomeScreen(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ExamniationRoute.name: (routeData) {
      final args = routeData.argsAs<ExamniationRouteArgs>(
          orElse: () => const ExamniationRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i8.ExamniationScreen(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ReportCard.name: (routeData) {
      final args = routeData.argsAs<ReportCardArgs>(
          orElse: () => const ReportCardArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i9.ReportCard(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CalenderRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.CalenderScreen(),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NoticeBoardRoute.name: (routeData) {
      final args = routeData.argsAs<NoticeBoardRouteArgs>(
          orElse: () => const NoticeBoardRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i11.NoticeBoardScreen(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddNoticeHome.name: (routeData) {
      final args = routeData.argsAs<AddNoticeHomeArgs>(
          orElse: () => const AddNoticeHomeArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i12.AddNoticeHome(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MultiMedia.name: (routeData) {
      final args = routeData.argsAs<MultiMediaArgs>(
          orElse: () => const MultiMediaArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i13.MultiMedia(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateMedia.name: (routeData) {
      final args = routeData.argsAs<CreateMediaArgs>(
          orElse: () => const CreateMediaArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i14.CreateMedia(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddSeriesExam.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.AddSeriesExam(),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddSingleExam.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i16.AddSingleExam(),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SubjectRoute.name: (routeData) {
      final args = routeData.argsAs<SubjectRouteArgs>(
          orElse: () => const SubjectRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i17.SubjectScreen(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i18.ProfileScreen(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MediaRoute.name: (routeData) {
      final args = routeData.argsAs<MediaRouteArgs>(
          orElse: () => const MediaRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i19.MediaScreen(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TimeTableRoute.name: (routeData) {
      final args = routeData.argsAs<TimeTableRouteArgs>(
          orElse: () => const TimeTableRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i20.TimeTableScreen(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: _i23.KRouteTransitionBuilders.none,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding',
        ),
        _i21.RouteConfig(
          SplashView.name,
          path: '/',
        ),
        _i21.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i21.RouteConfig(
          DashBoardRoute.name,
          path: '/dashBoardScreen',
        ),
        _i21.RouteConfig(
          Homework.name,
          path: '/homeWorkScreen',
        ),
        _i21.RouteConfig(
          Attendance.name,
          path: '/attendanceScreen',
        ),
        _i21.RouteConfig(
          FeeHomeRoute.name,
          path: '/FeeDetailsScreen',
        ),
        _i21.RouteConfig(
          ExamniationRoute.name,
          path: '/ExamniationScreen',
        ),
        _i21.RouteConfig(
          ReportCard.name,
          path: '/ReportCardScreen',
        ),
        _i21.RouteConfig(
          CalenderRoute.name,
          path: '/CalenderScreen',
        ),
        _i21.RouteConfig(
          NoticeBoardRoute.name,
          path: '/NoticeBoardScreen',
        ),
        _i21.RouteConfig(
          AddNoticeHome.name,
          path: '/AddNotice',
        ),
        _i21.RouteConfig(
          MultiMedia.name,
          path: '/multiMediaScreen',
        ),
        _i21.RouteConfig(
          CreateMedia.name,
          path: '/CreateMedia',
        ),
        _i21.RouteConfig(
          AddSeriesExam.name,
          path: '/AddSeriesExam',
        ),
        _i21.RouteConfig(
          AddSingleExam.name,
          path: '/AddSingleExam',
        ),
        _i21.RouteConfig(
          SubjectRoute.name,
          path: '/subjectScreen',
        ),
        _i21.RouteConfig(
          ProfileRoute.name,
          path: '/ProfileScreen',
        ),
        _i21.RouteConfig(
          MediaRoute.name,
          path: '/MediaScreen',
        ),
        _i21.RouteConfig(
          TimeTableRoute.name,
          path: '/TimeTableScreen',
        ),
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i21.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i2.SplashView]
class SplashView extends _i21.PageRouteInfo<void> {
  const SplashView()
      : super(
          SplashView.name,
          path: '/',
        );

  static const String name = 'SplashView';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i21.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i22.Key? key,
    int? index,
  }) : super(
          LoginRoute.name,
          path: '/Login',
          args: LoginRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i4.DashBoardScreen]
class DashBoardRoute extends _i21.PageRouteInfo<DashBoardRouteArgs> {
  DashBoardRoute({
    _i22.Key? key,
    int? index,
  }) : super(
          DashBoardRoute.name,
          path: '/dashBoardScreen',
          args: DashBoardRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'DashBoardRoute';
}

class DashBoardRouteArgs {
  const DashBoardRouteArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'DashBoardRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i5.Homework]
class Homework extends _i21.PageRouteInfo<HomeworkArgs> {
  Homework({
    _i22.Key? key,
    int? index,
  }) : super(
          Homework.name,
          path: '/homeWorkScreen',
          args: HomeworkArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'Homework';
}

class HomeworkArgs {
  const HomeworkArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'HomeworkArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i6.Attendance]
class Attendance extends _i21.PageRouteInfo<AttendanceArgs> {
  Attendance({
    _i22.Key? key,
    int? index,
  }) : super(
          Attendance.name,
          path: '/attendanceScreen',
          args: AttendanceArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'Attendance';
}

class AttendanceArgs {
  const AttendanceArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'AttendanceArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i7.FeeHomeScreen]
class FeeHomeRoute extends _i21.PageRouteInfo<FeeHomeRouteArgs> {
  FeeHomeRoute({
    _i22.Key? key,
    int? index,
  }) : super(
          FeeHomeRoute.name,
          path: '/FeeDetailsScreen',
          args: FeeHomeRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'FeeHomeRoute';
}

class FeeHomeRouteArgs {
  const FeeHomeRouteArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'FeeHomeRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i8.ExamniationScreen]
class ExamniationRoute extends _i21.PageRouteInfo<ExamniationRouteArgs> {
  ExamniationRoute({
    _i22.Key? key,
    int? index,
  }) : super(
          ExamniationRoute.name,
          path: '/ExamniationScreen',
          args: ExamniationRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'ExamniationRoute';
}

class ExamniationRouteArgs {
  const ExamniationRouteArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'ExamniationRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i9.ReportCard]
class ReportCard extends _i21.PageRouteInfo<ReportCardArgs> {
  ReportCard({
    _i22.Key? key,
    int? index,
  }) : super(
          ReportCard.name,
          path: '/ReportCardScreen',
          args: ReportCardArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'ReportCard';
}

class ReportCardArgs {
  const ReportCardArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'ReportCardArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i10.CalenderScreen]
class CalenderRoute extends _i21.PageRouteInfo<void> {
  const CalenderRoute()
      : super(
          CalenderRoute.name,
          path: '/CalenderScreen',
        );

  static const String name = 'CalenderRoute';
}

/// generated route for
/// [_i11.NoticeBoardScreen]
class NoticeBoardRoute extends _i21.PageRouteInfo<NoticeBoardRouteArgs> {
  NoticeBoardRoute({
    _i22.Key? key,
    int? index,
  }) : super(
          NoticeBoardRoute.name,
          path: '/NoticeBoardScreen',
          args: NoticeBoardRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'NoticeBoardRoute';
}

class NoticeBoardRouteArgs {
  const NoticeBoardRouteArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'NoticeBoardRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i12.AddNoticeHome]
class AddNoticeHome extends _i21.PageRouteInfo<AddNoticeHomeArgs> {
  AddNoticeHome({
    _i22.Key? key,
    int? index,
  }) : super(
          AddNoticeHome.name,
          path: '/AddNotice',
          args: AddNoticeHomeArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'AddNoticeHome';
}

class AddNoticeHomeArgs {
  const AddNoticeHomeArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'AddNoticeHomeArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i13.MultiMedia]
class MultiMedia extends _i21.PageRouteInfo<MultiMediaArgs> {
  MultiMedia({
    _i22.Key? key,
    int? index,
  }) : super(
          MultiMedia.name,
          path: '/multiMediaScreen',
          args: MultiMediaArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'MultiMedia';
}

class MultiMediaArgs {
  const MultiMediaArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'MultiMediaArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i14.CreateMedia]
class CreateMedia extends _i21.PageRouteInfo<CreateMediaArgs> {
  CreateMedia({
    _i22.Key? key,
    int? index,
  }) : super(
          CreateMedia.name,
          path: '/CreateMedia',
          args: CreateMediaArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'CreateMedia';
}

class CreateMediaArgs {
  const CreateMediaArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'CreateMediaArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i15.AddSeriesExam]
class AddSeriesExam extends _i21.PageRouteInfo<void> {
  const AddSeriesExam()
      : super(
          AddSeriesExam.name,
          path: '/AddSeriesExam',
        );

  static const String name = 'AddSeriesExam';
}

/// generated route for
/// [_i16.AddSingleExam]
class AddSingleExam extends _i21.PageRouteInfo<void> {
  const AddSingleExam()
      : super(
          AddSingleExam.name,
          path: '/AddSingleExam',
        );

  static const String name = 'AddSingleExam';
}

/// generated route for
/// [_i17.SubjectScreen]
class SubjectRoute extends _i21.PageRouteInfo<SubjectRouteArgs> {
  SubjectRoute({
    _i22.Key? key,
    int? index,
  }) : super(
          SubjectRoute.name,
          path: '/subjectScreen',
          args: SubjectRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'SubjectRoute';
}

class SubjectRouteArgs {
  const SubjectRouteArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'SubjectRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i18.ProfileScreen]
class ProfileRoute extends _i21.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i22.Key? key,
    int? index,
  }) : super(
          ProfileRoute.name,
          path: '/ProfileScreen',
          args: ProfileRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i19.MediaScreen]
class MediaRoute extends _i21.PageRouteInfo<MediaRouteArgs> {
  MediaRoute({
    _i22.Key? key,
    int? index,
  }) : super(
          MediaRoute.name,
          path: '/MediaScreen',
          args: MediaRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'MediaRoute';
}

class MediaRouteArgs {
  const MediaRouteArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'MediaRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i20.TimeTableScreen]
class TimeTableRoute extends _i21.PageRouteInfo<TimeTableRouteArgs> {
  TimeTableRoute({
    _i22.Key? key,
    int? index,
  }) : super(
          TimeTableRoute.name,
          path: '/TimeTableScreen',
          args: TimeTableRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'TimeTableRoute';
}

class TimeTableRouteArgs {
  const TimeTableRouteArgs({
    this.key,
    this.index,
  });

  final _i22.Key? key;

  final int? index;

  @override
  String toString() {
    return 'TimeTableRouteArgs{key: $key, index: $index}';
  }
}
