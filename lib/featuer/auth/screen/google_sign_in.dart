import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/featuer/auth/controller/auth_controller.dart';
import 'package:sign/core/constants/imagePage.dart';


import '../../../main.dart';

class GoogleSignIn extends ConsumerWidget {
  const GoogleSignIn({super.key});

  void   signWithGoogle(BuildContext context,WidgetRef ref) {
     ref.watch(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(

      body: Column(

        children: [
          SizedBox(height: wi*0.1,),
          Container(
            height: wi*0.3,
          ),
          Container(
            child: Image.asset(imagePage.logo),
          ),
          SizedBox(height: wi*0.4,),
          Column(
            children: [
              Center(
                child:
                InkWell(
                  onTap: () {
                signWithGoogle(context, ref);
                  },
                  child: Container(
                    width: wi*0.8,
                    height: wi*0.12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(wi*0.1),
                        color: ColorPage.primerycolour
                    ),
                    child: Center(child: Text('Continue With Google',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: wi*0.06,
                          fontWeight: FontWeight.w800
                      ),)),
                  ),
                ),
              ),
              SizedBox(height: wi*0.02,),
              Text("Version: 1.0.1",style: TextStyle(
                color: ColorPage.black.withOpacity(0.3),
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height: wi*0.03,),
            ],
          ),

        ],
      ),
    ); ;
  }
}



