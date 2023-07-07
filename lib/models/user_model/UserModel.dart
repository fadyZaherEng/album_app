import 'package:awt_task/models/user_model/Address.dart';
import 'package:awt_task/models/user_model/Company.dart';

class UserModel {
    Address? address;
    Company ?company;
    String ?email;
    int ?id;
    String? name;
    String? phone;
    String? username;
    String? website;

    UserModel({this.address, this.company, this.email, this.id, this.name, this.phone, this.username, this.website});

    factory UserModel.fromJson(Map<String, dynamic> json) {
        return UserModel(
            address: json['address'] != null ? Address.fromJson(json['address']) : null, 
            company: json['company'] != null ? Company.fromJson(json['company']) : null, 
            email: json['email'], 
            id: json['id'], 
            name: json['name'], 
            phone: json['phone'], 
            username: json['username'], 
            website: json['website'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['username'] = this.username;
        data['website'] = this.website;
        if (this.address != null) {
            data['address'] = this.address!.toJson();
        }
        if (this.company != null) {
            data['company'] = this.company!.toJson();
        }
        return data;
    }
}