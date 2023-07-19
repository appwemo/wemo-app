// To parse this JSON data, do
//
//     final likeMoment1 = likeMoment1FromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LikeMoment1 likeMoment1FromJson(String str) =>
    LikeMoment1.fromJson(json.decode(str));

String likeMoment1ToJson(LikeMoment1 data) => json.encode(data.toJson());

class LikeMoment1 {
  int momentId;

  LikeMoment1({
    required this.momentId,
  });

  factory LikeMoment1.fromJson(Map<String, dynamic> json) => LikeMoment1(
        momentId: json["moment_id"],
      );

  Map<String, dynamic> toJson() => {
        "moment_id": momentId,
      };
}
