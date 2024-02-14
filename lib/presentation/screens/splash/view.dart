import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.gr.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/amenities/googleAnalytics/analytics.dart';
import 'package:viraadmin/modules/domain/core/deep_link/deep_link.dart';
import 'package:viraadmin/modules/domain/core/permissions/permissions.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/app_shortcuts/app_shortcuts.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kochava_tracker/kochava_tracker.dart';
import 'package:quick_actions/quick_actions.dart';

part 'controller.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    final controller = ref.read(_splashController.notifier);
    controller.initQuickActions();

    _animationController = AnimationController(vsync: this);
    _animationController.addListener(() {
      // when animation is completed
      if (_animationController.isCompleted) {
        controller.onAmnimationComplete();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final currentTheme = ref.watch(KAppX.theme.current);


    ref.listen<_SplashState>(_splashController, (previous, next) {
      if (next.animationShown) {
        KAppX.router.replaceAll(next.routes);
      }
    });

    return Scaffold(

      body: SafeArea(

        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const  Image(image: AssetImage('assets/splash/img.png',))


          ],
        )
      ),
    );
  }
}

