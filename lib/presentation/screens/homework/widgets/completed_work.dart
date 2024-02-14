part of '../view.dart';


class CompletedWork extends ConsumerWidget {
  int? index;
  CompletedWork({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    List<String> items = [
      "Watch",
      "Jeans",
      "Shirt",
      "T-Shirt",
      "Cup",
      "Shoes",
      "Cap",
      "Shorts",
      "Trouser",
      "Lower",
    ];
    return
      SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){

            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:20.toAutoScaledWidth,vertical: 10.toAutoScaledHeight),
              child: Row(
                children: [
                  Text('Today',style: kTextStyles.s16DarkBlueBold,),
                  Icon(Icons.arrow_drop_down_outlined,color: currentTheme.themeBox.colors.darkBlue,)

                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            itemBuilder: (context, i) {
              return Dismissible(
                  background: Container(
                    color: currentTheme.themeBox.colors.darkBlue,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: const [
                          Icon(Icons.incomplete_circle, color: Colors.red),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text('Swipe to Complete',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.delete, color: Colors.white),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text('Move to trash',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,

                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                      print("Add to favorite");
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      KCard(
                        backgroundColor: currentTheme.themeBox.colors.onError,
                        // paddingBottom: ,
                        paddingBottom: 8.toAutoScaledHeight,
                        paddingTop: 8.toAutoScaledHeight,
                        width: 360.toAutoScaledWidth,
                        paddingLeft: 10.toAutoScaledWidth,
                        paddingRight: 10.toAutoScaledWidth,
                        height: 80.toAutoScaledHeight,

                        child: Row(
                          children: [
                            KCard(
                              paddingBottom: 0.toAutoScaledHeight,
                              paddingTop: 0.toAutoScaledHeight,
                              height: 80.toAutoScaledHeight,
                              width: 250.toAutoScaledWidth,
                              paddingLeft: 0,
                              paddingRight: 0,
                              backgroundColor: currentTheme.themeBox.colors.darkBlue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 210.toAutoScaledWidth,child: Text('Exercise Trigonometry 1st Topic Topic   ',overflow: TextOverflow.ellipsis,style: kTextStyles.s14WhiteBold,)),
                                      2.toVerticalSizedBox,
                                      Text('English',style: kTextStyles.s12GreyVariantRegular,)
                                    ],
                                  ),
                                  KImage(imageUrl: 'assets/profile/img_2.png', width: 25.toAutoScaledWidth, height: 25.toAutoScaledHeight)


                                ],),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(5.toAutoScaledWidth),
                              child: Container(
                                  width: 60.toAutoScaledWidth,child: Text('Swipe to  Incomplete',maxLines:2,overflow:TextOverflow.ellipsis,style: kTextStyles.s12WhiteBold,)),
                            ),
                          ],
                        ),
                      ),
                     // i==4?const KLine(): MySeparator(color: currentTheme.themeBox.colors.greyVariant,),

                    ],
                  )
              );
            },
            itemCount: 5,
          ),

        ],
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
