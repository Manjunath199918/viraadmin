part of '../view.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);

    sizeAnimation = Tween<double>(begin: 1.0, end: 80.0).animate(controller)
      ..addListener(() {
        setState(() {

        });

      });

    controller.repeat();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles =KTextStyles();
    final params = ref.watch(_paramsProvider);


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  KCard(
                    height: 350.toAutoScaledHeight,
                    width: 360.toAutoScaledWidth,
                    imageUrl: 'assets/login/verify_pin_bg.png',
                    paddingBottom: 0,
                    paddingRight: 0,
                    paddingTop: 0,
                    paddingLeft: 0,
                    topLeft: 0,
                    topRight: 0,
                    bottomLeft: 0,
                    bottomRight: 0,


                  ),


                  Positioned( top:70.toAutoScaledHeight,left:20.toAutoScaledWidth,child: Text('Vira',style: kTextStyles.s24WhiteBold,textAlign: TextAlign.center,)),
                  10.toVerticalSizedBox,
                  Positioned( top:110.toAutoScaledHeight,left:20.toAutoScaledWidth,child: Text('Your education partner in every \nstep of your life',style: kTextStyles.s14onBackgroundVariantRegular,)),
                  Positioned(top:70.toAutoScaledHeight,left:250.toAutoScaledWidth,child: KImage(imageUrl:'assets/login/img_12.png' ,width: 100.toAutoScaledWidth,height: 100.toAutoScaledHeight,)),
                  Positioned(
                      top: 200.toAutoScaledHeight,
                      left: 20.toAutoScaledWidth,
                      child: KCard(
                        paddingBottom: 0,
                        paddingRight: 0,
                        paddingTop: 0,
                        paddingLeft: 0,
                        topLeft: 0,
                        topRight: 0,
                        bottomLeft: 0,
                        bottomRight: 0,
                        height: 10.toAutoScaledHeight,
                        width: sizeAnimation.value,
                        backgroundColor: HexColor.fromHex('#54BA68'),
                      )),
                  Positioned(
                    top: 220.toAutoScaledHeight,
                    left: 20.toAutoScaledWidth,
                    child: SizedBox(
                      height: 55.toAutoScaledHeight,
                      child: DefaultTextStyle(
                        style: kTextStyles.s16WhiteBold,
                        child: AnimatedTextKit(


                          repeatForever: true,
                          isRepeatingAnimation: true,
                          animatedTexts: [
                            FadeAnimatedText(
                              'Attendance',
                            ),
                            FadeAnimatedText(
                              'Parents Teacher Meeting',
                            ),
                            FadeAnimatedText(
                              'HomeWork',
                            ),
                            FadeAnimatedText(
                              'Report Card',
                            ),
                            FadeAnimatedText(
                              'Notice Board',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),





                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,top: 10.toAutoScaledHeight),
                      child: Text('UserName',style: kTextStyles.s16BlackBold,),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth,vertical: 10.toAutoScaledHeight),
                      child: Material(
                        elevation: 5.toAutoScaledWidth,
                        borderRadius: BorderRadius.circular(15.toAutoScaledWidth),
                        child: TextFormField(
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.toAutoScaledWidth,top: 15.toAutoScaledHeight),

                            hintText: 'Ex:2017PBA01022',

                            filled: true,
                            fillColor: currentTheme.themeBox.colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.toAutoScaledWidth),
                              borderSide:
                              BorderSide.none,
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.toAutoScaledWidth),
                              borderSide:
                              BorderSide.none,


                            ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.toAutoScaledWidth,top: 10.toAutoScaledHeight),
                      child: Text('Password',style: kTextStyles.s16BlackBold,),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth,vertical: 10.toAutoScaledHeight),
                      child: Material(
                        elevation: 5.toAutoScaledWidth,
                        borderRadius: BorderRadius.circular(15.toAutoScaledWidth),
                        child: TextFormField(
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.toAutoScaledWidth,top: 15.toAutoScaledHeight),

                            hintText: 'Ex:15/04/2003',
                            filled: true,
                            fillColor: currentTheme.themeBox.colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.toAutoScaledWidth),
                              borderSide:
                              BorderSide.none,
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.toAutoScaledWidth),
                              borderSide:
                              BorderSide.none,


                            ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),



                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth,vertical: 30.toAutoScaledHeight),
                child: KFlatButton(

                    color: currentTheme.themeBox.colors.darkBlue,
                    borderRadius: BorderRadius.circular(15.toAutoScaledWidth),
                    borderStyle: Border.all(color: currentTheme.themeBox.colors.onSecondary,),
                    child: Text('Submit',style: kTextStyles.s14WhiteBold,), onPressed: (){
                  if (_formKey.currentState!.validate()) {

                  }
                }),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth,vertical: 30.toAutoScaledHeight),
                child: Container(
                  width:320.toAutoScaledWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Need help in login',style: kTextStyles.s14greyVariantBold,textAlign: TextAlign.center,
                      ),
                      Text('Forgot Username?',style: kTextStyles.s12DarkBlueBold,textAlign: TextAlign.center,
              ),
                    ],
                  ),
                ),)

            ],
          ),
        ),
      ),
    );
  }
}



