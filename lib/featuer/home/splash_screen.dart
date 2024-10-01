import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign/core/commen/error.dart';
import 'package:sign/core/commen/loader.dart';
import 'package:sign/core/constants/imagePage.dart';
import 'package:sign/featuer/home/home_page.dart';

import '../../main.dart';
import '../../model/user_model.dart';
import '../auth/controller/auth_controller.dart';
import '../auth/screen/google_sign_in.dart';


String currentUserName = '';
String currentPassword = '';
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}
UserModel? userModel;
// Future<void> getData(WidgetRef ref,User data) async {
//   userModel=await ref.watch(authControllerProvider.notifier).getUserData(data.uid).first;
//   ref.read(userProvider.notifier).update((state) => userModel);
// }

// goToScreen(){
//     Future.delayed(Duration(seconds: 3));
// }
class _SplashScreenState extends ConsumerState<SplashScreen> {


  goToScreen() async {

    SharedPreferences _prefs=await SharedPreferences.getInstance();
    print(_prefs.getBool("Login"));
    String? id=_prefs.getString("id");
    UserModel? user;
    if(id!=null){
      user=await ref.watch(authControllerProvider.notifier).getUserData(id!).first;
    }
    ref.read(userProvider.notifier).update((state) => user,);
    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>user!=null?HomeScreen():GoogleSignIn())));
  }

@override
  void initState() {
  goToScreen();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: wi*1,
              width: wi*0.7,
              child: Image.asset(imagePage.logo),
            ),
          )
        ],
      ),
    );
  }
}

