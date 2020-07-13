
class Person {
    int age;
    String manager;
    String name;
    String profile;

    Person({this.age, this.manager, this.name, this.profile});

    factory Person.fromJson(Map<String, dynamic> json) {
        return Person(
            age: json['age'], 
            manager: json['manager'], 
            name: json['name'], 
            profile: json['profile'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['age'] = this.age;
        data['manager'] = this.manager;
        data['name'] = this.name;
        data['profile'] = this.profile;
        return data;
    }
}