import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign/core/commen/error.dart';
import 'package:sign/core/commen/loader.dart';
import 'package:sign/featuer/banner/controller/banner_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/imagePage.dart';
import '../../../core/pallet/colorpage.dart';
import '../../../main.dart';

class GoverningBodyScreen extends ConsumerStatefulWidget {
  const GoverningBodyScreen({super.key});

  @override
  ConsumerState createState() => _BodyTestingState();
}

class _BodyTestingState extends ConsumerState<GoverningBodyScreen> {
  List members = [
    {
      'name': ' SABITH ALI SAQAFI',
      'Designation': 'PESIDENT',
      'photo': imagePage.sabith1
    },
    {
      'name': "SALIM SA'ADI",
      'Designation': 'SECRETARY',
      'photo': imagePage.salimtest1
    },
    {
      'name': "FAYYAS SAQAFI",
      'Designation': 'FIN.SECRETARY',
      'photo': imagePage.fayastest1
    },
  ];
  final Uri whatsAppU=Uri.parse('http://wa.me/+919747363870');
  final Uri phoneU=Uri.parse('tel+919747363870');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context); },icon: Icon(CupertinoIcons.arrow_left,color: Colors.white,),),
          backgroundColor: ColorPage.primerycolour,
          title: Text(
            'Governing Body',
            style: TextStyle(
                color: ColorPage.white,
                fontWeight: FontWeight.w600,
                fontSize: wi * 0.06),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
                    children: [
                      SizedBox(
                        height: wi * 0.05,
                      ),
                      InkWell(
                        onTap: () {
                          showCupertinoDialog(
                              barrierDismissible: true,
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
                                            path: "9747363870",
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
                                            FaIcon(
                                              FontAwesomeIcons.whatsapp,color: Colors.green,size: wi*0.1,),
                                            Text("Whatsapp",),
                                          ],
                                        ),
                                        onPressed: () {
                                          launchUrl(whatsAppU);
                                        },),

                                    ],
                                  );

                              });
                        },
                        child: Container(
                          height: wi * 0.65,
                          width: wi * 0.7,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(wi * 0.03),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 2,
                                    blurRadius: 4)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: wi * 0.01,
                                    left: wi * 0.01,
                                    right: wi * 0.01),
                                child: Container(
                                    height: wi * 0.5,
                                    width: wi * 0.7,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(wi * 0.05),
                                      // color: Colors.red
                                    ),
                                    child: Image.asset(
                                    imagePage.chairman,
                                      fit: BoxFit.fitWidth,
                                    )),
                              ),
                              Text(
                                'Chairman',
                                style: TextStyle(
                                    color: ColorPage.black.withOpacity(0.6),
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Usthad Musthafa Ahsani'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: wi * 0.033,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.primerycolour),
                              )
                            ],
                          ),
                        ),
                      ),
                  SizedBox(height: wi*0.04,),
                 Container(
            width: wi * 1,
                     color: ColorPage.black.withOpacity(0.05),
                     // color: Colors.red,
                     child:  Padding(
                        padding: EdgeInsets.all(wi * 0.02),
                        child:
                         Column(
                           children: [
                             ref.watch(getCommiteeMembersProvider).when(data: (bodyMember) =>
                                 ListView.separated(
                                     shrinkWrap: true,
                                     physics: BouncingScrollPhysics(),
                                     itemBuilder: (context, index) {
                                       final Uri whatsApp=Uri.parse('http://wa.me/+91${bodyMember[index].number}');
                                       final Uri phone=Uri.parse('tel+91${bodyMember[index].number}');
                                       return Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               CircleAvatar(radius: wi*0.18,
                                                 backgroundColor: ColorPage.primerycolour,
                                                 backgroundImage: NetworkImage(bodyMember[index].image,)
                                               ),
                                               InkWell(
                                                 onTap: () {
                                                   showCupertinoDialog(
                                                     barrierDismissible: true,
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
                                                                     path: bodyMember[index].number,
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
                                                                     FaIcon(
                                                                       FontAwesomeIcons.whatsapp,color: Colors.green,size: wi*0.1,),
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
                                                 child: Column(
                                                   children: [
                                                     Text(bodyMember[index].designation,style: TextStyle(
                                                       fontWeight: FontWeight.w600,
                                                        fontSize: wi*0.04,
                                                       color: ColorPage.black.withOpacity(0.6)
                                                     ),),
                                                     Text(bodyMember[index].name,style: TextStyle(
                                                       color: ColorPage.primerycolour,
                                                       fontWeight: FontWeight.w700,
                                                       fontSize: wi*0.04
                                                     ),),
                                                     Text(bodyMember[index].number,style: TextStyle(
                                                         color: ColorPage.primerycolour,
                                                         fontWeight: FontWeight.w700,
                                                         fontSize: wi*0.04
                                                     ),),
                                                   ],
                                                 ),
                                               )
                                             ],
                                           ),
                                         ],
                                       );
                                     },
                                     separatorBuilder: (context, index) {
                                       return SizedBox(height: wi*0.03,);
                                     },
                                     itemCount: bodyMember.length),
                                 error: (error, stackTrace) => ErrorText(error: error.toString()), loading: () => Loader(),),

                           ],
                         )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Container(
                        //       height: wi * 0.56,
                        //       child:
                        //       ref.watch(getCommiteeMembersProvider).when(data: (bodyMembers) =>
                        //
                        //           ListView.separated(
                        //             itemCount: bodyMembers.length,
                        //             shrinkWrap: true,
                        //             physics: BouncingScrollPhysics(),
                        //             scrollDirection: Axis.horizontal,
                        //             itemBuilder: (BuildContext context, int index) {
                        //               return Column(
                        //                 // crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   Row(
                        //                     mainAxisAlignment:
                        //                     MainAxisAlignment.spaceEvenly,
                        //                     children: [
                        //                       InkWell(
                        //                         onTap: () {
                        //                           print(bodyMembers[index].toJson());
                        //                         },
                        //                         child: CircleAvatar(
                        //                           radius: wi * 0.13,
                        //                           backgroundColor:
                        //                           ColorPage.primerycolour,
                        //                           backgroundImage:
                        //                           NetworkImage(bodyMembers[index].image,)
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   Text(
                        //                     bodyMembers[index].designation,style: TextStyle(
                        //                       color:ColorPage.black,
                        //                       fontSize: wi*0.03,
                        //                       fontWeight: FontWeight.w500
                        //                   ),
                        //                   ),
                        //                   Text(
                        //                     bodyMembers[index].name,style: TextStyle(
                        //                       color:ColorPage.primerycolour,
                        //                       fontSize: wi*0.03,
                        //                       fontWeight: FontWeight.w500
                        //                   ),
                        //                   ),
                        //
                        //                 ],
                        //               );
                        //             },
                        //             separatorBuilder:
                        //                 (BuildContext context, int index) {
                        //               return SizedBox(
                        //                 width: wi * 0.01,
                        //               );
                        //             },
                        //           ),
                        //         error: (error, stackTrace) =>ErrorText(error: error.toString()) , loading: () => Loader(),)
                        //     ),
                        //   ],
                        // ),
                     )
          ),
                 ]
          ),
        )
        //             Container(
        //             height: wi * 0.5,
        //             width: wi * 0.4,
        //             decoration: BoxDecoration(
        //               boxShadow:
        //              [ BoxShadow(
        //                   offset: Offset(0, 4),
        //                   color: Colors.black.withOpacity(0.15),
        //                   spreadRadius: 2,
        //                   blurRadius: 4
        //               )],
        //               color: ColorPage.white,
        //               borderRadius: BorderRadius.circular(wi * 0.03),
        //             ),
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding:  EdgeInsets.only(top: wi*0.015,left: wi*0.015,right: wi*0.015),
        //                   child: Container(
        //                     height: wi * 0.35,
        //                     width: wi * 03,
        //                     decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(wi * 0.03),
        //
        //                     ),
        //                     child: Image.asset(imagePage.secretary, fit: BoxFit.fill),
        //                   ),
        //                 )
        //
        //
        //               ],
        //             ),
        //
        // ),
        // Container(
        //   height: wi * 0.5,
        //   width: wi * 0.4,
        //   decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //         offset: Offset(0, 4),
        //         color: ColorPage.black.withOpacity(0.15),
        //         spreadRadius: 2,
        //         blurRadius: 4
        //
        //       )
        //     ],
        //     color: ColorPage.white,
        //     borderRadius: BorderRadius.circular(wi * 0.03),
        //   ),
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding:  EdgeInsets.only(top: wi*0.01,left: wi*0.01,right: wi*0.01),
        //         child: Container(
        //           height: wi * 0.35,
        //           width: wi * 03,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(wi * 0.03),
        //               color: Colors.white
        //           ),
        //           child: Image.asset(imagePage.treasurer, fit: BoxFit.fill),
        //         ),
        //       )
        //
        //
        //     ],
        //   ),
        //
        // ),
        );
  }
}
