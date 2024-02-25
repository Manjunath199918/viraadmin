import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:viraadmin/constants/assets.dart';
import 'package:viraadmin/constants/constants.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/textfields/textfields1.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';

part 'controller.dart';
part 'widgets/create_timetableevent.dart';
part 'widgets/select_class.dart';
part 'widgets/table_view.dart';
class TimeTableScreen extends ConsumerWidget {
  final int? index;
  TimeTableScreen({Key? key, this.index}) : super(key: key);

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
        type =  TableView();
        break;
      case 2:
        type =  CreateTimeTableEvent();
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
        child: type,
      );
  }


}


