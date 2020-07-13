import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/task4/stmchangenotifier/model/ProductModel.dart';
import 'package:helloworld/task4/stmnormal/ProductListScreen.dart';

import 'CartScreen.dart';

///this is way one of state management here we are doing it with simply having
///a reference of state in parent and updating it's value from child widget and
///next child uses it from the parent
class CartDemoScreen extends StatefulWidget {
  @override
  _CartDemoScreenScreenState createState() => _CartDemoScreenScreenState();
}

class _CartDemoScreenScreenState extends State<CartDemoScreen> {
  List<ProductModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Product List',
              ),
              Tab(
                text: 'Cart List',
              )
            ],
          ),
          title: Text("Cart Demo"),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductListScreen((selectedProduct) {
              setState(() {
                cart.add(selectedProduct);
                var sum1 = 0;
                cart.forEach((f) {
                  sum1 += f.price;
                });
                sum = sum1;
              });
            }),
            CartScreen(cart, sum)
          ],
        ),
      ),
    );
  }
}
