import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/firbase_constants.dart';
import 'package:sign/model/user_model.dart';

import '../../../core/providers/firbase_providers.dart';

final membersRepositoryProvider = Provider((ref) {
  return MembersRepository(firestore: ref.watch(fireStoreProvider));
});

class MembersRepository{
  final FirebaseFirestore _firestore;
  MembersRepository({
    required FirebaseFirestore firestore
}):_firestore=firestore;

  Stream<List<UserModel>> getAllUsers() {
    return _users.snapshots().map((event) {
      List<UserModel> user = [];
      for (var doc in event.docs) {
        user.add(UserModel.fromMap(doc.data() as Map<String, dynamic>));
      }
      return user;
    });
  }

CollectionReference get _users=>_firestore.collection(FirebaseConstants.usersCollection);

}