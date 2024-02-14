import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.gr.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/modules/domain/core/deep_link/deep_link.dart';
import 'package:viraadmin/modules/domain/core/notification/notification.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';

import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/assets/icons.dart';
import 'package:viraadmin/utils/helper/helper.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upgrader/upgrader.dart';
import 'package:uni_links/uni_links.dart';

part 'components/update_card.dart';
part 'controller.dart';

class BottomNavigatorScreen extends ConsumerWidget {
  const BottomNavigatorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);
    final state = ref.watch(_vsProvider);
    final stateController = ref.read<_VSController>(_vsProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      stateController.showTermsAndConditions(currentTheme, context);
    });

    return WillPopScope(
      onWillPop: () async {
        if (KAppX.router.currentPath == '/bottomNavigator' ||
            KAppX.router.currentPath == '/bottomNavigator/home') {
          // KAppX.router.pop();
          return true;
        }

        return false;
      },
      child: AutoTabsRouter(
        // list of your tab routes
        // routes used here must be declaraed as children
        // routes of /dashboard
        routes: const [


        ],
        builder: (context, child, animation) {
          // obtain the scoped TabsRouter controller using context
          final tabsRouter = AutoTabsRouter.of(context);
          // Here we're building our Scaffold inside of AutoTabsRouter
          // to access the tabsRouter controller provided in this context
          //
          //alternatively you could use a global key
          return KScaffold(
            //can add animation on this as well
            body: child,
            //TODO: remove animation on select tab
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: currentTheme.themeBox.colors.background,
              ),
              child: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) async {

                },
                selectedItemColor: currentTheme.themeBox.colors.primary,
                unselectedItemColor:
                currentTheme.themeBox.colors.onBackgroundVariant,
                unselectedLabelStyle: _buildLabelTextStyle(),
                selectedLabelStyle: _buildLabelTextStyle(),
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: _buildNavigatorIcon(
                      KIcons.home,
                    ),
                    activeIcon: _buildNavigatorIcon(
                      KIcons.home,
                      color: currentTheme.themeBox.colors.primary,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavigatorIcon(
                      KIcons.friends,
                    ),
                    activeIcon: _buildNavigatorIcon(
                      KIcons.friends,
                      color: currentTheme.themeBox.colors.primary,
                    ),
                    label: 'Friends',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavigatorIcon(
                      KIcons.cards,
                    ),
                    activeIcon: _buildNavigatorIcon(
                      KIcons.cards,
                      color: currentTheme.themeBox.colors.primary,
                    ),
                    label: 'Cards',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavigatorIcon(
                      KIcons.notification,
                    ),
                    activeIcon: _buildNavigatorIcon(
                      KIcons.notification,
                      color: currentTheme.themeBox.colors.primary,
                    ),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildNavigatorIcon(
                      KIcons.more,
                    ),
                    activeIcon: _buildNavigatorIcon(
                      KIcons.more,
                      color: currentTheme.themeBox.colors.primary,
                    ),
                    label: 'More',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    //   UpgradeAlert(
    //
    //   card: UpdateCard(
    //     upgrader: state.upgrader,
    //     currentTheme: currentTheme,
    //   ),
    //   upgrader: state.upgrader,
    //   child:
    //   WillPopScope(
    //     onWillPop: () async {
    //       if (KAppX.router.currentPath == '/bottomNavigator' ||
    //           KAppX.router.currentPath == '/bottomNavigator/home') {
    //         // KAppX.router.pop();
    //         return true;
    //       }
    //
    //       return false;
    //     },
    //     child: AutoTabsRouter(
    //       // list of your tab routes
    //       // routes used here must be declaraed as children
    //       // routes of /dashboard
    //       routes: const [
    //
    //
    //       ],
    //       builder: (context, child, animation) {
    //         // obtain the scoped TabsRouter controller using context
    //         final tabsRouter = AutoTabsRouter.of(context);
    //         // Here we're building our Scaffold inside of AutoTabsRouter
    //         // to access the tabsRouter controller provided in this context
    //         //
    //         //alternatively you could use a global key
    //         return KScaffold(
    //           //can add animation on this as well
    //           body: child,
    //           //TODO: remove animation on select tab
    //           bottomNavigationBar: Theme(
    //             data: Theme.of(context).copyWith(
    //               canvasColor: currentTheme.themeBox.colors.background,
    //             ),
    //             child: BottomNavigationBar(
    //               currentIndex: tabsRouter.activeIndex,
    //               type: BottomNavigationBarType.fixed,
    //               onTap: (index) async {
    //
    //               },
    //               selectedItemColor: currentTheme.themeBox.colors.primary,
    //               unselectedItemColor:
    //                   currentTheme.themeBox.colors.onBackgroundVariant,
    //               unselectedLabelStyle: _buildLabelTextStyle(),
    //               selectedLabelStyle: _buildLabelTextStyle(),
    //               showUnselectedLabels: true,
    //               items: [
    //                 BottomNavigationBarItem(
    //                   icon: _buildNavigatorIcon(
    //                     KIcons.home,
    //                   ),
    //                   activeIcon: _buildNavigatorIcon(
    //                     KIcons.home,
    //                     color: currentTheme.themeBox.colors.primary,
    //                   ),
    //                   label: 'Home',
    //                 ),
    //                 BottomNavigationBarItem(
    //                   icon: _buildNavigatorIcon(
    //                     KIcons.friends,
    //                   ),
    //                   activeIcon: _buildNavigatorIcon(
    //                     KIcons.friends,
    //                     color: currentTheme.themeBox.colors.primary,
    //                   ),
    //                   label: 'Friends',
    //                 ),
    //                 BottomNavigationBarItem(
    //                   icon: _buildNavigatorIcon(
    //                     KIcons.cards,
    //                   ),
    //                   activeIcon: _buildNavigatorIcon(
    //                     KIcons.cards,
    //                     color: currentTheme.themeBox.colors.primary,
    //                   ),
    //                   label: 'Cards',
    //                 ),
    //                 BottomNavigationBarItem(
    //                   icon: _buildNavigatorIcon(
    //                     KIcons.notification,
    //                   ),
    //                   activeIcon: _buildNavigatorIcon(
    //                     KIcons.notification,
    //                     color: currentTheme.themeBox.colors.primary,
    //                   ),
    //                   label: 'Notifications',
    //                 ),
    //                 BottomNavigationBarItem(
    //                   icon: _buildNavigatorIcon(
    //                     KIcons.more,
    //                   ),
    //                   activeIcon: _buildNavigatorIcon(
    //                     KIcons.more,
    //                     color: currentTheme.themeBox.colors.primary,
    //                   ),
    //                   label: 'More',
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }

  Widget _buildNavigatorIcon(
    String asset, {
    Color? color,
  }) {
    return SvgPicture.asset(
      asset,
      color: color,
      width: 20.toAutoScaledWidth,
      height: 20.toAutoScaledHeight,
    );
  }

  TextStyle _buildLabelTextStyle() {
    final currentTheme = KAppX.globalProvider.read(KAppX.theme.current);

    return TextStyle(
      fontSize: currentTheme.themeBox.fontSizes.s10,
      fontWeight: currentTheme.themeBox.fontWeights.wBold,
      height: 15.toAutoScaledFont / currentTheme.themeBox.fontSizes.s10,
    );
  }
}
