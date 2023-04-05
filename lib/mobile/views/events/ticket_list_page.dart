import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class TicketListPage extends StatelessWidget {
  const TicketListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Tickets', style: StylingData.appBarText,),
        backgroundColor: StylingData.bgColor,
        foregroundColor: StylingData.frColor,
      ),
      body: Column(children: [ticketsList(),ticketsList()],)
    );
  }

  ticketsList()
  {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        child: Column(children: [
          Row(children: [Text('event title')],),
          Row(children: [Text('date')],),
        ],),
      ),
    );
  }
}
