import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign/core/firbase_constants.dart';
import 'package:sign/core/type_def.dart';
import 'package:sign/featuer/batches/screen/batches_page.dart';

import '../../../core/failour.dart';
import '../../../core/providers/firbase_providers.dart';
import '../../home/home_page.dart';
import '../../../model/user_model.dart';
import '../../profile/screen/edit_profile_screen.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.watch(fireStoreProvider),
    auth: ref.watch(authProvider),
    googleSignIn: ref.watch(googleSignInProvider)));

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
      {
        required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _firestore = firestore,
        _auth = auth,
        _googleSignIn = googleSignIn;


  Stream<User?> get authStateChange => _auth.authStateChanges();
  FutureEither<UserModel> signInWithGoogle(context) async {
    try {
      _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      UserModel? userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            name: userCredential.user!.displayName ?? 'No name',
            profilePic: userCredential.user!.photoURL ?? '',
            uid: userCredential.user!.uid,
            isAuthenticated: true,
            place: '',
            iGraduation: '',
            mGraduation: '',
            number: '',
            year: '');
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
        SharedPreferences _pref = await SharedPreferences.getInstance();
        _pref.setString('id', userCredential.user!.uid);
        return right(userModel);
      } else {
        SharedPreferences _pref = await SharedPreferences.getInstance();
        _pref.setString('id', userCredential.user!.uid);
        userModel = await getUserData(userCredential.user!.uid).first;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
        return right(userModel!);
      }
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map((event) {
      currentUserModel =
          UserModel.fromMap(event.data() as Map<String, dynamic>);
      return UserModel.fromMap(event.data() as Map<String, dynamic>);
    });
  }

  Future<void> logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  updateUser(UserModel userModel) {
    _users.doc(userModel.uid).update(userModel.toMap());
  }

  Stream<List<UserModel>> getUsers({required String yearId}) {
    if (yearId == 'ALL') {
      return _users.snapshots().map((event) {
         List<UserModel>users=[];
         for (var doc in event.docs){
         users.add(UserModel.fromMap(doc.data()as Map<String,dynamic>));
         }
         return users;
      });
    }else if(yearId.isNotEmpty){
        return _users.where('year',isEqualTo: years).
        snapshots().map((event) {
        List<UserModel>users=[];
        for(var doc in event.docs){
          users.add(UserModel.fromMap(doc.data()as Map<String,dynamic>));
        }
        return users;
        });
    }else{
     return _users.snapshots().map((event) {
       List<UserModel>users=[];
       for(var doc in event.docs){
         users.add(UserModel.fromMap(doc.data()as Map<String,dynamic>));
       }
       return users;
     });
    }
  }

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
}
