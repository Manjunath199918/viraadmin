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
        child: WillPopScope(
          onWillPop: ()async{
            if(state.index==1){
              stateController.setIndex(0);
              return false;
            }
            return !false;
          },
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
                      10.toVerticalSizedBox,
                      SizedBox(
                        width: 360.toAutoScaledWidth,
                        child: Center(child: Text('Events for the date : ${DateFormat('dd/MM/yyyy').format(state.selectedDate!)}',maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: kTextStyles.s16PrimaryBold.copyWith(
                              decoration: TextDecoration.underline
                          ),),),
                      ),
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
                      KFlatButton(
                        loadingWidget:CircularProgressIndicator(
                          color: currentTheme.themeBox.colors.white,
                        ) ,
                        loading: state.status is Busy,onPressed: (){
                        stateController.uploadEvent(titleController.text.trim(),descController.text.trim());
                      },height: 55.toAutoScaledHeight,child: Text('Upload Event',style: kTextStyles.s16WhiteBold,),)




                    ],
                  ),
                ),
              )
          ),
        ));
  }
}