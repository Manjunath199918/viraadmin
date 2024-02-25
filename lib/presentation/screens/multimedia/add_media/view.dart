import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viraadmin/modules/data/core/theme/services/dimensional/dimensional.dart';
import 'package:viraadmin/modules/domain/core/storage/persistent_storage/persistent_storage.dart';
import 'package:viraadmin/modules/domain/repository/auth/auth_repository.dart';
import 'package:viraadmin/modules/domain/repository/auth/models/user.dart';
import 'package:viraadmin/presentation/core_widgets/app_bar/app_bar.dart';
import 'package:viraadmin/presentation/core_widgets/card/card.dart';
import 'package:viraadmin/presentation/core_widgets/custom_textstyle/CustomTextStyle.dart';
import 'package:viraadmin/presentation/core_widgets/form_fields/text_form_field.dart';
import 'package:viraadmin/presentation/core_widgets/image/custom_image.dart';
import 'package:viraadmin/presentation/core_widgets/pressables/flat_button.dart';
import 'package:viraadmin/presentation/core_widgets/scaffold/scaffold.dart';
import 'package:viraadmin/presentation/core_widgets/textfields/textfields1.dart';
import 'package:viraadmin/utils/app_extensions/app_extension.dart';
import 'package:viraadmin/utils/helper/custom_extensions/state.dart';

part 'controller.dart';
TextEditingController titleController =TextEditingController();
TextEditingController descriptionController =TextEditingController();
class CreateMedia extends ConsumerWidget {
  final int? index;
  final String? collectionName;
  const CreateMedia({Key? key, this.index,this.collectionName}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(KAppX.theme.current);

    KTextStyles kTextStyles = KTextStyles();

    final params = _VSControllerParams(index: index,collectionName: collectionName);
    final state = ref.watch(_vsProvider(params));
    final stateController = ref.read(_vsProvider(params).notifier);


   
    
    return  SafeArea(
        child: KScaffold(
            appBar:  KAppBar(

              title: Text('Upload Notes',style: kTextStyles.s20WhiteBold,),
            ),
            body: SingleChildScrollView(
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
                    TextField1(textEditingController: descriptionController,label: 'Description',maxlines: 5,),
                    80.toVerticalSizedBox,
                    KFlatButton(onPressed: (){
                      stateController.uploadFile(titleController.text.trim(),descriptionController.text.trim());
                    },height: 55.toAutoScaledHeight,
                      loadingWidget:CircularProgressIndicator(
                        color: currentTheme.themeBox.colors.white,
                      ) ,
                      loading: state.status is Busy,child: Text('Upload Event',style: kTextStyles.s16WhiteBold,),)




                  ],
                ),
              ),
            )));
  }
}
