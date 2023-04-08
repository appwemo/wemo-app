import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../mobile/model/export_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventServics {
  Future<List<Events>> fetchItems() async {
    List<Events> items = [];
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsib3JnYW5pemF0aW9uLWFkbWluIl0sIngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6Im9yZ2FuaXphdGlvbi1hZG1pbiIsIngtaGFzdXJhLXJvbGUiOiJvcmdhbml6YXRpb24tYWRtaW4iLCJ4LWhhc3VyYS11c2VyLWlkIjoiMSIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJhZG1pbkBhZG1pbi5jb20ifSwiaWF0IjoxNjU2MjMwODI4fQ.zUfOMptIMLFfHi_Nfzq1j8VW-YfgX3nihEFyIx_UGbM";

    final Uri url = Uri.parse("http://167.71.12.36:5000/getEvents");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      print(jsonMap);

      for (var myData in jsonMap['events']) {
        if (myData != null) {
          Events item = Events.fromJson(myData);
          items.add(item);
        }
      }
    }
    return items;
  }

  Future<List<Tickets>> fetchTicket(int id) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Tickets> items = [];
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsib3JnYW5pemF0aW9uLWFkbWluIl0sIngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6Im9yZ2FuaXphdGlvbi1hZG1pbiIsIngtaGFzdXJhLXJvbGUiOiJvcmdhbml6YXRpb24tYWRtaW4iLCJ4LWhhc3VyYS11c2VyLWlkIjoiMSIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJhZG1pbkBhZG1pbi5jb20ifSwiaWF0IjoxNjU2MjMwODI4fQ.zUfOMptIMLFfHi_Nfzq1j8VW-YfgX3nihEFyIx_UGbM";
    final baseUrl = "http://167.71.12.36:8080/api/rest/event/ticket";

    var url = '$baseUrl/$id';
    // if (kDebugMode) {
    //   print("check if the data works here -> $url");
    // }

    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print("check if the  statusCode is 200  -> " +
    //     response.statusCode.toString());

    if (response.statusCode == 200) {
      // print("check instanse body ${response.body}");
      var jsonMap = json.decode(response.body);

      for (var myData in jsonMap['tickets']) {
        if (myData != null) {
          Tickets item = Tickets.fromJson(myData);
          items.add(item);
        }
      }
    }
    return items;
  }
}
