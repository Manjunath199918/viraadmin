part of '../view.dart';
class SelectClass extends ConsumerWidget {
  final int? index;
  SelectClass({Key? key, this.index}) : super(key: key);

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
              'Select Class',
              style: kTextStyles.s18WhiteBold,
            ),
          ),

          body:ListView.builder(
              itemCount: 10,
              itemBuilder: (context,i){
                return InkWell(
                  onTap: (){
                    stateController.setIndex(1);

                  },
                  child: KCard(
                    height: 55.toAutoScaledHeight,
                    width: 320.toAutoScaledWidth,
                    paddingTop: 5.toAutoScaledWidth,
                    backgroundColor:currentTheme.themeBox.colors.primary ,
                    child:Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${i+1}',style: kTextStyles.s16WhiteBold,),
                          Icon(Icons.keyboard_arrow_right,color: currentTheme.themeBox.colors.white,)
                        ],
                      ),
                    ),


                  ),
                );
              }),
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