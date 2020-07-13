import 'Geo.dart';

class Address {
  String city;
  Geo geo;
  String street;
  String suite;
  String zipcode;

  String getFullAddress() {
    return "$street, $city, $suite, $zipcode";
  }

  Address({this.city, this.geo, this.street, this.suite, this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
      street: json['street'],
      suite: json['suite'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo.toJson();
    }
    return data;
  }
}
