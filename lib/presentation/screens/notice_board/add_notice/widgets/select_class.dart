part of '../view.dart';

class NoticeClassSelect extends ConsumerWidget {
  final int? index;
  NoticeClassSelect({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);

    return SafeArea(
      child: KScaffold(
        appBar: KAppBar(
          elevation: 0,
          backgroundColor: currentTheme.themeBox.colors.primary,
          title: Text(
            'Select Class',
            style: kTextStyles.s18WhiteBold,
          ),
        ),
        floatingActionButton: state.standardList.isEmpty
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(left: 30.toAutoScaledWidth),
                child: KFlatButton(
                  color: currentTheme.themeBox.colors.greyVariant,
                  height: 55.toAutoScaledHeight,
                  onPressed: () {
                    stateController.setIndex(1);
                  },
                  child: Text(
                    'Next',
                    style: kTextStyles.s16PrimaryBold,
                  ),
                ),
              ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  stateController.onAllPressed();

                },
                child: Padding(
                  padding:  EdgeInsets.all(5.toAutoScaledWidth),
                  child: Container(
                   decoration: state.standardList.length==10?BoxDecoration(
                     border: Border.all(color: Colors.red,width: 3),
                     borderRadius: BorderRadius.all(Radius.circular(12.toAutoScaledWidth)),
                     color: currentTheme.themeBox.colors.primary,
                   ): BoxDecoration(

                     borderRadius: BorderRadius.all(Radius.circular(12.toAutoScaledWidth)),
                     color: currentTheme.themeBox.colors.primary,
                   ),
                    height: 55.toAutoScaledHeight,
                    width: 360.toAutoScaledWidth,

                    child: Center(child: Text('Select All Classes',style: kTextStyles.s16WhiteBold,)),



                  ),
                ),
              ),


              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.1,
                    mainAxisSpacing: 0.1),
                itemBuilder: (BuildContext context, int index) {
                  return classCard(currentTheme, index, () {
                    stateController.addStandardList(index);
                  }, state.standardList.contains(index));
                },
              ),
            ],
          ),
        ),


      ),
    );
  }

  Widget classCard(KThemeState currentTheme, int i, VoidCallback? onPressed,
      bool addedAllReady) {
    KTextStyles kTextStyles = KTextStyles();
    List<String> images = [
      Assets.firstClass,
      Assets.secondClass,
      Assets.thirdClass,
      Assets.fourthClass,
      Assets.fifthClass,
      Assets.sixthClass,
      Assets.seventhClass,
      Assets.eightClass,
      Assets.ninethClass,
      Assets.tenthClass,
    ];
    List<String> classNames = [
      'First',
      'Second',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
    ];

    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding:  EdgeInsets.all(5.toAutoScaledWidth),
        child: Container(
          decoration: addedAllReady?BoxDecoration(
            border: Border.all(color: Colors.red,width: 3),
            borderRadius: BorderRadius.all(Radius.circular(12.toAutoScaledWidth)),
            color: currentTheme.themeBox.colors.primary,
          ): BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(12.toAutoScaledWidth)),
            color: currentTheme.themeBox.colors.primary,
          ),
          height: 150.toAutoScaledHeight,
          width: 140.toAutoScaledWidth,
          child: Stack(
            children: [
              Positioned(
                  top: 20.toAutoScaledHeight,
                  left: 50.toAutoScaledWidth,
                  child: KImage(
                      imageUrl: images[i],
                      width: 100.toAutoScaledWidth,
                      height: 100.toAutoScaledHeight)),
              Positioned(
                  top: 120.toAutoScaledHeight,
                  left: 20.toAutoScaledWidth,
                  child: Text(
                    classNames[i],
                    style: kTextStyles.s20WhiteBold,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
// class NoticeClassSelect extends ConsumerWidget {
//   final int? index;
//   NoticeClassSelect({Key? key, this.index}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentTheme = ref.watch(KAppX.theme.current);
//
//     KTextStyles kTextStyles = KTextStyles();
//
//     final params = _VSControllerParams(index: index);
//     final state = ref.watch(_vsProvider(params));
//     final stateController = ref.read(_vsProvider(params).notifier);
//     return
//       SafeArea(
//         child: KScaffold(
//           appBar: KAppBar(
//             elevation: 0,
//
//             backgroundColor: currentTheme.themeBox.colors.primary,
//             title: Text(
//               'Select Class',
//               style: kTextStyles.s18WhiteBold,
//             ),
//           ),
//
//           body:ListView.builder(
//               itemCount: 10,
//               itemBuilder: (context,i){
//                 return InkWell(
//                   onTap: (){
//                     stateController.setIndex(1);
//
//                   },
//                   child: KCard(
//                     height: 55.toAutoScaledHeight,
//                     width: 320.toAutoScaledWidth,
//                     paddingTop: 5.toAutoScaledWidth,
//                     backgroundColor:currentTheme.themeBox.colors.primary ,
//                     child:Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('${i+1}',style: kTextStyles.s16WhiteBold,),
//                           Icon(Icons.keyboard_arrow_right,color: currentTheme.themeBox.colors.white,)
//                         ],
//                       ),
//                     ),
//
//
//                   ),
//                 );
//               }),
//         ),
//       );
//   }
//
//   Widget contentBar(KThemeState currentTheme, String url, String name,
//       VoidCallback? onPressed) {
//     KTextStyles kTextStyles = KTextStyles();
//
//     return InkWell(
//       onTap: onPressed,
//       child: Column(
//         children: [
//           Container(
//             height: 70.toAutoScaledHeight,
//             width: 70.toAutoScaledWidth,
//             decoration: BoxDecoration(
//               color: currentTheme.themeBox.colors.white,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   color: currentTheme.themeBox.colors.greyVariant,
//                   blurRadius: 2.toAutoScaledWidth,
//                 ),
//               ], //This will make container round
//             ),
//             child: Center(
//               child: KImage(
//                 imageUrl: url,
//                 height: 40.toAutoScaledHeight,
//                 width: 40.toAutoScaledWidth,
//               ),
//             ),
//           ),
//           10.toVerticalSizedBox,
//           Text(
//             name,
//             style: kTextStyles.s14PrimaryBold,
//           )
//         ],
//       ),
//     );
//   }
// }
