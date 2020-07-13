import 'package:flutter/material.dart';
import 'package:helloworld/task4/stmchangenotifier/model/ProductModel.dart';

class ProductListScreen extends StatelessWidget {
  final ValueSetter<ProductModel> valueSetter;

  ProductListScreen(this.valueSetter);

  var productList = [
    ProductModel(name: "Nokia 7", price: 9000),
    ProductModel(name: "Cumin Seed", price: 90),
    ProductModel(name: "Almond ", price: 900),
    ProductModel(name: "Mustard Oil", price: 120),
    ProductModel(name: "Soya Chunks", price: 40),
    ProductModel(name: "Maggie 7", price: 65),
    ProductModel(name: "Lux", price: 87),
  ];

  @override
  Widget build(BuildContext context) {
    return
      ListView.separated(
      itemCount: productList.length,
      itemBuilder: (context, position) {
        return ListTile(
          onTap: () {
            valueSetter(productList[position]);
          },
          leading: Icon(Icons.ac_unit),
          trailing: Icon(Icons.wb_sunny),
          title: Text(productList[position].name),
          subtitle: Text("Price: Rs. ${productList[position].price}"),
        );
      },
      separatorBuilder: (context, position) {
        return Divider();
      },
    );
  }
}
