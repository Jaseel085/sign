import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign/core/commen/error.dart';
import 'package:sign/core/commen/loader.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/featuer/auth/controller/auth_controller.dart';
import 'package:sign/featuer/members/cotroller/members_controller.dart';
import 'package:sign/model/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';

class UserDetailsScreen extends ConsumerStatefulWidget {
  final  UserModel userData;
  const UserDetailsScreen({super.key,
  required this.userData
  });

  @override
  ConsumerState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends ConsumerState<UserDetailsScreen> {
  UserModel?userModel;
  @override
  Widget build(BuildContext context) {
    final Uri whatsApp=Uri.parse('http://wa.me/+91${widget.userData.number}');
    final Uri phone=Uri.parse('tel+91${widget.userData.number}');

    final user=ref.watch(userProvider)!;
    return
      ref.watch(getAllMembersProvider).when(data: (usersList)=>
          SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPage.primerycolour,
            ),
            body: Padding(
              padding:  EdgeInsets.all(wi*0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: wi*01.2,
                    width: wi*1,
                    decoration: BoxDecoration(
                      boxShadow:[BoxShadow(color: ColorPage.black.withOpacity(0.2),
                      offset: Offset(0,4),
                        spreadRadius: 2,
                        blurRadius: 4
                      ),
                      ],
                      border: Border.all(color: ColorPage.primerycolour.withOpacity(0.5)),
                        color: ColorPage.white,
                        borderRadius:
                        BorderRadius.circular(wi*0.04)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {

                                },
                                child: CircleAvatar(
                                  radius: wi*0.2,
                                  backgroundImage: NetworkImage(widget.userData.profilePic),
                                ),
                              )
                            ],
                          ),
                          // SizedBox(height: wi*0.04,),
                    // userModel = UserModel.fromMap(usersList[index].toMap());
                          Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('NAME:',style: TextStyle(
                                      color: ColorPage.black.withOpacity(0.5),
                                      fontSize: wi*0.04,
                                      fontWeight: FontWeight.w500
                                    ),),
                                    // SizedBox(width: wi*0.03,),
                                    Text(widget.userData.name.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: wi*0.04,
                                      color: ColorPage.brown
                                    ),),
                                  ],
                                ),
                              ),
                              // SizedBox(height: wi*0.03,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('ISLAMIC GRADUATION:',style: TextStyle(
                                        color: ColorPage.black.withOpacity(0.5),
                                        fontSize: wi*0.04,
                                        fontWeight: FontWeight.w500
                                    ),),
                                    // SizedBox(width: wi*0.03,),
                                    Text(widget.userData.iGraduation.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: wi*0.04,
                                          color: ColorPage.brown
                                      ),),
                                  ],
                                ),
                              ),
                              // SizedBox(height: wi*0.03,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('METIRIAL GRADUATION:',style: TextStyle(
                                        color: ColorPage.black.withOpacity(0.5),
                                        fontSize: wi*0.04,
                                        fontWeight: FontWeight.w500
                                    ),),
                                    // SizedBox(width: wi*0.03,),
                                    Text(widget.userData.mGraduation.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: wi*0.04,
                                          color: ColorPage.brown
                                      ),),
                                  ],
                                ),
                              ),
                              // SizedBox(height: wi*0.03,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('PLACE:',style: TextStyle(
                                        color: ColorPage.black.withOpacity(0.5),
                                        fontSize: wi*0.04,
                                        fontWeight: FontWeight.w500
                                    ),),
                                    SizedBox(width: wi*0.03,),
                                    Text(widget.userData.place.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: wi*0.04,
                                          color: ColorPage.brown
                                      ),),
                                  ],
                                ),
                              ),
                              // SizedBox(height: wi*0.03,),
                              InkWell(
                                onTap: () {
                                  showCupertinoDialog(
                                      context: context,
                                      builder: (context)
                                      {
                                        return
                                          CupertinoAlertDialog(
                                            actions: [
                                              CupertinoDialogAction(
                                                child:Column(
                                                  children: [
                                                    Icon(CupertinoIcons.phone,color: Colors.green,size: wi*0.1,),
                                                    SizedBox(height: wi*0.01,),
                                                    Text('Phone')
                                                  ],
                                                ),
                                                onPressed: () async{
                                                  // await canLaunchUrl(phone);
                                                  final Uri url=Uri(
                                                    scheme: 'tel',
                                                    path: widget.userData.number,
                                                  );
                                                  if(await canLaunchUrl(url)){
                                                    await launchUrl(url);
                                                  }else{
                                                    print("can't launch");
                                                  }
                                                },),
                                              CupertinoDialogAction(
                                                child:Column(
                                                  children: [
                                                    FaIcon(FontAwesomeIcons.whatsapp,color: Colors.green,size: wi*0.1,),
                                                    Text("Whatsapp",),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  launchUrl(whatsApp);
                                                },),

                                            ],
                                          );

                                      });

                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('NUMBER:',style: TextStyle(
                                          color: ColorPage.black.withOpacity(0.5),

                                          fontSize: wi*0.04,
                                          fontWeight: FontWeight.w500
                                      ),),
                                      SizedBox(width: wi*0.03,),
                                      Text(widget.userData.number.toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: wi*0.04,
                                            color: ColorPage.brown
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(height: wi*0.03,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('PASS OUT YEAR:',style: TextStyle(
                                        color: ColorPage.black.withOpacity(0.5),

                                        fontSize: wi*0.04,
                                        fontWeight: FontWeight.w500
                                    ),),
                                    SizedBox(width: wi*0.03,),//
                                    Text(widget.userData.year.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: wi*0.04,
                                          color: ColorPage.brown
                                      ),),
                                  ],
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),

          error: (error, stackTrace) => ErrorText(error: error.toString()), loading: ()=>Loader());

  }
}
