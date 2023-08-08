import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/theme_data.dart';

class TicketsInfoLocation extends StatefulWidget {
  //
  // final
  const TicketsInfoLocation({super.key});

  @override
  State<TicketsInfoLocation> createState() => _TicketsInfoLocationState();
}

class _TicketsInfoLocationState extends State<TicketsInfoLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Ticket Info Location'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.teal[100],
            height: 500,
            width: double.infinity,
            child: Center(
                child: Text("Location view isnt available at the moment")),
          ),
          SizedBox(
            height: 10,
          ),
          /* Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Grand Park NewYork City, US',
                  style: StylingData.subText2),
              const Text('Grand City St. 100 New York US'),
            ],
          ), */
        ],
      ),
    );
  }
}
