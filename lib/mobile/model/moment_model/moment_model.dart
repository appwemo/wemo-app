// To parse this JSON data, do
//
//     final moment1 = moment1FromJson(jsonString);

import 'dart:convert';

Moment1 moment1FromJson(String str) => Moment1.fromJson(json.decode(str));

String moment1ToJson(Moment1 data) => json.encode(data.toJson());

class Moment1 {
  List<Moment> moments;

  Moment1({
    required this.moments,
  });

  factory Moment1.fromJson(Map<String, dynamic> json) => Moment1(
        moments:
            List<Moment>.from(json["moments"].map((x) => Moment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "moments": List<dynamic>.from(moments.map((x) => x.toJson())),
      };
}

class Moment {
  int id;
  int eventId;
  User user;
  int userId;
  DateTime createdAt;
  int views;
  int likes;
  String filename;
  Links links;
  String image;

  Moment({
    required this.id,
    required this.eventId,
    required this.user,
    required this.userId,
    required this.createdAt,
    required this.views,
    required this.likes,
    required this.filename,
    required this.links,
    required this.image,
  });

  factory Moment.fromJson(Map<String, dynamic> json) => Moment(
        id: json["id"],
        eventId: json["event_id"],
        user: User.fromJson(json["user"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        views: json["views"],
        likes: json["likes"],
        filename: json["filename"],
        links: Links.fromJson(json["links"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "user": user.toJson(),
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "views": views,
        "likes": likes,
        "filename": filename,
        "links": links.toJson(),
        "image": image,
      };
}

class Links {
  String? linkFacebook;
  dynamic linkInstagram;
  dynamic linkTelegram;
  dynamic linkTwitter;

  Links({
    this.linkFacebook,
    this.linkInstagram,
    this.linkTelegram,
    this.linkTwitter,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        linkFacebook: json["link_facebook"],
        linkInstagram: json["link_instagram"],
        linkTelegram: json["link_telegram"],
        linkTwitter: json["link_twitter"],
      );

  Map<String, dynamic> toJson() => {
        "link_facebook": linkFacebook,
        "link_instagram": linkInstagram,
        "link_telegram": linkTelegram,
        "link_twitter": linkTwitter,
      };
}

class User {
  String firstName;
  String lastName;

  User({
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
      };
}
