import 'package:etiocart/mobile/views/transport/transport_details.dart';
import 'package:flutter/material.dart';

import '../../../repository/transport_servics.dart';
import '../../model/request_transport_model.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class setLocationTransport extends StatefulWidget {
  final int numOfseats;

  final String Departure;

  final String Destination;
  final DateTime setDate;
  setLocationTransport(
      {Key? key,
      required this.numOfseats,
      required this.Departure,
      required this.Destination,
      required this.setDate})
      : super(key: key);

  @override
  State<setLocationTransport> createState() => _TransportDisplayState();
}

class _TransportDisplayState extends State<setLocationTransport> {
  TextEditingController controller = TextEditingController();
  var deparatureSelected = '11';
  var destinationSelected = '14';
  final String selectedCalendar = '2';

  final Future<List<TransportTicket>> _futurePost =
      TransportTicketsServics().fetchTransport();
  // final Future<List<TransportTickets>> _futurePost =
  //     TransportServicessss().fetchTransport();
  var _selectedDate;
  bool isAvailable = false;
  DateTime oka = DateTime(2023, 6, 2);
  late final int Year;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedDate = widget.setDate.day;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(oka);
    // DateTime hello (DateTime datee) {

    //   return datee;
    // }

    return Scaffold(
      // floatingActionButton:
      //     ElevatedButton(onPressed: () {}, child: Text("Select")),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Transport List'),
        // actions: [

        //   ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => traSearch()));
        //       },
        //       child: Text("Search"))
        // ],
        // 0901024479
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // EventCalendar(

            //   calendarType: Calader)
            /*  Row(
              children: [
                Container(
                  height: 50,
                  child: ListView(
                    semanticChildCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Text(DateTime.now().toLocal().day.toString()),
                      ),
                    ],
                  ),
                ),
              ],
            ), */
            // Text(DateTime.monthsPerYear.toString()),
            DatePicker(
              DateTime.now(),
              // activeDates: [DateTime.now(), DateTime.thursday],
              daysCount: 15,
              // width: 70,
              height: 70,
              dateTextStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              dayTextStyle: TextStyle(fontSize: 10),
              // activeDates: [],
              initialSelectedDate: widget.setDate,
              selectionColor: Colors.teal.shade200,
              selectedTextColor: Colors.blueGrey,
              // inactiveDates: widget.setDate.
              onDateChange: (selectedDate) {
                setState(() {
                  _selectedDate = selectedDate.day;
                });
              },
            ),
            /* Container(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 31,
                itemBuilder: (context, index) {
                  // var
                  /* return Row(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text('${hello}'))),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ); */
                },
                // child: Text("okay")
              ),
            ), */
            FutureBuilder<List<TransportTicket>>(
              future: _futurePost,
              builder: (context, snapshot) {
                //Check for errors
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Some error occurred ${snapshot.error}'));
                }
                //Has data arrived

                if (snapshot.hasData) {
                  bool col = false;
                  print(_selectedDate);
                  // List os = snapshot.data.where((element) {
                  //   return element.departureLocation.city == 3
                  // })
                  var cc;
                  var ff = snapshot.data!.where((e) {
                    // e.destinationLocationId.
                    // return e.departureLocation.city == 3 && e.destinationLocation.city == 3 && e.numOfseats == 3
                    return '${e.departureLocation.id}' == widget.Departure &&
                        '${e.destinationLocation.id}' == widget.Destination &&
                        //right this should be set date (so now i am using 27 for test api )
                        '${e.departureDate.day}' == _selectedDate.toString();
                  }
                      // print(e.departureLocation!.city);
                      ).toList();
                  // if (DateTime.now().isAfter(ff.)) {

                  // }
                  // var ff =
                  //     snapshot.data!.where((e) => e.departureLocation!.city!
                  //         // print(e.departureLocation!.city);
                  //         ).toList().first;
                  print(ff.length);
                  // if (ff.toList() == 6) {
                  //   print(ff);
                  // }
                  // print(cc.toString());
                  var g1;
                  // if (ff != null) {
                  //   print('works fine');
                  //   var gg = snapshot.data!.where((e) {
                  //     return e.destinationLocation!.id == 14;
                  //   }

                  //   ).toList();
                  // }
                  // print(g1.toString());

                  var tra = snapshot.data;
                  if (ff.length == 0) {
                    print('location not found');
                    return Center(
                      child: Text("Not Found"),
                    );
                  }
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: ff.length,
                      itemBuilder: (context, index) {
                        final DateTime now = DateTime.now().toUtc();
                        var setdateYear = ff[index].departureDate.year;
                        var setdateMonth = ff[index].departureDate.month;
                        var setdateDay = ff[index].departureDate.day;
                        var setdateHour = ff[index].departureDate.hour;
                        // final DateTime startTime =
                        //     DateTime(now.year, now.month, now.day, 6, 49);
                        // final DateTime endTime =
                        //     DateTime(now.year, now.month, now.day, 6, 50);

                        final DateTime startTime = DateTime.utc(
                          now.year,
                          now.month,
                          now.day,
                          6,
                          49,
                        );
                        final DateTime endTime = DateTime.utc(6, 50);
                        // if (DateTime.now().isAfter('${ff[index].departureDate.hour}' as DateTime) && DateTime.now().isBefore('${ff[index].departureDate.hour}' as DateTime)) {
                        //   print("ismidnight");

                        // }
                        // print(startTime);

                        DateTime fs =
                            DateTime(setdateYear, setdateDay, setdateHour);
                        // DateTime time =
                        //     '${ff[index].departureDate.hour}' as DateTime;
                        // print(time);
                        print(endTime);
                        print(DateTime.now().isAfter(endTime) &&
                            DateTime.now().isBefore(fs));

                        if (DateTime.now().isAfter(endTime) &&
                            DateTime.now().isBefore(fs)) {
                          print("ismidnight");
                        } else {
                          print('daytime');
                        }
                        var data = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TransportDetails(
                                          data: ff[index],
                                          numOfSeat: widget.numOfseats,
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text("ID = 4234"),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                          "Bus = ${ff[index].transportProvider.name}"),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            "From = ${ff[index].departureLocation.city}"),
                                        Text(
                                            "To = ${ff[index].destinationLocation.city}"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Seat = ${widget.numOfseats}"),
                                        Text("Ecoin = ${ff[index].priceBirr}"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Duration = ${data.duration}"),
                                        Text(
                                            "Date ${ff[index].departureDate.day} Time ${ff[index].departureDate.hour}"),
                                        Text("Price =  ${data.priceBirr}"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });

                  // if (snapshot.data != null) {
                  //   var uni = snapshot.data!.toList();
                  //   var list = uni.map((x) {
                  //     print(x.departureLocation!.city);
                  //     return Container(
                  //       height: 10,
                  //       child: Text("${x.departureLocation!.city}"),
                  //     );
                  //     print("-- index -- ${uni.indexOf(x)}");
                  //   }).toList();
                  // }

                  // .toList());
                  // print(snapshot.data!);

                  // final data = groupBy(snapshot.data, ());
                  // return Text('loding');
                  // List<GetEvents> parsed = snapshot.data;
                  // if (snapshot.data!.transportTickets[index].id =) {

                  // }

                  // return Column(
                  //   children: [
                  //     TextField(
                  //       controller: controller,
                  //       // onChanged: searchTicket,
                  //     ),
                  //     Text("${list}"),
                  //     Container(
                  //       // height: 600,
                  //       child: ListView.builder(
                  //           shrinkWrap: true,
                  //           // reverse: true,
                  //           // scrollDirection: Axis.vertical,
                  //           itemCount: snapshot.data!.length,
                  //           itemBuilder: (context, index) {
                  //             var tra = snapshot.data!.length;

                  //             if (snapshot.data!.toList() != null) {
                  //               // print(snapshot.data!.transportTickets!.toList());
                  //               if (snapshot.data![index].departureLocation!.id !=
                  //                   null) {
                  //                 print("id shpwwedd");
                  //                 return GestureDetector(
                  //                   onTap: () {
                  //                     Navigator.push(
                  //                         context,
                  //                         MaterialPageRoute(
                  //                             builder: (context) => Tra2deatils(
                  //                                 data: snapshot.data![index])));
                  //                   },
                  //                   child: Container(
                  //                     height: 30,
                  //                     color: Colors.amber,
                  //                     child:
                  //                         Text(snapshot.data![index].id.toString()),
                  //                   ),
                  //                 );
                  //                 // if (tra.id == 29) {

                  //                 // }
                  //                 // print("show up");
                  //                 // print(tra.departureLocation!.id.toString());
                  //               } else {
                  //                 print("object");
                  //                 // print(snapshot.data!.transportTickets![index].id ==
                  //                 //     26);
                  //               }

                  //             }

                  //           }),
                  //     ),
                  //   ],
                  // );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
