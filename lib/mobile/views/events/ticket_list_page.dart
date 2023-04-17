import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';
import '../notification/notifications.dart';
import '../search/custom_search.dart';

class TicketListPage extends StatelessWidget {
  const TicketListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
                icon: ImageIcon(
                    color: Colors.green.shade800,
                    size: 20,
                    AssetImage(
                      'asset/icons/search.png',
                    ))),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Notifications()),
                  );
                },
                child: ImageIcon(
                    color: Colors.green.shade800,
                    size: 20,
                    AssetImage(
                      'asset/icons/bell.png',
                    )),
              ),
            ),
          ],
          title: const Text(
            'Tickets',
            style: StylingData.appBarText,
          ),
          backgroundColor: StylingData.bgColor,
          foregroundColor: StylingData.frColor,
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Booked Tickets',
                style: StylingData.titleText2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '2 Tickets',
                style: StylingData.subText,
              ),
            ),
            ticketsList(),
            ticketsList(),
          ],
        ));
  }

  ticketsList() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        surfaceTintColor: StylingData.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Event title',
                    style: StylingData.titleText2,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'December 20, 2023',
                    style: StylingData.subText,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    '12:00 AM',
                    style: StylingData.subText,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
