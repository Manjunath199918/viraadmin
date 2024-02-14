import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';

class KDropDown extends ConsumerWidget {
  final String title;
  final bool? isExpanded;
  final List? options;
  final void Function()? onTap;



  const KDropDown({
    Key? key,
    required this.title,
    this.isExpanded = false,
    required this.options,
    this.onTap,


  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);
    KTextStyles kTextStyles = KTextStyles();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: isExpanded!?0.toAutoScaledWidth:20.toAutoScaledWidth, top: 20.toAutoScaledHeight),
          child: Container(
            height: 40.toAutoScaledHeight,
            width: 320.toAutoScaledWidth,
            decoration: BoxDecoration(
              border: Border.all(
                  color: currentTheme.themeBox.colors.greyVariant
                      .withOpacity(0.3)),
              borderRadius: BorderRadius.all(Radius.circular(10
                      .toAutoScaledWidth) //                 <--- border radius here
                  ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.toAutoScaledWidth,
              ),
              child: Row(
                children: [
                  Text(
                    title,
                    style: kTextStyles.s12DarkBlueBold,
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: currentTheme.themeBox.colors.darkBlue,
                  )
                ],
              ),
            ),
          ),
        ),
        isExpanded! ? 15.toVerticalSizedBox : SizedBox(),
        isExpanded!
            ? Padding(
                padding: EdgeInsets.only(
                    left: 20.toAutoScaledWidth,
                    right: 20.toAutoScaledWidth,),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: currentTheme.themeBox.colors.greyVariant
                            .withOpacity(0.3)),
                    borderRadius: BorderRadius.all(Radius.circular(10
                            .toAutoScaledWidth) //                 <--- border radius here
                        ),
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: options!.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 15.toAutoScaledHeight,
                              left: 10.toAutoScaledWidth,
                              right: 10.toAutoScaledWidth),
                          child: Column(
                            children: [
                              Container(
                                height: 25.toAutoScaledHeight,
                                width: 320.toAutoScaledWidth,
                                child: Text(
                                  options![i],
                                  style: kTextStyles.s14BlackBold,
                                ),
                              ),
                              line()
                            ],
                          ),
                        );
                      }),
                ),
              )
            : const SizedBox()
      ],
    );
  }

  Widget line() {
    return Container(
        margin: EdgeInsets.fromLTRB(0.toAutoScaledWidth, 10.toAutoScaledHeight,
            0.toAutoScaledWidth, 0),
        width: 293.toAutoScaledWidth,
        height: 1.toAutoScaledHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/protfolio/line.png'),
            fit: BoxFit.fitWidth,
          ),
          shape: BoxShape.rectangle,
        ));
  }
}
