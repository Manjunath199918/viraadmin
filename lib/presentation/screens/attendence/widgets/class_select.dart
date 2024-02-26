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

        body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 0.1, mainAxisSpacing: 0.1),
          itemBuilder: (BuildContext context, int index) {
            return classCard(currentTheme,index,(){
              stateController.moveToAttendance(1,index);
            });
          },
        ),


      ),
    );
  }

  Widget classCard(KThemeState currentTheme, int i, VoidCallback? onPressed) {
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
      child: KCard(
        paddingLeft: 5,
        paddingRight: 5,
        paddingBottom: 5,
        paddingTop: 5,
        height: 150.toAutoScaledHeight,
        width: 160.toAutoScaledWidth,
        backgroundColor: currentTheme.themeBox.colors.primary,
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
    );
  }
}