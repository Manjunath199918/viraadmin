import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viraadmin/constants/assets.dart';
import 'package:viraadmin/constants/constants.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/form_fields/text_form_field.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/textfields/textfields1.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
part 'widgets/select_class.dart';
part 'widgets/add_notice.dart';
part 'controller.dart';
class AddNoticeHome extends ConsumerWidget {
  final int? index;
  AddNoticeHome({Key? key, this.index}) : super(key: key);
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
        type =   NoticeClassSelect();
        break;
      case 1:
        type =  AddNotice();
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
