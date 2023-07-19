// To parse this JSON data, do
//
//     final fetchUser = fetchUserFromJson(jsonString);

import 'dart:convert';

FetchUser fetchUserFromJson(String str) => FetchUser.fromJson(json.decode(str));

String fetchUserToJson(FetchUser data) => json.encode(data.toJson());

class FetchUser {
  User user;

  FetchUser({
    required this.user,
  });

  factory FetchUser.fromJson(Map<String, dynamic> json) => FetchUser(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  int id;
  String firstName;
  String lastName;
  String handle;
  String sex;
  String linkFacebook;
  dynamic linkInstagram;
  dynamic linkTelegram;
  dynamic linkTwitter;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.handle,
    required this.sex,
    required this.linkFacebook,
    this.linkInstagram,
    this.linkTelegram,
    this.linkTwitter,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        handle: json["handle"],
        sex: json["sex"],
        linkFacebook: json["link_facebook"],
        linkInstagram: json["link_instagram"],
        linkTelegram: json["link_telegram"],
        linkTwitter: json["link_twitter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "handle": handle,
        "sex": sex,
        "link_facebook": linkFacebook,
        "link_instagram": linkInstagram,
        "link_telegram": linkTelegram,
        "link_twitter": linkTwitter,
      };
}
