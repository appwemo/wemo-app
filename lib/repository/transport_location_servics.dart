// import 'dart:html';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../mobile/model/transport_location_model.dart';

class TransportLocationServics {
  Future<TransportLocation> fetchLocation() async {
    // List<TransportTickets> items = [];
    String uRl = "http://167.71.12.36:8080/api/rest/transport/location";
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsib3JnYW5pemF0aW9uLWFkbWluIl0sIngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6Im9yZ2FuaXphdGlvbi1hZG1pbiIsIngtaGFzdXJhLXJvbGUiOiJvcmdhbml6YXRpb24tYWRtaW4iLCJ4LWhhc3VyYS11c2VyLWlkIjoiMSIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJhZG1pbkBhZG1pbi5jb20ifSwiaWF0IjoxNjU5NjE3NTY1fQ.vsHpg2o3tjdlOPQwWghVpiC8Xhr7TV5NmhF9CTZvaRs";
    final Uri url = Uri.parse(uRl);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      return TransportLocation.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Something is Wrong");
    }
  }
}
