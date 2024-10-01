import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/commen/error.dart';
import 'package:sign/core/commen/loader.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/featuer/notification/controller/notification_controller.dart';
import 'package:sign/featuer/notification/screen/notification_view_screen.dart';

import '../../../main.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
         leading: IconButton(onPressed: () {
           Navigator.pop(context); },icon:Icon(CupertinoIcons.arrow_left,color: Colors.white,),),
         backgroundColor: ColorPage.primerycolour,
         title: Text("Notifications",style: TextStyle(
           color: ColorPage.white,
           fontWeight: FontWeight.w600,
           fontSize: wi*0.06
         ),),
         centerTitle: true,
       ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              
              ref.watch(getNotificationProvider).when(
                  data: (notification) => Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return
                            InkWell(
                              onTap: () {
                                print(notification.toString());
                                Navigator.push(context, CupertinoPageRoute(builder: (context) => NotificationVi
                                    ewScreen(notification: notification[index]),));
                              },
                              child: Container(
                                height: wi*0.3,
                                width: wi*0.7,
                                decoration: BoxDecoration(
                                    color: ColorPage.black.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(wi*0.02)
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(notification[index].heading,style: TextStyle(
                                        color: Colors.black,
                                        fontSize: wi*0.05,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    )
                                  ],
                                ),
                              ),
                            );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: wi*0.04,);
                        }, itemCount: notification.length),
                  ) , error: (error, stackTrace) => 
                  ErrorText(error: error.toString()), loading: () => Loader(),),
             
            ],
          ),
        ),
      ),
    );
  }
}
