import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/providers/firbase_providers.dart';

import '../../../core/firbase_constants.dart';

final batchRepositoryProvider = Provider((ref) {
  return BatchRepository(firestore:ref.watch(fireStoreProvider) ) ;
});

class BatchRepository{
  final FirebaseFirestore _firestore;

  BatchRepository({
    required FirebaseFirestore firestore
}):_firestore=firestore;

Stream <List<String>> getAllBatchName() {
  return _batch.snapshots().map((event) {
    List<String> batchList = [];
    for (var doc in event.docs) {
      batchList.add(doc.get('batchYear'));
    }
    return batchList;
  });
}






  CollectionReference get _batch =>
      _firestore.collection(FirebaseConstants.batchCollection);

}