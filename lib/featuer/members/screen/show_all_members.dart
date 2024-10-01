import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/commen/error.dart';
import 'package:sign/core/commen/loader.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/featuer/auth/controller/auth_controller.dart';
import 'package:sign/featuer/members/cotroller/members_controller.dart';
import 'package:sign/featuer/profile/screen/edit_profile_screen.dart';
import 'package:sign/featuer/user_information/screen/user_details_screen.dart';
import 'package:sign/main.dart';
import 'package:sign/model/user_model.dart';

class ShowAllMembers extends ConsumerStatefulWidget {
  const ShowAllMembers({super.key});

  @override
  ConsumerState createState() => _ShowAllMembersState();
}

class _ShowAllMembersState extends ConsumerState<ShowAllMembers> {
  @override
  Widget build(BuildContext context) {
    final user=ref.watch(userProvider)!;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPage.primerycolour,
          title: Text('ALL MEMBERS',
            style: TextStyle(
                fontSize: wi*0.05,
                fontWeight: FontWeight.w800
            ),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              width: wi*1.5,
              child: Column(

                children: [

                  Consumer(
                    builder: (context, ref, child) {
                      return ref.watch(getAllMembersProvider).when(
                          data: (usersList)=> ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              UserModel userModel = UserModel.fromMap(usersList[index].toMap());
                              return GestureDetector(
                                onTap: () {

                                  print(user.profilePic);
                                  print(urlDownload.toString());
                                  Navigator.push(context, CupertinoPageRoute(builder: (context) => UserDetailsScreen(userData: usersList[index],),));
                                },
                                child: Container(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:NetworkImage(userModel.profilePic) ,
                                    ),
                                    title: Row(
                                      children: [
                                        Text(userModel.name),
                                        SizedBox(width: wi*0.03,),
                                        Text(userModel.iGraduation)
                                      ],
                                    ),
                                    subtitle: Text(userModel.place),
                                  ),
                                ),
                              );
                            },
                            itemCount: usersList.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: wi*0.04,);
                            },
                          ),

                          error: (error, stackTrace) => ErrorText(error: error.toString()),
                          loading: ()=>Loader());
                    },



                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
