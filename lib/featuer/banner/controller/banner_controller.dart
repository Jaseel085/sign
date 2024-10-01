import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/featuer/banner/repository/banner_repository.dart';
import 'package:sign/model/bannerModel.dart';
import 'package:sign/model/committee_model.dart';
final bannerProvider=StateProvider<BannerModel?>((ref) => null);

final getBannersProvider = StreamProvider((ref)  {
  final bannerController=ref.watch(bannerControllerProvider.notifier);
  return bannerController.showUploadedBanner();
});

final getCommiteeMembersProvider = StreamProvider((ref)  {
  final bannerController=ref.watch(bannerControllerProvider.notifier);
  return bannerController.showcommiteeMembers();
});


final bannerControllerProvider = StateNotifierProvider<BannerController,bool >((ref) {
  final bannerRepository=ref.watch(bannerRepositoryProvider);
  return  BannerController(repository: bannerRepository, ref: ref);
});

class BannerController extends StateNotifier <bool>{
  final BannerRepository _repository;
  final Ref _ref;

  BannerController({
    required BannerRepository repository,
    required Ref ref
}):_repository=repository,_ref=ref,super(false);

  Stream <List<BannerModel>> showUploadedBanner(){
    return _repository.showUploadedBanners();
  }

  Stream <List<CommiteeModel>> showcommiteeMembers(){
    return _repository.showCommiteeMembers();
  }

}