import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';

class KTextFormField extends ConsumerWidget {
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final UnderlineInputBorder? errorBorder;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool autoFocus;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool obscureText;
  final TextStyle? style;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool showCounterText;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color? cursorColor;
  final Radius? cursorRadius;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final String? title,hintText;
  final double? width,height,paddingLeft;

  const KTextFormField(
      {Key? key,
      this.initialValue,
      this.onChanged,
      this.onSubmitted,
      this.errorBorder,
      this.maxLines,
      this.maxLength,
      this.autoFocus = false,
      this.decoration,
      this.inputFormatters,
      this.keyboardType,
      this.enabled = true,
      this.obscureText = false,
      this.style,
      this.minLines,
      this.focusNode,
      this.controller,
      this.showCounterText = false,
      this.textInputAction,
      this.readOnly = false,
      this.textCapitalization = TextCapitalization.none,
      this.textAlign = TextAlign.start,
      this.cursorColor,
      this.cursorRadius,
      this.onTap,
      this.validator,
      this.title,
      this.height,
      this.width,
        this.hintText,
        this.paddingLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);
    KTextStyles kTextStyles = KTextStyles();
    return KCard(

      width: width??320.toAutoScaledWidth,
      height:height?? 68.toAutoScaledHeight,
      paddingLeft: paddingLeft??20.toAutoScaledWidth,



      child: Stack(
        children: [
          Positioned(
              left: 15.toAutoScaledWidth,
              top: 15.toAutoScaledHeight,
              child: Text(
                title ?? '',
                style: kTextStyles.s10DarkBlueBold,
              )),

          Positioned(
            left: 15.toAutoScaledWidth,
            right: 15.toAutoScaledWidth,
            top: 20.toAutoScaledHeight,
            child: Container(
              width:width?? 320.toAutoScaledWidth,

              child: TextFormField(

                cursorColor: cursorColor ?? currentTheme.themeBox.colors.primary,
                cursorRadius: cursorRadius ?? Radius.circular(12.toAutoScaledWidth),
                textInputAction: textInputAction,
                controller: controller,
                focusNode: focusNode,
                enabled: enabled,
                maxLines: maxLines,
                minLines: minLines,
                obscureText: obscureText,
                maxLength: maxLength,

                // style: style ?? _buildTextStyle(),
                textAlign: textAlign,
                readOnly: readOnly,
                textAlignVertical: TextAlignVertical.center,
                decoration: decoration,
                textCapitalization: textCapitalization,
                initialValue: controller != null ? null : initialValue,
                onChanged: onChanged,
                onFieldSubmitted: onSubmitted,
                autofocus: autoFocus,
                inputFormatters: inputFormatters,
                keyboardType: keyboardType,
                validator: validator,

                onTap: () {
                  KAppX.services.haptics.hapticLight();

                  onTap?.call();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
