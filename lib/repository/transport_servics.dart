// import 'dart:html';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../mobile/model/request_transport_model.dart';

class TransportTicketsServics {
  // final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
//
  Future<List<TransportTicket>> fetchTransport() async {
    List<TransportTicket> items = [];
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJkYXdpdC5hc2VnZWRAZ21haWwuY29tIn0sImlhdCI6MTY1NjY4MDM1OH0.NfR_K0COsdIMEVj7nDiiHY1wb13gVkt1p9SvhtDP9iU";
    final Uri url =
        Uri.parse("http://167.71.12.36:8080/api/rest/transport/ticket");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);

      for (var myData in jsonMap['transport_tickets']) {
        if (myData != null) {
          TransportTicket item = TransportTicket.fromJson(myData);
          items.add(item);
        }
      }
    }
    return items;
  }
  // else {
  //   throw Exception("failed");
  // }
}
