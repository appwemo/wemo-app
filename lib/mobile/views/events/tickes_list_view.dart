import 'package:flutter/material.dart';

import '../../../repository/request_tansport_servics.dart';
import '../../model/request_transport_model.dart';
import '../../model/transprt_request_model.dart';

class ticketListView extends StatefulWidget {
  ticketListView({Key? key}) : super(key: key);

  @override
  State<ticketListView> createState() => _RequestDisplayState();
}

class _RequestDisplayState extends State<ticketListView> {
  TextEditingController controller = TextEditingController();

  bool isac = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final Future<transportrequest> _futureRequest =
      RequestServices().fetchRequests();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Transport Ticket"),
        actions: [
          ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => traSearch()));
              },
              child: Text("Search"))
        ],
      ),
      body: FutureBuilder<transportrequest>(
        future: _futureRequest,
        builder: (context, snapshot) {
          // if () {

          // }
          //Check for errors
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }
          //Has data arrived
          if (snapshot.hasData) {
            // if (snapshot.data!.getRequests!.responseList!.approved == "true") {}
            // return Text('loding');
            // List<GetEvents> parsed = snapshot.data;

            return Column(
              children: [
                /* TextField(
                  // controller: controller,
                  // onChanged: searchTicket,
                ), */
                Container(
                  height: 650,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.vertical,
                        itemCount:
                            snapshot.data!.getRequests!.responseList!.length,
                        itemBuilder: (_, index) {
                          var data =
                              snapshot.data!.getRequests!.responseList![index];
                          int hello = index;
                          final ttransport =
                              snapshot.data!.getRequests!.responseList![index];
                          if (snapshot.data!.getRequests!.responseList![index]
                                  .approved ==
                              true) {
                            DateTime timee = DateTime.parse(
                                "${ttransport.transportTicket!.departureDate}");
                            print('${timee.hour}: ${timee.minute}');
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                height: 330,
                                decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          // width: double.maxFinite,
                                          height: 30,
                                          color: Colors.green,
                                          child: Center(
                                              child: Text("Request Approved"))),
                                      Container(
                                        color: Colors.grey[200],
                                        height: 80,
                                        width: 380,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "ID = ${ttransport.by!.id}")
                                                ],
                                              ),
                                              Text(
                                                  "Name  = ${ttransport.by!.firstName} ${ttransport.by!.lastName}"),
                                              Text(
                                                  "Email = ${ttransport.by!.email}"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Bus = ${ttransport.transportTicket!.transportProvider!.name}"),
                                                  Text(
                                                      "Ticket ID = ${ttransport.transportTicket!.id} "),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      (" From  Deparature ID = ${ttransport.transportTicket!.destinationLocationId}")),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                          " To  Destination ID = ${ttransport.transportTicket!.destinationLocationId}")
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                  'Deparature data = ${'Day - ${timee.day}, Clock ${timee.hour}: ${timee.minute}'}'),
                                              Text(
                                                  "Number of seat = ${ttransport.numberOfSeats}"),
                                              Text(
                                                  "Duration = ${ttransport.transportTicket!.duration}"),
                                              Text(
                                                  "Amout = ${ttransport.transportTicket!.amount}"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                      "Price = ${ttransport.transportTicket!.priceBirr}"),
                                                  Text(
                                                      "Discount = ${ttransport.transportTicket!.discount}"),
                                                  Text(
                                                      "Ecoin = ${ttransport.transportTicket!.priceCoin}"),
                                                  Text(
                                                      "Reward = ${ttransport.transportTicket!.reward}"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "Purchase ID = ${ttransport.id}")
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          if (snapshot.data!.getRequests!.responseList![index]
                                  .approved ==
                              null) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                height: 330,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          // width: double.maxFinite,
                                          height: 30,
                                          color: Colors.red,
                                          child: Center(
                                              child: Text(
                                                  "Please Wait for Response"))),
                                      Container(
                                        color: Colors.grey[200],
                                        height: 80,
                                        width: 380,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "ID = ${ttransport.by!.id}")
                                                ],
                                              ),
                                              Text(
                                                  "Name  = ${ttransport.by!.firstName} ${ttransport.by!.lastName}"),
                                              Text(
                                                  "Email = ${ttransport.by!.email}"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Bus = ${ttransport.transportTicket!.transportProvider!.name}"),
                                                  Text(
                                                      "Ticket ID = ${ttransport.transportTicket!.id} "),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      (" From  Deparature ID = ${ttransport.transportTicket!.destinationLocationId}")),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                          " To  Destination ID = ${ttransport.transportTicket!.destinationLocationId}")
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                  'Deparature data = ${ttransport.transportTicket!.departureDate}'),
                                              Text(
                                                  "Number of seat = ${ttransport.numberOfSeats}"),
                                              Text(
                                                  "Duration = ${ttransport.transportTicket!.duration}"),
                                              Text(
                                                  "Amout = ${ttransport.transportTicket!.amount}"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                      "Price = ${ttransport.transportTicket!.priceBirr}"),
                                                  Text(
                                                      "Discount = ${ttransport.transportTicket!.discount}"),
                                                  Text(
                                                      "Ecoin = ${ttransport.transportTicket!.priceCoin}"),
                                                  Text(
                                                      "Reward = ${ttransport.transportTicket!.reward}"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "Purchase ID = ${ttransport.id}")
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          if (snapshot.data!.getRequests!.responseList![index]
                                  .approved ==
                              false) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                height: 330,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          // width: double.maxFinite,
                                          height: 30,
                                          color: Colors.orange,
                                          child: Center(
                                              child: Text(
                                                  "The request is Denied!"))),
                                      Container(
                                        color: Colors.grey[200],
                                        height: 80,
                                        width: 380,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "ID = ${ttransport.by!.id}")
                                                ],
                                              ),
                                              Text(
                                                  "Name  = ${ttransport.by!.firstName} ${ttransport.by!.lastName}"),
                                              Text(
                                                  "Email = ${ttransport.by!.email}"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Bus = ${ttransport.transportTicket!.transportProvider!.name}"),
                                                  Text(
                                                      "Ticket ID = ${ttransport.transportTicket!.id} "),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      (" From  Deparature ID = ${ttransport.transportTicket!.destinationLocationId}")),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                          " To  Destination ID = ${ttransport.transportTicket!.destinationLocationId}")
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                  'Deparature data = ${ttransport.transportTicket!.departureDate}'),
                                              Text(
                                                  "Number of seat = ${ttransport.numberOfSeats}"),
                                              Text(
                                                  "Duration = ${ttransport.transportTicket!.duration}"),
                                              Text(
                                                  "Amout = ${ttransport.transportTicket!.amount}"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                      "Price = ${ttransport.transportTicket!.priceBirr}"),
                                                  Text(
                                                      "Discount = ${ttransport.transportTicket!.discount}"),
                                                  Text(
                                                      "Ecoin = ${ttransport.transportTicket!.priceCoin}"),
                                                  Text(
                                                      "Reward = ${ttransport.transportTicket!.reward}"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "Purchase ID = ${ttransport.id}")
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          // else {

                          //   print("itsnot worlking");
                          // }
                        }),
                  ),
                ),
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
