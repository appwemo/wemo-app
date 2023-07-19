import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:register_num/cart/tra_model.dart';
import 'package:http/http.dart' as http;

import '../../model/request_transport_model.dart';
import '../../model/set_request_transport_model.dart';

// import '../../model/transport_ticket_model.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class TransportDetails extends StatefulWidget {
  final TransportTicket data;
  final int numOfSeat;
  const TransportDetails(
      {super.key, required this.data, required this.numOfSeat});

  @override
  State<TransportDetails> createState() => _tarrDetailsState();
}

class _tarrDetailsState extends State<TransportDetails> {
  // static final CameraPosition _kGooglepley =
  //     CameraPosition(target: LatLng(25.11938, 55.3773), zoom: 4);
  // DataTime p = widget.data.
  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 250,
            color: Colors.purple[50],
            child: Center(
              child: Text('Location'),
            ),
            // child: Center(
            //   child: GoogleMap(initialCameraPosition: _kGooglepley),
            // ),
          ),
          Text("Bus = ${widget.data.transportProvider.name}"),
          Row(
            children: [
              Text("Seats ${widget.numOfSeat}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('from = ${data.departureLocation.city} '),
              Text('To = ${data.destinationLocation.city}')
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text("to dawit"),
          Text("Price = ${widget.data.priceBirr}"),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text("Name"), Spacer(), Text("Dawit")],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        request(data.id);
                        print(data.id);
                        print("You have Sent request please wait patince");
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => numOfSeat()));

                        // var data = widget.data;
                        // request(data.id, widget.numOfSeat, 3, 31);
                      },
                      child: Text("Book Now!"))),
              SizedBox(
                height: 10,
              ),
            ],
          ), /* 
          Container(
            color: Colors.amber,
            height: 500,
            width: 300,
            child: 
          ) */
        ],
      ),
    );
  }

  Future<requestmModell> request(
    int? ticket_id,
    /* int? numOfSeats, int? buyer_id, int? boughtFor */
  ) async {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJkYXdpdC5hc2VnZWRAZ21haWwuY29tIn0sImlhdCI6MTY1NjY4NjI5MX0.OJ6W0Ru4BHCl9rK1FYjIhEB-6k0VWRlaEmf0rHWjx5Y';
    final baseUrl = 'http://167.71.12.36:8080/api/rest/transport/request';
    var url = baseUrl;
    print(url);
    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode({
            "transport_ticket_id": 63,
            "number_of_seats": 3,
            "buyer_id": 3,
            "bought_for": 3
          }));
      print(url);
      print(response.statusCode);
      var data = json.decode(response.body);

      if (data['error'] ==
          "You do not have enough E-Coin to reserve a ticket") {
        print("You do not have enough E-Coin to reserve a ticket");
      }
      if (response.statusCode == 200) {
        print(data);
        return requestmModell.fromJson(data);
      }
    } catch (e) {
      print('Some Error = ${e}');
      print(e);
    }
    throw Exception('Failed to request');
  }
}
