import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign/model/user_model.dart';

import '../../../core/firbase_constants.dart';

class EditProfileRepository{
  final FirebaseFirestore _firestore;
  EditProfileRepository({
    required FirebaseFirestore firestore
}):_firestore=firestore;



  updateUsers(UserModel userModel){
    _users.doc(userModel.uid).update(userModel.toMap());
  }





  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);


}