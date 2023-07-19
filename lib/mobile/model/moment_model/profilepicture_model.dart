// To parse this JSON data, do
//
//     final profileUser = profileUserFromJson(jsonString);

import 'dart:convert';

ProfileUser profileUserFromJson(String str) =>
    ProfileUser.fromJson(json.decode(str));

String profileUserToJson(ProfileUser data) => json.encode(data.toJson());

class ProfileUser {
  ProfilePicture profilePicture;

  ProfileUser({
    required this.profilePicture,
  });

  factory ProfileUser.fromJson(Map<String, dynamic> json) => ProfileUser(
        profilePicture: ProfilePicture.fromJson(json["profile_picture"]),
      );

  Map<String, dynamic> toJson() => {
        "profile_picture": profilePicture.toJson(),
      };
}

class ProfilePicture {
  String image;
  String filename;

  ProfilePicture({
    required this.image,
    required this.filename,
  });

  factory ProfilePicture.fromJson(Map<String, dynamic> json) => ProfilePicture(
        image: json["image"],
        filename: json["filename"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "filename": filename,
      };
}
