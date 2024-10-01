import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/featuer/auth/repository/auth_repository.dart';
import 'package:sign/featuer/batches/screen/batches_page.dart';
import 'package:sign/model/committee_model.dart';

import '../../../core/utils.dart';
import '../../../model/user_model.dart';
final userProvider=StateProvider<UserModel?>((ref) => null);
final commiteeProvider=StateProvider<CommiteeModel?>((ref) => null);

final authControllerProvider=StateNotifierProvider((ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider), ref: ref));

final authStateChangeProvider=StreamProvider((ref) {
  final authController=ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
},);

final getAllUsersProvider = StreamProvider.autoDispose.family((ref,String yearId) {
  final authControl=ref.watch(authControllerProvider.notifier);
  return authControl.getAllUsers(yearId: yearId);
});

class AuthController extends StateNotifier{
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController( {
    required AuthRepository authRepository,
    required Ref ref,

}):_authRepository=authRepository,_ref =ref,super (false);
 
  Stream<User?> get authStateChange=>_authRepository.authStateChange;

  void signInWithGoogle(BuildContext context)async{
    state=true;
    final user=await _authRepository.signInWithGoogle(context);
    state=false;
    user.fold(
            (l) => showSnackBar(context,l.message), (userModel) =>
        _ref.read(userProvider.notifier).update((state) => userModel));
  }

  Stream<UserModel>getUserData(String uid){
    return _authRepository.getUserData(uid);
  }
  Future <void> logOut()async {
   _authRepository.logOut();
  }
  updateUser(UserModel userModel)async{
    await _authRepository.updateUser(userModel);;
  }
  Stream<List<UserModel>>getAllUsers({required String yearId}){
    return _authRepository.getUsers(yearId: yearId);
  }

}