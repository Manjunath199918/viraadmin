import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';

import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextField1 extends ConsumerWidget {
  final TextEditingController? textEditingController;
  final String label;
  final Widget? preffixWidget;
  final bool? isNumber;
  final int? maxlines;
  // TextEditingController textControllerThree=TextEditingController();

  TextField1(
      {Key? key, required this.textEditingController, required this.label,this.preffixWidget,this.isNumber,this.maxlines})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);
    KTextStyles kTextStyles =KTextStyles();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: kTextStyles.s14PrimaryBold,),
        5.toVerticalSizedBox,
        TextFormField(

          controller: textEditingController,
          maxLines: maxlines??1,
          // style: TextStyle(
          //   color: currentTheme.themeBox.colors.white,
          // ),
          decoration: InputDecoration(
            suffix: preffixWidget ?? SizedBox(),
            border: OutlineInputBorder(

              borderSide: BorderSide(color: currentTheme.themeBox.colors.primary.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(12.toAutoScaledWidth),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: currentTheme.themeBox.colors.primary.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(12.toAutoScaledWidth),
            ),
            filled: false,
            fillColor: currentTheme.themeBox.colors.primary.withOpacity(0.5),

            // labelStyle: TextStyle(
            //   color: currentTheme.themeBox.colors.white,
            // ),
          ),
          keyboardType:isNumber!=null?TextInputType.number: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Cannot be empty';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
