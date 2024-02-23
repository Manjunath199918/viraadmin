import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:viraadmin/constants/constants.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/amenities/googleAnalytics/analytics.dart';
import 'package:viraadmin/modules/domain/core/auth/auth.dart';
import 'package:viraadmin/modules/domain/core/notification/notification.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/form_fields/drop_down.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/textfields/textfields1.dart';

import 'package:viraadmin/presentation/screens/home/view.dart';

import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
import 'package:viraadmin/utils/helper/helper.dart';

part 'controller.dart';
part 'widgets/fetchusername.dart';
part 'widgets/signup.dart';


class LoginScreen extends ConsumerWidget {
  int? index;
  LoginScreen({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = _VSControllerParams(index: index);
    final state = ref.watch(_loginController(params));
    final stateController = ref.read(_loginController(params).notifier);

    ref.listen<_LoginState>(_loginController(params), (previous, next) {


      if (next.status is Error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.status.message!),
          ),
        );
      }
    });

    Widget type;
    switch (1) {

      case 0:
        type =   HomeScreen();
        break;
      case 1:
        type = const SignUp();
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
    return ProviderScope(
        overrides: [_paramsProvider.overrideWithValue(params)], child: type);
  }
}
