// import 'dart:html';

import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../mobile/model/moment_model/fetch_user_model.dart';
import '../mobile/model/moment_model/like_moment_model.dart';
import '../mobile/model/moment_model/moment_model.dart';
import '../mobile/model/moment_model/profilepicture_model.dart';

class MomentServices1 {
  Future<Moment1> fetchMoment() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJkYXdpdC5hc2VnZWRAZ21haWwuY29tIn0sImlhdCI6MTY1ODMzNjgyMH0.hx-dEkiCwsct3CRxT5o1ijVsK6K7OV6Y4t4KVy9BdW0";
    final Uri url = Uri.parse("http://167.71.12.36:5000/getMoments");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Moment1.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetch Moment didnt Respond");
    }
  }

  Future<FetchUser> fetchUsers({required String id}) async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMTgiLCJ4LWhhc3VyYS11c2VyLWVtYWlsIjoidGVzdEB0ZXN0LmNvbSJ9LCJpYXQiOjE2ODQzMjI0NTV9.WUrqylnoMmgmbAXLhMwgKyJLq4zKBVbhtHneltPGLYE";
    final Uri url =
        Uri.parse("http://167.71.12.36:8080/api/rest/search/user/basic/$id");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return FetchUser.fromJson(jsonDecode(response.body));
      //   final jsonMap = json.decode(response.body);

      //   for (var myData in jsonMap['transport_tickets']) {
      //     if (myData != null) {
      //       print(myData);
      //       TransportTickets item = TransportTickets.fromJson(myData);
      //       items.add(item);
      //     }
      //   }
      // }
      // return items;
    } else {
      throw Exception("Fetch user name didnt Respond");
    }
  }

  Future<ProfileUser> fetchUserProfile({required String userProfile}) async {
    // List<TransportTickets> items = [];
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJkYXdpdC5hc2VnZWRAZ21haWwuY29tIn0sImlhdCI6MTY3NzY2MTcwM30.helgpHnDubhbVb1QilkW0EXDQmySnZHlTWUC7P9sEyg";
    final Uri url = Uri.parse("http://167.71.12.36/getProfilePicture");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"id": userProfile}));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return ProfileUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetch User profile picture Didnt Respond");
    }
  }

// DELET USER POSTS IN MOMENTS
  // Future<DeleteMoment> deketNoement({required String delMoment}) async {
  //   // List<TransportTickets> items = [];
  //   String token =
  //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJkYXdpdC5hc2VnZWRAZ21haWwuY29tIn0sImlhdCI6MTY1ODMzNjgyMH0.hx-dEkiCwsct3CRxT5o1ijVsK6K7OV6Y4t4KVy9BdW0";
  //   final Uri url = Uri.parse("http://167.71.12.36:5000/removeMoment");
  //   final response = await http.delete(url,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: jsonEncode({"filename": delMoment}));
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     return DeleteMoment.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("Fetch User profile picture Didnt Respond");
  //   }
  // }

// Like MOMENTS
  Future<LikeMoment1> LikeMoment({required String LikeMoment}) async {
    // List<TransportTickets> items = [];

    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJkYXdpdC5hc2VnZWRAZ21haWwuY29tIn0sImlhdCI6MTY1ODMzNjgyMH0.hx-dEkiCwsct3CRxT5o1ijVsK6K7OV6Y4t4KVy9BdW0";
    final Uri url = Uri.parse("http://167.71.12.36:5000/checkMoment");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({"moment_id": LikeMoment}));
    print(response.body);
    var data = json.decode(response.body);
    if (data["liked"] == true) {
      // if (response.body == true) {
      //   return LikeMoment1.fromJson(jsonDecode(response.body));
      // }
      print('wooorksssssssssssssssssssssssssssssss');

      return LikeMoment1.fromJson(jsonDecode(response.body));
    }

    // if (response.body == 'Liked' && response.body == 'Removed Like') {
    //   print(response.body);
    //   return LikeMoment1.fromJson(jsonDecode(response.body));
    // }
    // if (response.body == "Removed Like") {
    //   print("Removeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed");
    //   return LikeMoment1.fromJson(jsonDecode(response.body));
    // }
    else {
      // return LikeMoment1.fromJson(jsonDecode(response.body));
      throw Exception("Like Moment Didnt Respond");
    }
  }
}
