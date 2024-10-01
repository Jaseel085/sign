import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/featuer/auth/controller/auth_controller.dart';

import '../../../core/constants/imagePage.dart';
import '../../../core/pallet/colorpage.dart';
import '../../../main.dart';

class GoverningBodyOld extends ConsumerStatefulWidget {
  const GoverningBodyOld({super.key});

  @override
  ConsumerState createState() => _GoverningBodyScreenState();
}

class _GoverningBodyScreenState extends ConsumerState<GoverningBodyOld> {
  List members = [
    {
      'name': ' SABITH ALI SAQAFI',
      'Designation': 'PESIDENT',
      'photo': imagePage.sabith1
    },
    {
      'name':  "SALIM SA'ADI",
      'Designation': 'SECRETARY',
      'photo': imagePage.salimtest1
    },
    {
      'name': "FAYYAS SAQAFI",
      'Designation': 'FIN.SECRETARY',
      'photo': imagePage.fayastest1

    },
  ];
  @override
  Widget build(BuildContext context) {
    final committee=ref.watch(commiteeProvider!);
    return
    Scaffold(
      appBar: AppBar(
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
      body: Container(
        width: wi * 1,
        child: Column(
          children: [
            SizedBox(
              height: wi * 0.2,
            ),
            Container(
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
                  ]
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: wi * 0.01, left: wi * 0.01, right: wi * 0.01),
                    child: Container(
                        height: wi * 0.5,
                        width: wi * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(wi * 0.05),
                          // color: Colors.red
                        ),
                        child:
                        Image.asset(
                          imagePage.chairman,
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  Text(
                    'Chairman',
                    style: TextStyle(
                        color: ColorPage.black.withOpacity(0.6), fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Usthad Musthafa Ahsani'.toUpperCase(),
                    style: TextStyle(
                        fontSize: wi * 0.033,fontWeight: FontWeight.w600, color: ColorPage.primerycolour),
                  )
                ],
              ),
            ),
            SizedBox(
              height: wi * 0.2,
            ),
            Padding(
              padding: EdgeInsets.all(wi * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: wi * 0.56,
                    child: ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: wi*0.13,
                                  backgroundColor: ColorPage.primerycolour,
                                  backgroundImage: AssetImage(members[index]['photo']),
                                  // foregroundImage: AssetImage(members[index]['photo']),
                                ),
                              ],
                            ),
                            SizedBox(height: wi*0.03,),
                            Text(members[index]['Designation'],style: TextStyle(
                                color: ColorPage.black.withOpacity(0.6),
                                fontWeight: FontWeight.w600,
                                fontSize: wi*0.03
                            ),),
                            SizedBox(height: wi*0.01,),
                            Text(members[index]['name'],style: TextStyle(color: ColorPage.primerycolour,
                                fontWeight: FontWeight.w600,
                                fontSize: wi*0.03
                            ),)
                          ],
                        );


                        //   Container(
                        //   height: wi * 0.056,
                        //   width: wi * 0.3,
                        //   decoration: BoxDecoration(
                        //     // border: Border.all(
                        //     //
                        //     // ),
                        //     color: ColorPage.white,
                        //     boxShadow: [
                        //       BoxShadow(
                        //           offset: Offset(4, 4),
                        //           color: Colors.black.withOpacity(0.15),
                        //           spreadRadius: 2,
                        //           blurRadius: 4)
                        //     ],
                        //     // color: Colors.red,
                        //     borderRadius: BorderRadius.circular(wi * 0.03),
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       Padding(
                        //         padding: EdgeInsets.only(
                        //             top: wi * 0.015,
                        //             left: wi * 0.015,
                        //             right: wi * 0.015),
                        //         child: Container(
                        //           height: wi * 0.3,
                        //           width: wi * 03,
                        //           decoration: BoxDecoration(
                        //             color:
                        //                 ColorPage.primerycolour.withOpacity(0.5),
                        //             // border: Border.all(color: ColorPage.black),
                        //             borderRadius:
                        //                 BorderRadius.circular(wi * 0.03),
                        //             // color: Colors.blue
                        //           ),
                        //           child: Container(
                        //             width: wi*0.01,
                        //             child: Image.asset(
                        //               members[index]['photo'],
                        //               fit: BoxFit.fitHeight,
                        //             ),
                        //           ),
                        //           margin: EdgeInsets.all(wi * 0.03),
                        //         ),
                        //       ),
                        //       Text(
                        //         members[index]['Designation'],
                        //         style: TextStyle(
                        //             fontSize: wi * 0.033,
                        //             color: ColorPage.black.withOpacity(0.6),
                        //             fontWeight: FontWeight.w800),
                        //       ),
                        //       SizedBox(
                        //         height: wi * 0.02,
                        //       ),
                        //       Text(
                        //         members[index]['name'],
                        //         style: TextStyle(
                        //             fontSize: wi * 0.03,
                        //             fontWeight: FontWeight.w600,
                        //             color: ColorPage.primerycolour),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: wi * 0.01,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: wi * 0.03,
            ),
          ],
        ),
      ),
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
    );;
  }
}
