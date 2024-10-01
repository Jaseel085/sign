import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/providers/firbase_providers.dart';
import 'package:sign/model/notification_model.dart';

import '../../../core/firbase_constants.dart';

final notificationRepositoryProvider = Provider((ref) {
  return NotificationRepository(firestore: ref.watch(fireStoreProvider));
});

class NotificationRepository{
  final FirebaseFirestore _firestore;

  NotificationRepository({
    required FirebaseFirestore firestore
  }):_firestore=firestore;

  Stream<List<NotificationModel>> getAllNotifications() {
    return _notification.snapshots().map((event) {
      List<NotificationModel> notifications = [];
      for (var doc in event.docs) {
        notifications.add(NotificationModel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return notifications;
    });
  }


  CollectionReference get _notification =>
      _firestore.collection(FirebaseConstants.notificationCollection);
}