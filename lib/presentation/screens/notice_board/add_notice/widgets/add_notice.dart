part of '../view.dart';
TextEditingController titleController =TextEditingController();

TextEditingController descController =TextEditingController();
class AddNotice extends ConsumerWidget {
  AddNotice();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    return SafeArea(
        child: KScaffold(
            appBar:  KAppBar(

              title: Text(' Add Notice',style: kTextStyles.s20WhiteBold,),
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