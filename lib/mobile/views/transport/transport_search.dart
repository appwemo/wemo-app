import 'package:etiocart/mobile/views/transport/set_transport_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../repository/transport_location_servics.dart';
import '../../model/transport_location_model.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  State<SetLocation> createState() => _numOfSeatState();
}

class _numOfSeatState extends State<SetLocation> {
  // _numOfSeatState() {}
  int selectedIndex = -1;
  // _cityValue = _fromCity[0];
  // _TocityValue = _ToCity[0];
  bool isSet = false;

  var setDeparatureID;
  var setDestinationID;
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  DateTime _dateTime = DateTime.now();
  void _pickdate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2024),
            currentDate: DateTime.now())
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//     String convertDate(DateTime dateTime) {
//  return DateFormat('dd/MM/yyyy').format(dateTime);
// }

    final Future<TransportLocation> _futurLocation =
        TransportLocationServics().fetchLocation();
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<TransportLocation>(
                  future: _futurLocation,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return Container(
                        width: 350,
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue.withOpacity(.3),
                                          border: Border.all(
                                              color: Colors.blue, width: 3.0),
                                        ),
                                      ),
                                      SizedBox(width: 15.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "From",
                                            // style: Theme.of(context)
                                            //     .textTheme,,
                                            //     ."subtitle"
                                            // .apply(color: Colors.black38),
                                          ),
                                          SizedBox(
                                            width: 220,
                                            child: DropdownButton(
                                              // dropdownColor: Colors.teal[100],
                                              iconSize: 30,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              elevation: 0,
                                              isExpanded: true,
                                              hint: Text('Please '),
                                              value: setDeparatureID,
                                              /* ??
                                                  data!
                                                      .transportLocations[0].id, */
                                              items:
                                                  /*  data?.transportLocations.where((element) {
                                                return DropdownMenuItem(child: Text(element.city.toString()),
                                                value: element.id,)
                                              }).toList() */
                                                  data!.transportLocations
                                                      .map((e) {
                                                return DropdownMenuItem(
                                                    child: Text(e.city),
                                                    value: e.id);
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  setDeparatureID = value ?? "";
                                                  print(setDeparatureID);
                                                });
                                              },
                                            ),
                                          ),
                                          // GestureDetector(
                                          //     child: Text(
                                          //       "Your Location",
                                          //       // style: Theme.of(context)
                                          //       //     .textTheme
                                          //       //     .title
                                          //       //     .apply(color: Colors.black87),
                                          //     ),
                                          //     onTap: () {}),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(
                                    height: 25,
                                    color: Colors.black,
                                    thickness: .7,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.orange.withOpacity(.3),
                                          border: Border.all(
                                              color: Colors.red, width: 3.0),
                                        ),
                                      ),
                                      SizedBox(width: 15.0),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "To",
                                            // style: Theme.of(context)
                                            // .textTheme
                                            // .subtitle
                                            // .apply(color: Colors.black38),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 220,
                                            child: DropdownButton(
                                              iconSize: 30,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              elevation: 0,
                                              isExpanded: true,
                                              focusColor: Colors.black,
                                              hint: Text('Please set '),
                                              value: setDestinationID,
                                              items:
                                                  /*  data?.transportLocations.where((element) {
                                                  return DropdownMenuItem(child: Text(element.city.toString()),
                                                  value: element.id,)
                                                }).toList() */
                                                  data.transportLocations
                                                      .map((e) {
                                                return DropdownMenuItem(
                                                    child: Text(e.city),
                                                    value: e.id);
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  setDestinationID =
                                                      value ?? "";
                                                  print(setDestinationID);
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xfff0f3f7),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: IconButton(
                                icon: Icon(
                                  Icons.import_export,
                                  color: Colors.black54,
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              SizedBox(
                height: 55,
              ),
              InkWell(
                onTap: _pickdate,
                child: Container(
                    color: Colors.blueGrey[100],
                    height: 50,
                    width: 200,
                    // color: Colors.amber,
                    child: Center(
                      child: Text(
                        'Set Date ${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    )
                    /* ValueListenableBuilder(
                      valueListenable: dateSub,
                      builder: (context, dateVale, child) {
                        return InkWell(
                          onTap: () async {
                            DateTime? dateT = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now(),
                              currentDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                    data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.fromSwatch(
                                      primarySwatch: Colors.blueGrey,
                                    )),
                                    child: child!);
                              },
                            );
                          },
                          // child: buildDateTimePicker(dateVale != nu;; ? c),
                        );
                      }), */
                    ),
              ),
              //  dateSub.value = dateT;,
              /* InkWell(
                onTap: () async {
                  DateTime? dateT = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now(),
                      currentDate: DateTime.now());
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 50,
                  width: 100,
                  color: Colors.blueGrey[100],
                  child: Column(
                    children: [
                      Center(child: Text("")),
                    ],
                  ),
                ),
              ), */
              SizedBox(
                height: 50,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: List.generate(5, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.blueGrey[700]
                                : Colors.grey[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                            child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black),
                        )),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 55,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      if (selectedIndex == -1) {
                        print("Please Select Seat!");
                        print((selectedIndex + 1).toString());
                      } else {
                        print("okay");
                        print((selectedIndex + 1).toString());

                        var numOfSeatSelected = (selectedIndex + 1);
                        if (setDeparatureID == null) {
                          print('Please set location');
                        }
                        if (setDeparatureID == setDestinationID) {
                          print('Location cant be set the same city');
                        } else {
                          print(setDeparatureID);
                          print(setDestinationID);
                          setState(() {
                            print(_dateTime);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => setLocationTransport(
                                        numOfseats: numOfSeatSelected,
                                        Departure: setDeparatureID.toString(),
                                        Destination:
                                            setDestinationID.toString(),
                                        setDate: _dateTime)));
                          });
                        }
                        if (setDeparatureID != setDestinationID) {}
                      }
                    },
                    child: Text("Next")),
              )
            ],
          )),
    );
  }

  Widget buildDateTimePicker(String data) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.teal, width: 1.5),
      ),
      title: Text(data),
      trailing: const Icon(Icons.calendar_today, color: Colors.teal),
    );
  }
}
