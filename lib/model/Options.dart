import 'package:flutter/material.dart';
class Options{
  String? pID;
  String? fID;
  String? name;
  String? urlImg;
  String? calories;

  Options({this.pID,this.fID,this.name,this.urlImg,this.calories});
  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      pID: json['pID'],
      name: json['name'],
      urlImg: json['urlImg'],
      calories: json['calories']
    );
  }
}


