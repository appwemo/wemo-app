import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../mobile/model/export_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mobile/model/purchase_list.dart';

class EventServics {
  Future<List<Events>> fetchItems() async {
    List<Events> items = [];
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsib3JnYW5pemF0aW9uLWFkbWluIl0sIngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6Im9yZ2FuaXphdGlvbi1hZG1pbiIsIngtaGFzdXJhLXJvbGUiOiJvcmdhbml6YXRpb24tYWRtaW4iLCJ4LWhhc3VyYS11c2VyLWlkIjoiMSIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJhZG1pbkBhZG1pbi5jb20ifSwiaWF0IjoxNjU2MjMwODI4fQ.zUfOMptIMLFfHi_Nfzq1j8VW-YfgX3nihEFyIx_UGbM";

    final Uri url = Uri.parse("http://167.71.12.36:5000/getEvents");
    print(url);
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

  Future<List<Purchases>> fetchList() async {
    List<Purchases> items = [];
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJkYXdpdC5hc2VnZWRAZ21haWwuY29tIn0sImlhdCI6MTY1NjI0Mzc0N30.kKXI28t7hb3pGOOw1Xnpnv_IVeTmjPxBGGs58xYkFpQ";

    final Uri url =
        Uri.parse("http://167.71.12.36:8080/api/rest/purchase/list");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> body = json.decode(response.body);
    //   Purchases itemss = Purchases.fromJson();
    //   items.add(itemss);
    // }
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      print(jsonMap);

      for (var myData in jsonMap['getFullPurchaseInformation']['list']
          ['purchases']) {
        if (myData != null) {
          Purchases item = Purchases.fromJson(myData);
          items.add(item);
        }
      }
      print(items);
    }
    return items;
  }
}
