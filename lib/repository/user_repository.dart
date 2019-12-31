import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_demo/model/user.dart';
import 'package:flutter_app_bloc_demo/network/api.dart';
import 'package:flutter_app_bloc_demo/network/endpoint.dart';

class UserRepository{
  Future<User> loginUser(String phone,password) async{
    try{
      Response response = await API.getAPI().post(EndPoint.SIGN_IN,
          data: {"phone": phone, "password": password});
      print(response.data);

      return User.fromJson(response.data);
    }on DioError catch(e){
      print(e);
    }
  }
}