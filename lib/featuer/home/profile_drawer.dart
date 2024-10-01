import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/featuer/profile/screen/edit_profile_screen.dart';
import '../../main.dart';
import '../auth/controller/auth_controller.dart';
import '../auth/screen/google_sign_in.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});


  void logOut(WidgetRef ref,BuildContext context){
    ref.read(authControllerProvider.notifier).logOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => const GoogleSignIn(),));
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user=ref.watch(userProvider)!;
    return Drawer(
      // backgroundColor: Colors.grey,
      child: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
                radius: wi*0.18,
              ),
              SizedBox(height: wi*0.03,),
              Text(user.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: wi*0.04
                  )),

              SizedBox(
                height: wi*0.03,
              ),
              Divider(),
              ListTile(
                tileColor: Colors.grey,
                  title: Text('Edit Profile'),
                  leading: Icon(Icons.person),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegisterScreen(),));
                  }
                  // =>navigateToUserProfile(context, user.uid)
              ),
              SizedBox(height: wi*0.03,),
              ListTile(
                tileColor: Colors.grey,
                  title: Text('Log Out'),
                  leading: Icon(Icons.logout,
                  ),
                  onTap: (){
                    logOut(ref,context);
                  }
              ),
            ],
          )),
    );
  }
}
