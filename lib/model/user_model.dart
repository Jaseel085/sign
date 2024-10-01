class UserModel{
  final String name;
  final String profilePic;
  final String uid;
  final String place;
  final String iGraduation;
  final String mGraduation;
  final String year;
  final String number;
  final bool isAuthenticated;



  UserModel( {
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.isAuthenticated,
    required this.place,
    required this.iGraduation,
    required this.mGraduation,
    required this.year,
    required this.number,

  });
  UserModel copyWith({
    String? name,
    String? profilePic,
    String? uid,
    String? place,
    String? iGraduation,
    String? mGraduation,
    String? year,
    String? number,
    bool ?isAuthenticated,

  }){
    return UserModel(
      name: name??this.name,
      profilePic: profilePic??this.profilePic,
      uid: uid??this.uid,
      isAuthenticated: isAuthenticated??this.isAuthenticated,
      place: place??this.place,
      iGraduation: iGraduation??this.iGraduation,
      mGraduation: mGraduation??this.mGraduation,
      number: number??this.number,
        year: year??this.year

    );
  }


  factory UserModel.fromMap(Map<String, dynamic>map)=>
      UserModel(
        name: map['name']??'',
        profilePic: map ['profilePic']??'',
        uid: map['uid']??'',
        isAuthenticated: map ['isAuthenticated']??'',
        place: map ['place']??'',
        iGraduation: map ['iGraduation']??'',
        mGraduation: map ['mGraduation']??'',
        number: map ['number']??'',
        year: map['year']??'',
      );
  Map<String, dynamic> toMap()=>
      {
        'name':name,
        'profilePic':profilePic,
        'uid':uid,
        'isAuthenticated':isAuthenticated,
        'place':place,
        'iGraduation':iGraduation,
        'mGraduation':mGraduation,
        'number':number,
        'year':year,

      };
}