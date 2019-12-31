import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_demo/blocs/product_bloc.dart';
import 'package:flutter_app_bloc_demo/model/product.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListProduct(),
    );
  }
}

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  ProductBloc productBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
      stream: productBloc.behaviorSubject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: GridView.count(
              childAspectRatio: 9 / 16,
              crossAxisCount: 2,
              children: List.generate(snapshot.data.length, (index) {
                return Container(
                    padding: EdgeInsets.all(10),
                    child:
                        ItemWidget(snapshot.data[index], 100 , 100));
              }),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productBloc.getListProduct();
  }
}

class ItemWidget extends StatelessWidget {
  final Product product;
  final double width;
  final double height;

  ItemWidget(this.product, this.width, this.height);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.network(
          product.productImage,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          product.productName,
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 100,
          height: 35,
          child: RaisedButton(
            onPressed: () {

            },
            color: Colors.orange[600],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: Text(
              "Buy now",
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
