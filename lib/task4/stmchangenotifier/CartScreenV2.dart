import 'package:flutter/material.dart';
import 'package:helloworld/task4/stmchangenotifier/model/ProductModel.dart';
import 'package:provider/provider.dart';

class CartScreenV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// here this widget is working as consumer or listener of the notifier Model
    /// it may also be called observer if you are coming with the android background
    /// you may be better familiar with that.
    return Consumer<ProductModel>(builder: (context, productModelList, child) {
      return Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: productModelList.getList() == null
                  ? 0
                  : productModelList.getList().length,
              itemBuilder: (context, position) {
                return ListTile(
                  onTap: () {},
                  leading: Icon(Icons.ac_unit),
                  trailing: Icon(Icons.wb_sunny),
                  title: Text(productModelList.getList()[position].name),
                  subtitle: Text(
                      "Price: Rs. ${productModelList.getList()[position].price}"),
                );
              },
              separatorBuilder: (context, position) {
                return Divider();
              },
            ),
          ),
          Expanded(
            child: Text(
              "Total Sum: Rs ${productModelList.getSum()}",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Raleway",
                  fontSize: 20.0,
                  color: Colors.red),
            ),
            flex: 1,
          )
        ],
      );
    });
  }
}
