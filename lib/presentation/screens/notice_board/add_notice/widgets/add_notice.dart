part of '../view.dart';
TextEditingController titleController =TextEditingController();

TextEditingController descController =TextEditingController();
class AddNotice extends ConsumerWidget {
  final int? index;
  AddNotice({Key? key, this.index}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);

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
                    state.pickedFilePath!.isEmpty? InkWell(
                      onTap: (){
                        stateController.pickFile();

                      },
                      child: KCard(
                        paddingRight: 0,
                        paddingLeft: 0,
                        backgroundColor: currentTheme.themeBox.colors.backgroundVariant,
                        height: 250.toAutoScaledHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload_outlined,size: 100.toDouble(),),
                            Text('Click to upload files',style: kTextStyles.s20PrimaryBold,),
                          ],
                        ),
                      ),
                    ):
                    KCard(
                      paddingRight: 0,
                      paddingLeft: 0,
                      backgroundColor: currentTheme.themeBox.colors.backgroundVariant,
                      height: 250.toAutoScaledHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state.pickedFilePath!.split('.').last =='pdf'?Icon(Icons.picture_as_pdf_outlined,size: 100.toDouble(),):Icon(Icons.image,size: 100.toDouble(),),
                          Text(state.pickedFilePath!,style: kTextStyles.s20PrimaryBold,),
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