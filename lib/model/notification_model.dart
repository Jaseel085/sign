class NotificationModel {
  String id;
  String notificationImage;
  String heading;
  String notification;
  bool deleted;
  // DateTime date;


  NotificationModel({
    required this.notificationImage,
    required this.id,
    required this.notification,
    required this.heading,
    required this.deleted,
    // required this.date,

  });

  NotificationModel copyWith({
    String? notificationImage,
    String? id,
    String? notification,
    String? heading,
    bool?deleted,
    // DateTime? date
  }) =>
      NotificationModel(
        notificationImage: notificationImage ?? this.notificationImage,
        id: id ?? this.id,
        notification: id ?? this.notification,
        heading: id ?? this.heading,
        deleted: deleted ?? this.deleted,
        // date: date ?? this.date,

      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    notificationImage: json['notificationImage'],
    id: json["id"],
    notification: json["notification"],
    heading: json["heading"],
    deleted: json["deleted"],
    // date: json["date"],

  );

  Map<String, dynamic> toJson() => {
    "notificationImage": notificationImage,
    "id": id,
    "notification": notification,
    "heading": heading,
    "deleted": deleted,
    // "date": date,
  };
}