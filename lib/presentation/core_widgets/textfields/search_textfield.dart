import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';

import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viraadmin/utils/helper/helper.dart';

class SearchTextField extends ConsumerWidget {
  final TextEditingController? textEditingController;
  final String label;
  final String image;
  final Function(String)? onChanged;
  final Widget? suffexWidget;
  SearchTextField(
      {Key? key, required this.textEditingController, required this.label,required this.image,this.onChanged,this.suffexWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    return TextFormField(


      controller: textEditingController,
      style: TextStyle(
        color: currentTheme.themeBox.colors.white,
      ),
      onChanged: onChanged,

      decoration: InputDecoration(
        suffix: suffexWidget ?? SizedBox(),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.toAutoScaledWidth),
        ),
        prefixIcon: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.toAutoScaledWidth),
          child: KImage(imageUrl: image, width: 25.toAutoScaledWidth, height: 25.toAutoScaledHeight),
        ),
        prefixIconConstraints: BoxConstraints(

            minWidth: 25.toAutoScaledWidth, minHeight: 25.toAutoScaledHeight        ),
        filled: true,
        fillColor: currentTheme.themeBox.colors.primary.withOpacity(0.5),
        labelText: label,
        labelStyle: TextStyle(
          color: HexColor.fromHex('#BBBBBB'),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Cannot be empty';
        } else {
          return null;
        }
      },

    );
  }
}
