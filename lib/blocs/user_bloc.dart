import 'dart:async';

import 'package:flutter_app_bloc_demo/model/user.dart';
import 'package:flutter_app_bloc_demo/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';


class UserBloc implements BaseUser{
  final StreamController phoneController = StreamController();
  final StreamController passController = StreamController();

  final UserRepository userRepository = UserRepository();
  final BehaviorSubject<User> subject = BehaviorSubject<User>();

  bool isValid(String phone, String password){
    bool check = false;
    if(phone.isEmpty){
      phoneController.addError("Phone is Empty");
      check = false;
    }else{
      phoneController.sink.add("Ok");
      check = true;

    }
    if(password.isEmpty){
      passController.addError("Password is Empty");
      check = false;

    }else{
      passController.sink.add("ok");
      check = true;


    }
    return check;
  }
  void submitLogin(String phone,password) async{
   if(isValid(phone, password)){
     User user =  await userRepository.loginUser(phone, password);
     subject.sink.add(user);

   }

  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.close();
    passController.close();
    subject.close();
  }
}
abstract class BaseUser{
  void dispose();
}