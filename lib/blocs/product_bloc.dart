import 'package:flutter_app_bloc_demo/model/product.dart';
import 'package:flutter_app_bloc_demo/repository/product_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc{
  ProductRepository productRepository = ProductRepository();
  BehaviorSubject<List<Product>> behaviorSubject = BehaviorSubject();

  void getListProduct()async{
    List<Product> productList =  await productRepository.getListProduct();
    behaviorSubject.sink.add(productList);
  }

}