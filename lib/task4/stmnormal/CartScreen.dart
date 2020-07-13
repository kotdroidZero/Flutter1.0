import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final cart;
  final sum;

  CartScreen(this.cart, this.sum);

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: cart == null ? 0 : cart.length,
            itemBuilder: (context, position) {
              return ListTile(
                onTap: () {},
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.wb_sunny),
                title: Text(cart[position].name),
                subtitle: Text("Price: Rs. ${cart[position].price}"),
              );
            },
            separatorBuilder: (context, position) {
              return Divider();
            },
          ),
        ),
        Expanded(
          child: Text(
            "Total Sum: Rs $sum",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Raleway",
                fontSize: 20.0,
                color: Colors.red),
          ),
          flex: 1,
        )
      ],
    ));
  }
}
