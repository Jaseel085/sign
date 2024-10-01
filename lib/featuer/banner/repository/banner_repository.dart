import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/providers/firbase_providers.dart';
import 'package:sign/model/bannerModel.dart';
import 'package:sign/model/committee_model.dart';

import '../../../core/firbase_constants.dart';

final bannerRepositoryProvider = Provider((ref) {
  return BannerRepository(firestore: ref.watch(fireStoreProvider)) ;
});

class BannerRepository{
  final FirebaseFirestore _firestore;
  BannerRepository({
    required FirebaseFirestore firestore
}):_firestore=firestore;

  Stream<List<BannerModel>>showUploadedBanners() {
    return _banner.where('deleted', isEqualTo: false)
        .snapshots().map((event) {
      List<BannerModel>banners = [];
      for (var doc in event.docs) {
        banners.add(BannerModel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return banners;
    });
  }

  Stream<List<CommiteeModel>>showCommiteeMembers() {
    return _commitee.orderBy("date",descending: false).snapshots().map((event) {
      List<CommiteeModel>members = [];
      for (var doc in event.docs) {
        members.add(CommiteeModel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return members;
    });
  }

  CollectionReference get _banner =>
      _firestore.collection(FirebaseConstants.bannerCollection);
  CollectionReference get _commitee =>
      _firestore.collection(FirebaseConstants.committeeCollection);
}