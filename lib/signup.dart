import 'package:flutter/material.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/login.dart';

import 'main.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  bool tap=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPage.primerycolour,
      ),
      body: Padding(
        padding:  EdgeInsets.all(wi*0.03),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height:wi*0.1),
              Text('مرحبا يا رشادي',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: wi*0.1,
                color: ColorPage.primerycolour,
              ),),
              SizedBox(height: wi*0.2,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: nameController,
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
                        labelText:'Name',
                        labelStyle: TextStyle(
                            fontSize: wi*0.05,
                            color: ColorPage.primerycolour
                        ),
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.3)
                        )

                    ),
                    style: TextStyle(color: ColorPage.primerycolour),
                  ),
                  SizedBox(height: wi*0.03,),
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
                          child: Icon(tap?Icons.visibility_off:Icons.visibility,
                            color: ColorPage.primerycolour,)
                      ),

                    ),
                  ),
                  SizedBox(height: wi*0.03,),
                  TextFormField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,

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
                      labelText: 'Phone number',
                      labelStyle: TextStyle(
                          color: ColorPage.primerycolour),
                      hintText: 'Your Phone number',
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3)
                      ),

                      ),

                    ),
                  SizedBox(height: wi*0.2,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage(),));
                    },
                    child: Container(
                      height: wi*0.13,
                      width: wi*0.4,
                      decoration: BoxDecoration(
                        color: ColorPage.primerycolour,
                        borderRadius: BorderRadius.circular(wi*0.07)
                      ),
                      child: Center(
                        child: Text('Sign Up',
                        style: TextStyle(
                          color:ColorPage.white,
                          fontSize: wi*0.06,
                          fontWeight: FontWeight.w800
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height: wi*0.2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Allready have an account?',
                      style: TextStyle(
                        color: ColorPage.text_color.withOpacity(0.6)
                      ),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage(),));
                        },
                        child: Text('Sign in',
                        style: TextStyle(
                          color: ColorPage.primerycolour,
                          fontWeight: FontWeight.w500,
                          fontSize: wi*0.04
                        ),),
                      ),
                    ],
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
