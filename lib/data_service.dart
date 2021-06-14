// import 'package:http/http.dart' as http;
//     //https://api.kiloloco.com/users
// class Kilo {
//   final int userId;
//   final int id;
//   final String title;
//
//   Kilo({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });
//
//   factory Kilo.fromJson(Map<String, dynamic> json) {
//     return Kilo(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }


// To parse this JSON data, do
//
//     final Kilo = welcomeFromJson(jsonString);

// 


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Kilo KiloFromJson(String str) => Kilo.fromJson(json.decode(str));

String KiloToJson(Kilo data) => json.encode(data.toJson());

class Kilo {
    Kilo({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory Kilo.fromJson(Map<String, dynamic> json) => Kilo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
