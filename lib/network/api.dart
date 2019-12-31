import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_demo/network/endpoint.dart';

class API {
  static Dio getAPI() {
    BaseOptions options = new BaseOptions(
      baseUrl: EndPoint.SIGN_IN,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = new Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options myOption) async {

        myOption.headers["Authorization"] = "Bearer " + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJkZTI1N2UwNi05ZWRjLTRjNTQtOGFmMi05NTBkZTZkNWY4MzkiLCJyb2xlIjoiQURNSU4iLCJwaG9uZU51bmJlciI6IjAzOTIzNTA4MTUiLCJleHAiOjE1OTA3MjU1NzF9.GxxCpvAe7g7QsvBo2fuNZ8D-w6lNOnudIWwAKd3Y-uU";

      return myOption;
    }));
    return dio;
  }
}
