import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/featuer/home/home_page.dart';
import 'package:sign/signup.dart';

import 'main.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool tap=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:ColorPage.primerycolour,
      ),
      body: Padding(
        padding:  EdgeInsets.all(wi*0.03),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: wi*0.1,
              ),
              Container(
                width: wi*1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text('Please Login To Your',
                    style: TextStyle(
                      fontSize: wi*0.06,
                      fontWeight: FontWeight.w900,
                      color: ColorPage.primerycolour
                    ),),
                    Text( 'Account',
                    style: TextStyle(
                      fontSize: wi*0.08,
                      fontWeight: FontWeight.w900,
                      color: ColorPage.primerycolour

                    ),),
                  ],
                ),
              ),
              SizedBox(height: wi*0.4,),
              Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,

                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPage.primerycolour
                        ),
                        borderRadius: BorderRadius.circular(wi*0.03)

                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(wi*0.03),
                          borderSide: BorderSide(
                              color:ColorPage.primerycolour
                          )
                      ),
                      labelText:'Email',
                      labelStyle: TextStyle(
                        fontSize: wi*0.05,
                        color: ColorPage.primerycolour
                      ),
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3)
                      )

                    ),
                    style: TextStyle(color: ColorPage.primerycolour),
                  ),
                  SizedBox(height: wi*0.03,),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    obscureText: tap?true:false,
                    style: TextStyle(
                      color: ColorPage.primerycolour
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPage.primerycolour
                        ),
                        borderRadius: BorderRadius.circular(wi*0.03)

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPage.primerycolour,
                        ),
                        borderRadius: BorderRadius.circular(wi*0.03)
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: ColorPage.primerycolour),
                      hintText: 'Your Password',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3)
                      ),
                      suffixIcon:InkWell(
                        onTap: () {
                          tap=!tap;
                          setState(() {});
                        },
                        child: Icon(tap?Icons.visibility:Icons.visibility_off,
                        color: ColorPage.primerycolour,)
                    ),

                  ),
                  ),
                  SizedBox(height: wi*0.3,),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                        },
                        child: Container(
                          height: wi*0.13,
                          width: wi*0.4,
                          decoration: BoxDecoration(
                              color: ColorPage.primerycolour,
                              borderRadius: BorderRadius.circular(wi*0.07)
                          ),
                          child: Center(
                            child: Text('Sign in',
                              style: TextStyle(
                                  color:ColorPage.white,
                                  fontSize: wi*0.06,
                                  fontWeight: FontWeight.w800
                              ),),
                          ),
                        ),
                      ),
                     Container(height: wi*0.3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dont have an account?',
                            style:TextStyle(
                              color: ColorPage.text_color.withOpacity(0.6)
                            ) ,),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPage(),));
                            },
                            child: Text('creat now',
                              style:TextStyle(
                                fontSize: wi*0.04,
                                fontWeight: FontWeight.w500,
                                color: ColorPage.primerycolour
                              ) ,),
                          )
                        ],
                      )
                    ],

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
