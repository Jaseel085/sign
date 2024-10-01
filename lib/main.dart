

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sign/featuer/auth/controller/auth_controller.dart';
import 'package:sign/featuer/auth/screen/google_sign_in.dart';
import 'package:sign/featuer/home/splash_screen.dart';
import 'core/commen/error.dart';
import 'core/commen/loader.dart';
import 'featuer/home/home_page.dart';
import 'model/user_model.dart';
var wi;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ProviderScope
    (child: SignMain()));
}

class SignMain extends ConsumerStatefulWidget {
  const SignMain({super.key});

  @override
  ConsumerState createState() => _SignMainState();
}

class _SignMainState extends ConsumerState<SignMain> {


UserModel?userModel;
  Future<void> getData(WidgetRef ref,User data) async {
    userModel=await ref.watch(authControllerProvider.notifier).getUserData(data.uid).first;
    ref.read(userProvider.notifier).update((state) => userModel);
  }

  @override
  Widget build(BuildContext context) {
    wi = MediaQuery.of(context).size.width;
    final user=ref.read(userProvider);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
        ),
        debugShowCheckedModeBanner: false,
        home:SplashScreen()
      ),
    );





  }}
