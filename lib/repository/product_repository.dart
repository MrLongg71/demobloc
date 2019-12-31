import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_demo/model/product.dart';
import 'package:flutter_app_bloc_demo/network/api.dart';
import 'package:flutter_app_bloc_demo/network/endpoint.dart';

class ProductRepository{
    Future<List<Product>> getListProduct() async{
    var completer = Completer<List<Product>>();
      try{
      Response response =await API.getAPI().get(EndPoint.LIST_PRODUCT);
      print(response.data);
      ListProduct listProduct = ListProduct.fromJson(response.data);
      completer.complete(listProduct.data);
    }on DioError catch(e){
      print("====");
      print(e);
    }
    return completer.future;
  }
}