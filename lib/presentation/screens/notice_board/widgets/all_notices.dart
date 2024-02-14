part of '../view.dart';

class AllNotices extends ConsumerWidget {
  int? index;
  AllNotices({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);

    ref.listen<_ViewState>(_vsProvider(params), (previous, next) {
      if (next.status is Error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.status.message!),
          ),
        );
      }
    });
    return SafeArea(
        child: KScaffold(
            appBar: KAppBar(

              title:  Text('Notice Board',style: kTextStyles.s20WhiteBold,),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: currentTheme.themeBox.colors.primary,
              child: Text('Add'),
              onPressed: (){
                KAppX.router.navigate(AddNoticeHome());
              },

            ),
            body:
            ListView.builder(itemBuilder: (context,i){return KCard(
              boxShadow: [BoxShadow(
                color: currentTheme.themeBox.colors.paleGrey,
                blurRadius: 5.toAutoScaledWidth,
              ),],
              paddingTop: 7.toAutoScaledHeight,
              paddingBottom: 8.toAutoScaledHeight,
              width: 320.toAutoScaledWidth,
              height: 120.toAutoScaledHeight,
              backgroundColor: currentTheme.themeBox.colors.white,
              child: InkWell(
                onTap: (){
                  stateController.setIndex(1);
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.toAutoScaledWidth,vertical: 10.toAutoScaledHeight),
                  child: Column(
                    children:  [
                      Text("Attention all sports enthusiasts! We've got a small but exciting sports notice to share.We've got a small but exciting sports notice to share",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kTextStyles.s16BlackBold,),
                      10.toVerticalSizedBox,
                      Row(
                        children: [
                          Row(
                            children:  [
                              Icon(Icons.person,size: 20,color: currentTheme.themeBox.colors.onBackgroundVariant,),
                              5.toHorizontalSizedBox,
                              Text('Manjunath' ,style:kTextStyles.s14onBackgroundVariantRegular,)


                            ],
                          ),
                          25.toHorizontalSizedBox,
                          Row(
                            children:  [
                              Icon(Icons.calendar_month_rounded,size: 20,color: currentTheme.themeBox.colors.onBackgroundVariant,),
                              5.toHorizontalSizedBox,
                              Text('4 Mar,2021' ,style:kTextStyles.s14onBackgroundVariantRegular,)


                            ],
                          )

                        ],
                      ),
                      10.toVerticalSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sport',style:kTextStyles.s14BlackBold.copyWith(
                              color: getColour(i,currentTheme)
                          ),),
                          Icon(Icons.keyboard_arrow_right,size: 20,color: getColour(i,currentTheme)),


                        ],
                      )

                    ],
                  ),
                ),
              ),
            );},itemCount: 5,)));
  }
  Color? getColour(int i,KThemeState currentTheme){
    if(i==0){
      return currentTheme.themeBox.colors.green;
    }
    if(i==1){
      return currentTheme.themeBox.colors.darkBlue;
    }
    if(i==2){
      return currentTheme.themeBox.colors.green;
    }
    if(i%3==0){
      return currentTheme.themeBox.colors.darkBlue;
    }
    if(i%3==1){
      return currentTheme.themeBox.colors.onError;
    }

    if(i%3==2){
      return currentTheme.themeBox.colors.darkBlue;
    }

  }
}