import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
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

part 'controller.dart';
part 'widgets/notice_section.dart';
part 'widgets/teacher_section.dart';
class SubjectDetails extends ConsumerWidget {
  final int? index;
  const SubjectDetails({Key? key, this.index}) : super(key: key);
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
        type =   NoticeSection();
        break;
      case 1:
        type =  TeacherSection();
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
              appBar: KAppBar(

                title: Text(
                  'Fee Details',
                  style: kTextStyles.s18WhiteBold,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.toVerticalSizedBox,

                    Container(
                      width: 360.toAutoScaledWidth,
                      height: 40.toAutoScaledHeight,
                      // color: currentTheme.themeBox.colors.darkBlue,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[

                          for (int i = 0; i < 2; i++)
                            if (i == state.index) ...[
                              InkWell(
                                  onTap: () {
                                    stateController.setIndex(i);
                                  },
                                  child: tabBar(true, ref, i))
                            ] else
                              InkWell( onTap: () {
                                stateController.setIndex(i);
                              },child: tabBar(false, ref, i)),
                        ],
                      ),
                    ),
                    type
                    // 50.toVerticalSizedBox,

                  ],
                ),
              ))
      );
  }
  Widget tabBar(bool isActive, WidgetRef ref, int i) {
    final currentTheme = ref.watch(KAppX.theme.current);
    List<String> heading = [
      'Notices',
      'Teachers',

    ];
    KTextStyles kTextStyles = KTextStyles();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        i!=0?30.toHorizontalSizedBox:20.toHorizontalSizedBox,
        Column(
          children: [
            Text(
              heading[i],
              style: isActive?kTextStyles.s16onErrorBold:kTextStyles.s16PrimaryBold,
            ),
            10.toVerticalSizedBox,
            isActive
                ? AnimatedContainer(
              duration: Duration(milliseconds: 150),
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 2.toAutoScaledHeight,
              width: 80.toAutoScaledWidth,
              decoration: BoxDecoration(
                  color: currentTheme.themeBox.colors.onError,
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.toAutoScaledWidth))),
            )
                : const SizedBox(),
          ],
        ),
        i==3?30.toHorizontalSizedBox:0.toHorizontalSizedBox,
      ],
    );
  }

}
