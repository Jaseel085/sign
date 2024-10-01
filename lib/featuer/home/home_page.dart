import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/commen/error.dart';
import 'package:sign/core/commen/loader.dart';
import 'package:sign/featuer/banner/controller/banner_controller.dart';
import 'package:sign/featuer/batches/screen/batches_page.dart';
import 'package:sign/core/pallet/colorpage.dart';
import 'package:sign/featuer/auth/controller/auth_controller.dart';
import 'package:sign/featuer/governing_body/screen/governing_body.dart';
import 'package:sign/featuer/home/profile_drawer.dart';
import 'package:sign/featuer/governing_body/screen/governing_bodyold.dart';
import 'package:sign/core/constants/imagePage.dart';
import 'package:sign/featuer/notification/controller/notification_controller.dart';
import 'package:sign/featuer/notification/screen/notification_screen.dart';
import 'package:sign/featuer/user_information/screen/user_details1.dart';
import 'package:sign/members.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../main.dart';
import '../members/screen/show_all_members.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List irs=[
    imagePage.irshadiyya1,
    imagePage.irshadiyya2,
    imagePage.irshadiyya3,
    imagePage.irshadiyya4,
    imagePage.irshadiyya5,

  ];
  int selectedIndex=0;
   displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final user=ref.watch(userProvider);
    final notification=ref.watch(getNotificationProvider);
    return  Scaffold(
      endDrawer: ProfileDrawer(),
      appBar: AppBar(

        elevation: 0,
        backgroundColor: ColorPage.primerycolour,
        title: Text('${user!.name} Rashadi',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: wi*0.06,
              color: ColorPage.white
          ),),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) => NotificationScreen(),));
          }, icon: Icon(Icons.notifications_active,color: ColorPage.white,)),
        Builder(
          builder: (context) {
            return IconButton(onPressed: () => displayEndDrawer(context),
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePic),
                ));
          }
        ),

        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(wi*0.03),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: wi*0.12,),
              ref.watch(getBannersProvider).when(data: (baners)=>

                  CarouselSlider.builder(
                    itemCount: baners.length,
                    options: CarouselOptions(
                      height: wi*0.8,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          selectedIndex=index;
                          setState(() {

                          });
                        },
                        autoPlayAnimationDuration:
                        Duration(milliseconds: 200),
                        viewportFraction: 1
                    ),
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      return  Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: wi*0.58,
                                width: wi*1,
                                // color: Colors.red,
                              ),
                              Container(
                                  height:wi*0.5,
                                  width: wi*1,
                                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(baners[index].bannerImage),fit: BoxFit.fitWidth),
                      boxShadow: [
                      BoxShadow(
                      offset: Offset(2, 6),
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4)
                      ],
                        borderRadius: BorderRadius.circular(wi*0.04),
                                  ),
                             // child: CachedNetworkImage(imageUrl: baners[index].bannerImage,),
                              ),
                              // Positioned(
                              //   bottom: 35,
                              //   left:20,
                              //   child: Text(baners[index].description,style: TextStyle(
                              //     // overflow:TextOverflow.fade ,
                              //
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: wi*0.03
                              //   ),),
                              // ),
                              Positioned(
                                bottom: 35,
                                left: 20,
                                child: SizedBox(
                                  width: wi * 0.8, // Adjust this width according to your layout
                                  child: Text(
                                    baners[index].description,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: wi * 0.03,
                                    ),
                                    maxLines: 3, // Limits the text to 3 lines
                                    overflow: TextOverflow.ellipsis, // Adds "..." if the text is too long
                                  ),
                                ),
                              ),
                               
                              Positioned(
                                bottom: 1,
                                left: 115,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: selectedIndex,
                                  count: baners.length,
                                  effect:ExpandingDotsEffect(
                                    dotColor: ColorPage.primerycolour,
                                    activeDotColor: Colors.grey,

                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );

                    },
                  ),

                error: (error, stackTrace) => ErrorText(error: error.toString()), loading: () => Loader(),),
              SizedBox(
                height: wi*0.1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>GoverningBodyScreen() ,));
                    },
                    child: Container(
                      height: wi*0.2,
                      width: wi*0.6,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 6),
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ],
                        color: ColorPage.primerycolour,
                        borderRadius: BorderRadius.circular(wi*0.06),
                      ),
                      child: Center(
                        child: Text('Governing Body',
                          style:TextStyle(
                              color: ColorPage.white,
                              fontWeight: FontWeight.w600,
                              fontSize: wi*0.07
                          ) ,),
                      ),
                    ),
                  ),
                  SizedBox(height: wi*0.1,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BatchBage(),));
                    },
                    child: Container(
                      height: wi*0.2,
                      width: wi*0.6,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 6),
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ],
                        color: ColorPage.primerycolour,
                        borderRadius: BorderRadius.circular(wi*0.06),
                      ),
                      child: Center(
                        child: Text('Members',
                          style:TextStyle(
                              color: ColorPage.white,
                              fontWeight: FontWeight.w600,
                              fontSize: wi*0.07
                          ) ,),
                      ),
                    ),
                  ),
                ],
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}

