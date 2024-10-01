class CommiteeModel {
  String id;
  String name;
  String designation;
  String number;
  String image;
  // bool batch;


  CommiteeModel({
    required this.name,
    required this.designation,
    required this.number,
    required this.id,
    required this.image,
    // required this.batch,

  });

  CommiteeModel copyWith({
    String? name,
    String? designation,
    String? number,
    String? id,
    String? image,
    // bool?batch
  }) =>
      CommiteeModel(
        name: name ?? this.name,
        designation: designation ?? this.designation,
        number: number ?? this.number,
        id: id ?? this.id,
        image: image ?? this.image,
        // batch: batch ?? this.batch,

      );

  factory CommiteeModel.fromJson(Map<String, dynamic> json) => CommiteeModel(
    name: json['name'],
    designation: json['designation'],
    number: json['number'],
    id: json["id"],
    image: json["image"],
    // batch: json["batch"],

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "designation": designation,
    "number": number,
    "id": id,
    "image": image,
    // "batch": batch,
  };
}