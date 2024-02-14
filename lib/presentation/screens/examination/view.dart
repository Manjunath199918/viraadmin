import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';

part 'controller.dart';
part 'widgets/class_select.dart';
part 'widgets/all_exams.dart';


class ExamniationScreen extends ConsumerWidget {
  int? index;
  ExamniationScreen({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);
    Widget type;
    switch (state.index) {

      case 0:
        type =   SelectClass();
        break;
      case 1:
        type =  AllExams();
        break;

      default:
        type = const KScaffold(
          body: Center(
            child: Text(
              'Unimplemented Screen',
            ),
          ),
        );
    }
    return
      SafeArea(

        child: KScaffold(
          body: type,
          floatingActionButton: FloatingActionButton(onPressed: (){
            stateController.openExamSelectionDialog();
          },backgroundColor: currentTheme.themeBox.colors.primary,child: Icon(Icons.add_chart_outlined),),
        ),
      );
  }

  Widget tabBar(bool isActive, WidgetRef ref, int i) {
    final currentTheme = ref.watch(KAppX.theme.current);
    List<String> heading = ['Pending', 'Completed'];
    KTextStyles kTextStyles = KTextStyles();
    return Container(
      decoration: BoxDecoration(
          // color: currentTheme.themeBox.colors.blankButton.withOpacity(0.04),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.toAutoScaledWidth),
            topRight: Radius.circular(12.toAutoScaledWidth),
            bottomLeft: Radius.circular(12.toAutoScaledWidth),
            bottomRight: Radius.circular(12.toAutoScaledWidth),
          ),
          color: isActive
              ? currentTheme.themeBox.colors.primary
              : currentTheme.themeBox.colors.primary.withOpacity(0.3)),
      height: 50.toAutoScaledHeight,
      width: 150.toAutoScaledWidth,
      child: Center(
        child: Text(
          heading[i],
          style:
              isActive ? kTextStyles.s12WhiteRegular : kTextStyles.s12BlackBold,
        ),
      ),
    );
  }

  Color? getColour(int i, var currentTheme) {
    if (i == 0) {
      return currentTheme.themeBox.colors.greenvariant;
    }
    if (i == 1) {
      return currentTheme.themeBox.colors.pinkVarinet;
    }
    if (i == 2) {
      return currentTheme.themeBox.colors.blueVarient;
    }
    if (i % 3 == 0) {
      return currentTheme.themeBox.colors.greenvariant;
    }
    if (i % 3 == 1) {
      return currentTheme.themeBox.colors.pinkVarinet;
    }

    if (i % 3 == 2) {
      return currentTheme.themeBox.colors.blueVarient;
    }
  }
}
