import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/batch_repository.dart';

final batchControllorProvider = StateNotifierProvider<BatchControllor,bool >((ref) {
final BatchRepository=ref.watch(batchRepositoryProvider);
return BatchControllor(
    batchRepository: BatchRepository,
    ref: ref);
});

final  getBatchYearProvider = StreamProvider((ref)  {
  return ref.watch(batchControllorProvider.notifier).getAllBatches();
});

class BatchControllor extends StateNotifier<bool>{
  final BatchRepository _batchRepository;
  final Ref _ref;
  BatchControllor({
    required BatchRepository batchRepository,
    required Ref ref
}):_batchRepository=batchRepository,_ref=ref,super(false);



  Stream<List<String>> getAllBatches(){
    return _batchRepository.getAllBatchName();
  }




}