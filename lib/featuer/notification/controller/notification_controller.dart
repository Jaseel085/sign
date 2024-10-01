import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/featuer/notification/repository/notification_repository.dart';
import 'package:sign/model/notification_model.dart';


final notificationControllerProvider= StateNotifierProvider< NotificationController,bool >((ref) {
 final notificationRepository=ref.read(notificationRepositoryProvider);
  return NotificationController(
      repository: notificationRepository, ref: ref);
});

final  getNotificationProvider = StreamProvider((ref)  {
  return ref.watch(notificationControllerProvider.notifier).getAllNotification();
});

class NotificationController extends StateNotifier<bool>{
  final NotificationRepository _repository;
  final Ref _ref;
  NotificationController({
    required NotificationRepository repository,
    required Ref ref
}):_repository=repository,_ref=ref,super (false);

  Stream<List<NotificationModel>> getAllNotification(){
    return _repository.getAllNotifications();
  }

}