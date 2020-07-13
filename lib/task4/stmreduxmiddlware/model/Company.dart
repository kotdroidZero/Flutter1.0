
class Company {
    String bs;
    String catchPhrase;
    String name;

    Company({this.bs, this.catchPhrase, this.name});

    factory Company.fromJson(Map<String, dynamic> json) {
        return Company(
            bs: json['bs'], 
            catchPhrase: json['catchPhrase'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['bs'] = this.bs;
        data['catchPhrase'] = this.catchPhrase;
        data['name'] = this.name;
        return data;
    }
}