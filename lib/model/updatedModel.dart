class UpdatedModel{
  final String name;
  final String profilePic;
  final String uid;
  final bool isAuthenticated;


  UpdatedModel({
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.isAuthenticated,

  });
  UpdatedModel copyWith({
    String? name,
    String? profilePic,
    String? uid,
    bool ?isAuthenticated,

  }){
    return UpdatedModel(
      name: name??this.name,
      profilePic: profilePic??this.profilePic,
      uid: uid??this.uid,
      isAuthenticated: isAuthenticated??this.isAuthenticated,

    );
  }


  factory UpdatedModel.fromMap(Map<String, dynamic>map)=>
      UpdatedModel(
        name: map['name']??'',
        profilePic: map ['profilePic']??'',
        uid: map['uid']??'',
        isAuthenticated: map ['isAuthenticated']??'',

      );
  Map<String, dynamic> toMap()=>
      {
        'name':name,
        'profilePic':profilePic,
        'uid':uid,
        'isAuthenticated':isAuthenticated,
      };
}