import 'package:flutter/material.dart';

/// this is extended with ChangeNotifier, as name suggest that notify when it got
/// any changes, means it's kind of observables which can be observed by any Widget.
class ProductModel with ChangeNotifier {
  String name;
  num price;

  ProductModel({this.name, this.price});

  num totalSum=0;

  List<ProductModel> list=[];

  List<ProductModel> getList() {
    return list;
  }

  num getSum() {
    return totalSum;
  }



  /// as soon as  notifyListeners is called inside this function , all of it's
  /// listeners will be update that it's time to redraw your UI with new state
  /// i.e. with new values, in Flutter, State is basically the new values of any
  /// variables
  void addModel(ProductModel model) {
    list.add(model);
    totalSum += model.price;
    notifyListeners();
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
