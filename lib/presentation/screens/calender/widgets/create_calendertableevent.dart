part of '../view.dart';
TextEditingController titleController =TextEditingController();

TextEditingController descController =TextEditingController();

class CreateCalenderEvent extends ConsumerWidget {
  final int? index;
  const CreateCalenderEvent({Key? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);




    return  SafeArea(
        child: KScaffold(
            appBar:  KAppBar(

              title: Text('Upload Event',style: kTextStyles.s20WhiteBold,),
            ),
            body:
            SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.toAutoScaledWidth),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KCard(
                      paddingRight: 0,
                      paddingLeft: 0,
                      backgroundColor: currentTheme.themeBox.colors.backgroundVariant,
                      height: 250.toAutoScaledHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_upload_outlined,size: 100.toDouble(),),
                          Text('Click to upload image',style: kTextStyles.s20PrimaryBold,),
                        ],
                      ),
                    ),
                    20.toVerticalSizedBox,
                    TextField1(textEditingController: titleController,label: 'Title'),
                    20.toVerticalSizedBox,
                    TextField1(textEditingController: descController,label: 'Description',maxlines: 6,),
                    20.toVerticalSizedBox,
                    KFlatButton(child: Text('Upload Event',style: kTextStyles.s16WhiteBold,), onPressed: (){},height: 55.toAutoScaledHeight,)




                  ],
                ),
              ),
            )
        ));
  }
}