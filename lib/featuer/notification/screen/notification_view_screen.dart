import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/model/notification_model.dart';

import '../../../main.dart';

class NotificationViewScreen extends ConsumerStatefulWidget {
  final NotificationModel notification;
  const NotificationViewScreen({
    required this.notification,
    super.key
  });

  @override
  ConsumerState createState() => _NotificationViewScreenState();
}

class _NotificationViewScreenState extends ConsumerState<NotificationViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:  ColorPage.black.withOpacity(0.1),
      backgroundColor: Colors.green.shade50,
         body: Padding(
           padding: const EdgeInsets.all(8.0),
           child: SingleChildScrollView(
             physics: BouncingScrollPhysics(),
             child: Column(
               children: [
                 SizedBox(height: wi*0.1,),
                 Container(
                   width: wi*1,
                   // color: ColorPage.black,
                   child: Column(
                     children: [
                       SizedBox(width: wi*0.01,),
                       Text(widget.notification.heading,style: TextStyle(
                         color: ColorPage.black,
                         fontSize: wi*0.04,
                         fontWeight: FontWeight.bold
                       ),),
                       Container(
                         height:wi*0.5,
                         width: wi*1,
                         decoration: BoxDecoration(
                           image: DecorationImage(image: NetworkImage(widget.notification.notificationImage),fit: BoxFit.fitWidth),
                           boxShadow: [
                             BoxShadow(
                                 offset: Offset(2, 6),
                                 color: Colors.black.withOpacity(0.2),
                                 spreadRadius: 2,
                                 blurRadius: 4)
                           ],
                           borderRadius: BorderRadius.circular(wi*0.04),
                         ),

                       ),
                       SizedBox(height: wi*0.1,),
                       Text(widget.notification.notification,style: TextStyle(
                           color: ColorPage.black,
                           fontSize: wi*0.04,
                           fontWeight: FontWeight.bold
                       ),),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
    );
  }
}
