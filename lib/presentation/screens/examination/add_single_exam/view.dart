import 'package:carousel_slider/carousel_slider.dart';
import 'package:equatable/equatable.dart';
import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:viraadmin/modules/data/core/router/intrinsic_router/intrinsic_router.gr.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/router/router.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/dotted_line.dart';
import 'package:viraadmin/presentation/core_widgets/seprater/line.dart';
import 'package:viraadmin/presentation/core_widgets/textfields/textfields1.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';
part 'controller.dart';

class AddSingleExam extends ConsumerStatefulWidget {
  const AddSingleExam({Key? key}) : super(key: key);

  @override
  ConsumerState<AddSingleExam> createState() =>
      _AddSingleExamState();
}

class _AddSingleExamState
    extends ConsumerState<AddSingleExam> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    late CarouselController _controller;
    final params = _VSControllerParams();
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);

    final Size size = MediaQuery.of(context).size;
    TextEditingController dateController =TextEditingController();
    TextEditingController examSubjectController =TextEditingController();
    TextEditingController examNameController =TextEditingController();
    TextEditingController syllabusController =TextEditingController();



    return KScaffold(
      appBar: KAppBar(
        title: Text(
          'Add Exam',
          style: kTextStyles.s16WhiteBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.toVerticalSizedBox,
                TextField1(textEditingController: examNameController,label: 'Exam name'),
                20.toVerticalSizedBox,
                TextField1(textEditingController: examSubjectController,label: 'Subject name'),
                20.toVerticalSizedBox,
                TextField1(textEditingController: dateController,label: 'Date of conduct'),
                20.toVerticalSizedBox,
                TextField1(textEditingController: syllabusController,label: 'Syllabus',maxlines: 5,),
                80.toVerticalSizedBox,
                KFlatButton(onPressed: (){},height: 55.toAutoScaledHeight,child: Text('Add',style: kTextStyles.s16WhiteBold,),)
              ]),
        ),
      ),
    );
  }
}
