class BannerModel {
  String id;
  String bannerImage;
  String description;
  bool deleted;


  BannerModel({
    required this.bannerImage,
    required this.id,
    required this.description,
    required this.deleted,

  });

  BannerModel copyWith({
    String? bannerImage,
    String? id,
    String? description,
    bool?deleted
  }) =>
      BannerModel(
        bannerImage: bannerImage ?? this.bannerImage,
        id: id ?? this.id,
        description: id ?? this.description,
        deleted: deleted ?? this.deleted,

      );

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    bannerImage: json['bannerImage'],
    id: json["id"],
    description: json["description"],
    deleted: json["deleted"],

  );

  Map<String, dynamic> toJson() => {
    "bannerImage": bannerImage,
    "id": id,
    "description": description,
    "deleted": deleted,
  };
}
