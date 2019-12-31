class User{
  UserData data;

  User({this.data});
  factory User.fromJson(Map<String,dynamic> json){
    return User(
      data: UserData.fromJson(json['data']),
    );
  }

}

class UserData{
  String displayName,phone,avatar,token;

  UserData({this.displayName, this.phone, this.avatar, this.token});

  factory UserData.fromJson(Map<String,dynamic> json){
    return UserData(
      displayName: json['displayName'],
      avatar: json['avatar'],
      phone: json['phone'],
      token: json['token'],
    );
  }

}