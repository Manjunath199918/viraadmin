part of '../view.dart';

class SelectSubject extends ConsumerWidget {
  final int? index;
  SelectSubject({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);
    return
      SafeArea(
        child: KScaffold(
          appBar: KAppBar(
            elevation: 0,

            backgroundColor: currentTheme.themeBox.colors.primary,
            title: Text(
              'Select Subject',
              style: kTextStyles.s18WhiteBold,
            ),
          ),

          body:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                   // KAppX.router.navigateToPage(MediaRoute());

                  },
                  child: KCard(
                    imageUrl: 'assets/subject/kannada.jpg',
                    height: 200.toAutoScaledHeight,
                    width: 320.toAutoScaledWidth,
                    child: Padding(
                      padding:  EdgeInsets.only(top: 140.toAutoScaledHeight,),
                      child: Container(
                        color: Colors.black.withOpacity(0.2),
                        child: Padding(
                          padding:  EdgeInsets.only(left: 8.toAutoScaledWidth,top: 8.toAutoScaledHeight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Kannada',style: kTextStyles.s20BlackBold,),
                              Text('Prof.Kalinga maharaj',style: kTextStyles.s12WhiteBold,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                KCard(
                  imageUrl: 'assets/subject/english.jpg',
                  height: 200.toAutoScaledHeight,
                  width: 320.toAutoScaledWidth,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 140.toAutoScaledHeight,),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 8.toAutoScaledWidth,top: 8.toAutoScaledHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('English',style: kTextStyles.s20BlackBold,),
                            Text('Prof.Name',style: kTextStyles.s12WhiteBold,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                KCard(
                  imageUrl: 'assets/subject/hindiimage.jpeg',
                  height: 200.toAutoScaledHeight,
                  width: 320.toAutoScaledWidth,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 140.toAutoScaledHeight,),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 8.toAutoScaledWidth,top: 8.toAutoScaledHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hindi',style: kTextStyles.s20BlackBold,),
                            Text('Prof.Name',style: kTextStyles.s12WhiteBold,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                KCard(
                  imageUrl: 'assets/subject/science.jpeg',
                  height: 200.toAutoScaledHeight,
                  width: 320.toAutoScaledWidth,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 140.toAutoScaledHeight,),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 8.toAutoScaledWidth,top: 8.toAutoScaledHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Science',style: kTextStyles.s20BlackBold,),
                            Text('Prof.Rudresh ',style: kTextStyles.s12WhiteBold,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                KCard(
                  imageUrl: 'assets/subject/socialscience.png',
                  height: 200.toAutoScaledHeight,
                  width: 320.toAutoScaledWidth,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 140.toAutoScaledHeight,),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 8.toAutoScaledWidth,top: 8.toAutoScaledHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(' Social Science',style: kTextStyles.s20BlackBold,),
                            Text('Prof.Name',style: kTextStyles.s12WhiteBold,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                KCard(
                  imageUrl: 'assets/subject/sanskrit.jpeg',
                  height: 200.toAutoScaledHeight,
                  width: 320.toAutoScaledWidth,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 140.toAutoScaledHeight,),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 8.toAutoScaledWidth,top: 8.toAutoScaledHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sanskrit',style: kTextStyles.s20BlackBold,),
                            Text('Prof.Name',style: kTextStyles.s12WhiteBold,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                KCard(
                  imageUrl: 'assets/subject/ptimage.jpeg',
                  height: 200.toAutoScaledHeight,
                  width: 320.toAutoScaledWidth,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 140.toAutoScaledHeight,),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 8.toAutoScaledWidth,top: 8.toAutoScaledHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Physical Education',style: kTextStyles.s20BlackBold,),
                            Text('Prof.Name',style: kTextStyles.s12WhiteBold,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      );
  }

  Widget contentBar(KThemeState currentTheme, String url, String name,
      VoidCallback? onPressed) {
    KTextStyles kTextStyles = KTextStyles();

    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 70.toAutoScaledHeight,
            width: 70.toAutoScaledWidth,
            decoration: BoxDecoration(
              color: currentTheme.themeBox.colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: currentTheme.themeBox.colors.greyVariant,
                  blurRadius: 2.toAutoScaledWidth,
                ),
              ], //This will make container round
            ),
            child: Center(
              child: KImage(
                imageUrl: url,
                height: 40.toAutoScaledHeight,
                width: 40.toAutoScaledWidth,
              ),
            ),
          ),
          10.toVerticalSizedBox,
          Text(
            name,
            style: kTextStyles.s14PrimaryBold,
          )
        ],
      ),
    );
  }
}