part of '../view.dart';

class NoticeBoardDescriptionScreen extends ConsumerWidget {
  NoticeBoardDescriptionScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();
    final params = _VSControllerParams();
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
        child: WillPopScope(
          onWillPop: () async {
            if(state.index==1){
              stateController.setIndex(0);
            }
            return false;
          },
          child: KScaffold(
              appBar:  KAppBar(

                title: Text(' Description',style: kTextStyles.s20WhiteBold,),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.toVerticalSizedBox,
                    Padding(
                      padding: EdgeInsets.only(left: 20.toAutoScaledWidth),
                      child: Text('Sport',style: kTextStyles.s14onErrorBold,),
                    ),
                    10.toVerticalSizedBox,
                    Padding(
                      padding: EdgeInsets.only(left: 20.toAutoScaledWidth),
                      child: Text('Ms Dhoni Announce his retirement .. all the fans are in pain now ',style: kTextStyles.s24BlackBold,),
                    ),
                    10.toVerticalSizedBox,
                    Padding(
                      padding: EdgeInsets.only(right: 20.toAutoScaledWidth,left: 20.toAutoScaledWidth),
                      child: Row(
                        children: [
                          Text('Published from Manjunath',style: kTextStyles.s14onSecondaryVariantRegular,),
                          Spacer(),
                          Text(DateFormat('EEE ,MMM d ,yyyy').format(DateTime.now()),style: kTextStyles.s14onSecondaryVariantRegular,)
                        ],
                      ),
                    ),
                    20.toVerticalSizedBox,
                    Stack(

                      children: [
                        Image.network('https://googleflutter.com/sample_image.jpg',height:250.toAutoScaledHeight,width:360.toAutoScaledWidth,fit: BoxFit.cover,),
                        Positioned(
                          top: 200.toAutoScaledHeight,
                          child: Container(
                            width: 360.toAutoScaledWidth,
                            height: 50.toAutoScaledHeight,
                            color: currentTheme.themeBox.colors.white.withOpacity(0.6),
                            child: Center(child: KFlatButton( onPressed: (){},color: Colors.transparent,child: Text('See More',style: kTextStyles.s16BlackBold,))),
                          ),
                        )
                      ],
                    ),
                    20.toVerticalSizedBox,
                    Padding(
                      padding:  EdgeInsets.only(left:  20.toAutoScaledWidth,right: 20.toAutoScaledWidth),
                      child: Text('Mahendra Singh Dhoni is an Indian professional cricketer. He was captain of the Indian national team in limited-overs formats from 2007 to 2017 and in Test cricket from 2008 to 2014. He plays as a right-handed wicket-keeper-batsman and is also the current captain of Chennai Super Kings in the Indian Premier League\n \nDhoni made his international debut in 2004. His talent with the bat came to the fore in an innings of 148 runs against Pakistan in his fifth international match. Within a year he joined the India Test team, where he quickly established himself with a century (100 or more runs in a single innings) against Pakistan. Despite his inexperience, Dhoni took over the captaincy of the one-day side in 2007 and led India to the Twenty20 (T20) world title',style: kTextStyles.s14BlackBold,),
                    )
                  ],
                ),
              )),
        ));
  }
}