import 'package:etiocart/mobile/views/events/book_event.dart';
import 'package:etiocart/mobile/views/events/ticket_info_detail.dart';
import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () =>           Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                // isLoggedIn ? LoginScreen() : BottomNavBar()
                BookEvent()
            )),
        child:  Scaffold(
          body: TicketInformationDetail(),
        )

    );
  }
}
