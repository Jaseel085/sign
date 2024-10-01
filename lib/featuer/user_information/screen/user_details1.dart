import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/featuer/auth/controller/auth_controller.dart';
import 'package:sign/model/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/commen/error.dart';
import '../../../core/commen/loader.dart';
import '../../../main.dart';
import '../../members/cotroller/members_controller.dart';

class ShowUSerDetails extends ConsumerStatefulWidget {
  final UserModel userData;
  const ShowUSerDetails({super.key,
  required this.userData
  });

  @override
  ConsumerState createState() => _ShowUSerDetailsState();
}

class _ShowUSerDetailsState extends ConsumerState<ShowUSerDetails> {
  @override
  Widget build(BuildContext context) {
    final Uri whatsApp=Uri.parse('http://wa.me/+91${widget.userData.number}');
    final Uri phone=Uri.parse('tel+91${widget.userData.number}');
    final user=ref.watch(userProvider);
    return
      ref.watch(getAllMembersProvider).when(data: (usersList)=>
      Scaffold(
           appBar: AppBar(
             backgroundColor: ColorPage.primerycolour,
             elevation: 0,
             leading: IconButton(onPressed: () {
               Navigator.pop(context); },icon: Icon(CupertinoIcons.arrow_left,color: Colors.white,),),
           ),
        body:Column(
          children: [

            Stack(
              children: [
                Container(height: wi*0.5,
                // color: Colors.red,
          ),
                Container(

                  height: wi*0.4,
                  width: wi*1,
                 decoration: BoxDecoration(
                   color: ColorPage.primerycolour,
                   borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(wi*0.25),
                       bottomRight: Radius.circular(wi*0.25)
                   )
                 ),
                ),
                Positioned(
                  bottom: 2,
                    left: 98,
                    child: CircleAvatar(radius: wi*0.2,
                    backgroundImage: NetworkImage(widget.userData.profilePic),
                    ),
                )
              ],
            ),
            SizedBox(height: wi*0.04,),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(wi*0.04),
                children: [
                  ListTile(

                    leading: Icon(CupertinoIcons.person,
                    size: wi*0.1,
                    color: ColorPage.black.withOpacity(0.5)),
                    title: Text(widget.userData.name),

                  ),
                    Divider(color: ColorPage.black.withOpacity(0.8),),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.home,
                      size: wi*0.07,
                      color: ColorPage.black.withOpacity(0.5)),
                    title: Text(widget.userData.place),
                  ),
                  Divider(color: ColorPage.black.withOpacity(0.8),),
                  ListTile(

                    leading: Icon(FontAwesomeIcons.mobileScreenButton,
                      size: wi*0.08,
                      color: ColorPage.black.withOpacity(0.5)),
                    title: GestureDetector(
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
                        child: Text(widget.userData.number)),
                  ),
                  Divider(color: ColorPage.black.withOpacity(0.8),),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.mosque,
                      size: wi*0.07,
                      color: ColorPage.black.withOpacity(0.5)),
                    title: Text(widget.userData.iGraduation),
                  ),
                  Divider(color: ColorPage.black.withOpacity(0.8),),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.school,
                      size: wi*0.07,
                      color: ColorPage.black.withOpacity(0.5)),
                    title: Text(widget.userData.mGraduation),
                  ),
                  Divider(color: ColorPage.black.withOpacity(0.8),),
                  ListTile(
                    leading: Icon(CupertinoIcons.calendar,
                      size: wi*0.1,
                      color: ColorPage.black.withOpacity(0.5)),
                    title: Text(widget.userData.year),
                  ),
                ],
              ),
            ),
        ]
        ) ,
    ),
          error: (error, stackTrace) => ErrorText(error: error.toString()), loading: ()=>Loader());
  }
}
