import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/featuer/members/repository/members_repository.dart';
import 'package:sign/model/user_model.dart';




final membersControllerProvider = StateNotifierProvider<MembersController,bool >((ref) {
  final MembersRepository=ref.watch(membersRepositoryProvider);
  return MembersController(
      repository:MembersRepository , ref: ref);
});

final getAllMembersProvider = StreamProvider((ref) {
  final membersCOntroller = ref.watch(membersControllerProvider.notifier);
  return membersCOntroller.getAllMembers();
});

class MembersController extends StateNotifier<bool>{
  final MembersRepository _repository;
  final Ref _ref;

  MembersController({
    required MembersRepository repository,
    required Ref ref
}):_repository=repository,
  _ref=ref,super(false);



  Stream<List<UserModel>> getAllMembers() {
    return _repository.getAllUsers();
  }

}