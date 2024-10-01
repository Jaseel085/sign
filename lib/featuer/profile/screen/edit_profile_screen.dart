import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/featuer/auth/controller/auth_controller.dart';
import 'package:sign/featuer/home/home_page.dart';
import 'package:sign/featuer/home/splash_screen.dart';
import 'package:sign/model/user_model.dart';

import '../../../core/utils.dart';
import '../../../main.dart';
UploadTask?uploadTask;
File? profileFile;
String?urlDownload;
UserModel? currentUserModel;
class UserRegisterScreen extends ConsumerStatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  ConsumerState createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends ConsumerState<UserRegisterScreen> {
  final nameController=TextEditingController();
  final iGraduationController=TextEditingController();
  final mGraduationController=TextEditingController();
  final yearController=TextEditingController();
  final placeController=TextEditingController();
  final numberController=TextEditingController();


  final List<String> images=[];
  void selecteProfileImage(String name)async{
    final res=await pickImage();
    if (res!=null){
      setState(() async {
        profileFile=File(res.files.first.path!);
        var bytes=await profileFile?.readAsBytes();
        images.add(res!.paths.toString());
        uploadFileToFIreBase(name,bytes);
        urlDownload='';
      });
    }
  }

  Future uploadFileToFIreBase(String name, fileByets)async{
    uploadTask=FirebaseStorage.instance.
    ref('profile/${DateTime.now().toString()}-$name').putData(fileByets,SettableMetadata(
        contentType: 'image/jpeg'
    ));
    final snapShot=await uploadTask?.whenComplete(() {});
    urlDownload=(await snapShot?.ref?.getDownloadURL());
    await Future.delayed(Duration(seconds: 1));
    setState(() {}
    );

  }
@override
  void initState() {
    nameController.text=currentUserModel!.name;
    mGraduationController.text=currentUserModel!.mGraduation;
    iGraduationController.text=currentUserModel!.iGraduation;
    placeController.text=currentUserModel!.place;
    numberController.text=currentUserModel!.number;
    yearController.text=currentUserModel!.year;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user=ref.watch(userProvider)!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPage.primerycolour,
          title: Text('UPDATE PROFILE',style: TextStyle(
            fontWeight: FontWeight.w800
          ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: wi*0.05,),
                GestureDetector(
                    onTap: () {
                    selecteProfileImage('jg');
                    // print(user.profilePic);
                  },
                  child: urlDownload!=null?
                      CircleAvatar(
                        radius: wi*0.2,
                        backgroundImage: NetworkImage(urlDownload.toString()),
                      ):CircleAvatar(
                    radius: wi*0.2,
                    backgroundImage: NetworkImage(user.profilePic),
                  )
                ),
                SizedBox(height: wi*0.08,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(wi*0.03),
                            borderSide: BorderSide(
                              color: ColorPage.primerycolour
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorPage.primerycolour),
                            borderRadius: BorderRadius.circular(wi*0.03)
                          ),
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: ColorPage.primerycolour,
                          ),
                          hintText: 'Please Enter Your Name',
                          hintStyle: TextStyle(
                            color: ColorPage.black.withOpacity(0.4)
                          )
                        ),
                      ),
                      SizedBox(height: wi*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                              controller: iGraduationController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(wi*0.03),
                                  borderSide: BorderSide(
                                    color: ColorPage.primerycolour
                                  )
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorPage.primerycolour),
                                  borderRadius: BorderRadius.circular(wi*0.03)
                                ),
                                labelText: 'Islamic Graduation',
                                labelStyle: TextStyle(
                                  color: ColorPage.primerycolour,
                                  fontSize: wi*0.03
                                ),
                                hintText: 'Saqafi,Falili,Ahsani,etc..',
                                hintStyle: TextStyle(
                                  color: ColorPage.black.withOpacity(0.4)
                                )
                              ),
                            ),
                          ),
                         SizedBox(width: wi*0.02,),
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                              controller: mGraduationController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(wi*0.03),
                                      borderSide: BorderSide(
                                          color: ColorPage.primerycolour
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorPage.primerycolour),
                                      borderRadius: BorderRadius.circular(wi*0.03)
                                  ),
                                  labelText: 'Metirial Graduation',
                                  labelStyle: TextStyle(
                                    fontSize: wi*0.03,
                                    color: ColorPage.primerycolour,
                                  ),
                                  hintText: 'Degree,PG,etc..',
                                  hintStyle: TextStyle(
                                    fontSize: wi*0.03,
                                      color: ColorPage.black.withOpacity(0.4)
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: wi*0.03,),
                      TextFormField(
                        controller: placeController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(wi*0.03),
                            borderSide: BorderSide(
                              color: ColorPage.primerycolour
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorPage.primerycolour),
                            borderRadius: BorderRadius.circular(wi*0.03)
                          ),
                          labelText: 'Place',
                          labelStyle: TextStyle(
                            color: ColorPage.primerycolour,
                          ),
                          hintText: 'Please Enter Your Place',
                          hintStyle: TextStyle(
                            color: ColorPage.black.withOpacity(0.4)
                          )
                        ),
                      ),
                      SizedBox(height: wi*0.03,),
                      TextFormField(
                        controller: numberController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(wi*0.03),
                            borderSide: BorderSide(
                              color: ColorPage.primerycolour
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorPage.primerycolour),
                            borderRadius: BorderRadius.circular(wi*0.03)
                          ),
                          labelText: 'Number',
                          labelStyle: TextStyle(
                            color: ColorPage.primerycolour,
                          ),
                          hintText: 'Please Enter Your Number',
                          hintStyle: TextStyle(
                            color: ColorPage.black.withOpacity(0.4)
                          )
                        ),
                      ),
                      SizedBox(height: wi*0.03,),
                      TextFormField(
                        controller: yearController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        maxLength: 4,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(wi*0.03),
                                borderSide: BorderSide(
                                    color: ColorPage.primerycolour
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorPage.primerycolour),
                                borderRadius: BorderRadius.circular(wi*0.03)
                            ),
                            labelText: 'Year',
                            labelStyle: TextStyle(
                              color: ColorPage.primerycolour,
                            ),
                            hintText: 'Pass out year',
                            hintStyle: TextStyle(
                                color: ColorPage.black.withOpacity(0.4)
                            )
                        ),
                      ),
                      SizedBox(height: wi*0.03,),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    UserModel userModel=UserModel(
                        name: nameController.text.isEmpty?user.name:nameController.text,
                        profilePic: urlDownload!=null?urlDownload.toString():user.profilePic,
                        uid: user.uid,
                        isAuthenticated: true,
                        place: placeController.text,
                        iGraduation: iGraduationController.text,
                        mGraduation: mGraduationController.text,
                        number: numberController.text,
                      year: yearController.text
                    );

                    setState(() {

                    });

                    ref.read(authControllerProvider.notifier).updateUser(userModel);
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => HomeScreen(),));
                  },
                  child: Container(height: wi*0.12,
                  width: wi*0.4,
                  decoration: BoxDecoration(
                    color: ColorPage.primerycolour,
                    borderRadius: BorderRadius.circular(wi*0.03)
                  ),
                  child: Center(
                    child: Text('UPDATE',style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: wi*0.05,
                      color: Colors.white
                    ),
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
