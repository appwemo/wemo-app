// import 'dart:html';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../mobile/model/request_transport_model.dart';
import '../mobile/model/transprt_request_model.dart';

class RequestServices {
  Future<transportrequest> fetchRequests() async {
    List<transportrequest> requestList = [];
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidHJhbnNwb3J0LWFkbWluIl0sIngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6InRyYW5zcG9ydC1hZG1pbiIsIngtaGFzdXJhLXJvbGUiOiJ0cmFuc3BvcnQtYWRtaW4iLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLWVtYWlsIjoidHJhbnNwb3J0QGFkbWluLmNvbSJ9LCJpYXQiOjE2NTY1ODQ0MTF9.96Ox44PsURn5HXyNW-TyZ-ZbfMmNAYfz3-JH6d_Q3xc";
    final Uri url =
        Uri.parse("http://167.71.12.36:8080/api/rest/transport/request");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      print(response.statusCode);
      return transportrequest.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Request has failed");
    }
    // return requestList;
  }
}
// CopyTicketListPage
