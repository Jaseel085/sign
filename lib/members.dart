import 'package:flutter/material.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/core/constants/imagePage.dart';

import 'main.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  List members=[
    {
     'name':'Sayyid munavar saqafi',
     'number':9977445588,
      'Work':'Teacher',

    },
    {
     'name':'Sayyid mubashir falil',
     'number':9977445588,
      'Work':'Teacher',

    },
    {
     'name':"Salim sa'adi",
     'number':9977445588,
      'Work':'Teacher',

    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPage.primerycolour,
        title: Text('Members',
        style: TextStyle(
          color: ColorPage.white,
          fontWeight: FontWeight.w600,
          fontSize: wi*0.06
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(wi*0.03),
          child: Column(
            children: [
              ListView.separated(
                itemCount: members.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: wi*0.3,
                    width: wi*1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(wi*0.03),
                        color: Colors.black.withOpacity(0.1)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [

                            Padding(
                              padding:  EdgeInsets.all(wi*0.03),
                              child: CircleAvatar(
                                radius: wi*0.1,
                                backgroundColor: ColorPage.white,
                                backgroundImage: AssetImage(imagePage.logo)
                              ),
                            ),
                            SizedBox(width: wi*0.05,),
                            Center(
                              child: Container(
                                width:wi*0.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(members[index]['name'],
                                    style: TextStyle(
                                      color: ColorPage.primerycolour,
                                      fontSize: wi*0.05,
                                      fontWeight: FontWeight.w800
                                    ),),
                                    // Text(members[index]['number'].toString()),
                                    // Text(members[index]['Work']),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return  SizedBox(height: wi*0.03,);
              },


              )
            ],
          ),
        ),
      ),
    );
  }
}
