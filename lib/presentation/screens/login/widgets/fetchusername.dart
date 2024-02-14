part of '../view.dart';

class ForgotUserName extends ConsumerWidget {
  const ForgotUserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);
    final params = ref.watch(_paramsProvider);
    final controllerRef = ref.read(_loginController(params).notifier);

    KTextStyles kTextStyles = KTextStyles();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 50.toAutoScaledHeight, left: 20.toAutoScaledWidth),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot Your Credentials?',
                          style: kTextStyles.s24BlackRegular,
                        ),
                        Text(
                          'Welcome',
                          style: kTextStyles.s24BlackBold,
                        ),
                      ],
                    ),
                    // KCard(backgroundColor: currentTheme.themeBox.colors.white,imageUrl: 'assets/login/lock.png',height: 74.toAutoScaledHeight,width: 74.toAutoScaledWidth,)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.toAutoScaledWidth, top: 20.toAutoScaledHeight),
                child: RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    // style:  TextStyle(
                    //   fontSize: 14.0,
                    //   color: Colors.black,
                    // ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'To get your ',
                        style: kTextStyles.s12onBackgroundBold,
                      ),
                      TextSpan(
                          text: 'Credentials ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: currentTheme.themeBox.colors.darkBlue)),
                      TextSpan(
                        text: 'Please fill ',
                        style: kTextStyles.s12onBackgroundBold,
                      ),
                      TextSpan(
                          text: 'All information ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: currentTheme.themeBox.colors.darkBlue)),
                      TextSpan(
                        text: 'below \nthen confirm it ',
                        style: kTextStyles.s12onBackgroundBold,
                      ),
                    ],
                  ),
                ),
              ),


            const  KDropDown(title: 'Choose School',
                isExpanded:false,options: [
                'PBA',
                  'Suryavamshi',],),
              const  KDropDown(title: 'Year',
                isExpanded:false,options: [
                  '2017',
                  '2018',],),
            const  KDropDown(title: 'Choose Class',
                isExpanded:false,options: [
                  '1',
                  '2',],),
              const  KDropDown(title: 'Roll No',
                isExpanded:false,options: [
                  '001',
                  '002',],),



              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20.toAutoScaledWidth,
                    vertical: 105.toAutoScaledHeight),
                child: KFlatButton(
                    color: currentTheme.themeBox.colors.darkBlue,
                    borderRadius: BorderRadius.circular(15.toAutoScaledWidth),
                    borderStyle: Border.all(
                      color: currentTheme.themeBox.colors.onSecondary,
                    ),
                    child: Text(
                      'Confirm',
                      style: kTextStyles.s14WhiteBold,
                    ),
                    onPressed: () {}),
              ),

              //Padding(padding: EdgeInsets.only(left: 20.toAutoScaledWidth,top: 15.toAutoScaledHeight),child:  Text('we have send the verification code \nto +91 78657565657. Change phone number? '),)
            ],
          ),
        ),
      ),
    );
  }
  Widget line (){
    return Container(

        width: 320.toAutoScaledWidth,
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
