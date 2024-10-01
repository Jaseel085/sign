import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/commen/error.dart';
import 'package:sign/core/commen/loader.dart';
import 'package:sign/featuer/auth/controller/auth_controller.dart';
import 'package:sign/featuer/batches/controller/batch_controllor.dart';
import 'package:sign/featuer/user_information/screen/user_details1.dart';
import 'package:sign/featuer/user_information/screen/user_details_screen.dart';

import '../../../core/pallet/colorpage.dart';
import '../../../main.dart';

class BatchBage extends ConsumerStatefulWidget {
  const BatchBage({super.key});

  @override
  ConsumerState createState() => _BatchBageState();
}
String years='';

class _BatchBageState extends ConsumerState<BatchBage> {
  int selectedindex=0;
  // List Batches=[2016,2017,2018,2019,2020,2021,2022,2023];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context); },icon: Icon(CupertinoIcons.arrow_left,color: Colors.white,),),
        backgroundColor: ColorPage.primerycolour,
        title: Text('Batches',style: TextStyle(
          color: ColorPage.white,
          fontSize: wi*0.08,
        ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: wi*1,
          height: wi*2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: wi*0.04,),

               ref.watch(getBatchYearProvider).when(data: (batch)=>
                   Container(
                     height: wi*0.1,
                     child: ListView.separated(
                       itemCount:batch.length ,
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       physics: BouncingScrollPhysics(),
                       itemBuilder: (context, index) {
                         return InkWell(
                           onTap: () {
                             selectedindex=index;
                             years=batch[index];
                             print(batch.toString());
                             setState(() {

                             });
                           },
                           child: Container(
                             height: wi*0.1,
                             width: wi*0.25,
                             decoration: BoxDecoration(
                                 border: Border.all(color: ColorPage.primerycolour),
                                 borderRadius: BorderRadius.circular(wi*0.04),
                               color: selectedindex==index?ColorPage.primerycolour:ColorPage.white
                             ),
                             child: Center(
                               child: Text(batch[index],
                                 style: TextStyle(
                                     fontSize: wi*0.06,
                                     fontWeight: FontWeight.w600,
                                     color:selectedindex==index?ColorPage.white: ColorPage.primerycolour
                                 ),),
                             ),
                           ),
                         );
                       },
                       separatorBuilder: (context, index) {
                         return SizedBox(width: wi*0.03);
                       },
                     ),
                   ),

                   error: (error, stackTrace) => ErrorText(error: error.toString()), loading: ()=>Loader()),

                  ref.watch(getAllUsersProvider(years)).when(data: (users)
                  =>  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: users.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.only(top: wi*0.04,
                          left: wi*0.04,
                          right: wi*0.04),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => ShowUSerDetails(userData: users[index]),));
                            },
                            child: Container(
                              height: wi*0.23,
                              width: wi*0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(wi*0.03),
                                  border: Border.all(color: ColorPage.primerycolour)
                              ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(users[index].profilePic),
                                  ),
                                  SizedBox(width: wi*0.04,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('${users[index].name.toUpperCase()} RASHADI',
                                        style: TextStyle(
                                          fontSize: wi*0.04,
                                          fontWeight: FontWeight.w600,
                                          color: ColorPage.primerycolour,

                                        ),),
                                        Text(users[index].place.toUpperCase(),
                                        style: TextStyle(
                                          color: ColorPage.primerycolour,
                                          fontSize: wi*0.04,
                                          fontWeight: FontWeight.w400
                                        ),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: wi*0.04,);
                      },
                    ),
                  ),

                      error: (error, stackTrace) => ErrorText(error: error.toString()), loading: ()=>Loader()),
              SizedBox(height: wi*0.2,)


            ],
          ),
        ),
      ),
    );
  }
}

