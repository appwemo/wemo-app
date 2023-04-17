import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/events/book_event.dart';
import 'package:etiocart/repository/event_servics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../model/export_model.dart';
import '../../model/user/getuser_model.dart';

class CopyTicketInformationDetail extends StatefulWidget {
  final int id;
  final getuser? user;

  final Events data;

  CopyTicketInformationDetail(
      {super.key, required this.data, required this.id, required this.user});
  @override
  State<CopyTicketInformationDetail> createState() =>
      _TicketInformationDetailState();
}

class _TicketInformationDetailState extends State<CopyTicketInformationDetail> {
  // final Future<List<Tickets>> _futureTicket = EventServics().fetchTicket(widget.id);

  @override
  void initState() {
    // _futureTickets = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: StylingData.frColor,
          backgroundColor: StylingData.bgColor,
          title: const Text('Ticket info'),
        ),
        body: ListView(
          children: [
            eventPhotoCard(),
            dateTimeInfo(),
            locationInfo(),
            priceInfo(),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: aboutEvent(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: bookEventButton(context),
            ),
          ],
        ));

    // bookEventButton(context),
  }

  bookEventButton(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: height * 0.06,
      width: width * 0.8,
      child: ElevatedButton(
        style: ButtonStyle(
            //sets the button elevation to zero
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(StylingData.purple1),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              side: const BorderSide(color: StylingData.purple1),
              borderRadius: BorderRadius.circular(25),
            ))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookEvent(
                      id: 149,
                      data: widget.data,
                      user: widget.user,
                    )),
          );
        },
        child: const Text(
          'Book Event',
          style: StylingData.buttonText,
        ),
      ),
    );
  }

  termsService() {
    return Text.rich(
      maxLines: 3,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
      TextSpan(
        children: [
          const TextSpan(text: 'I accepet the event\'s'),
          TextSpan(
            recognizer: TapGestureRecognizer(),
            text: 'Terms of Service, Community Guidelines,',
            style: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.blue),
          ),
          const TextSpan(text: 'and'),
          const TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.blue),
          ),
          const TextSpan(text: '(Required)'),
        ],
      ),
    );
  }

  eventPhotoCard() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: StylingData.purple1,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: StylingData.purple1,
                    borderRadius: BorderRadius.circular(10),
                    //   image: const DecorationImage(
                    //     fit: BoxFit.fill,
                    //     image: AssetImage('assets/images/muz-green.png'),
                    //   ),
                    // ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      // 'National Musicc Festival',
                      '${widget.data.title}',
                      style: StylingData.bigBoldText),
                  Text(
                    " Bole Millenium ${widget.data.title}",
                    // 'Lorem Ipsum has been the industry standard dummy text ever since the 1500s to make a type specimen book',
                    softWrap: true,
                    maxLines: 4,
                    textAlign: TextAlign.left,
                    style: StylingData.titleText2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dateTimeInfo() {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: StylingData.grey3,
            child: const Icon(CupertinoIcons.calendar,
                color: StylingData.frColor, size: 30),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const Text(
                  'Monday December 24, 2023',
                  style: StylingData.subText2,
                ),
                const Text('18:00 - 23:00 PM (GMT+7:00)'),
              ],
            ),
            Container(
              width: width * 0.5,
              child: TextButton(
                  style: ButtonStyle(
                      //sets the button elevation to zero
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(StylingData.purple1),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        side: const BorderSide(color: StylingData.purple1),
                        borderRadius: BorderRadius.circular(25),
                      ))),
                  onPressed: () => null,
                  child: const Text(
                    'Add to My Calendar',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ],
    );
  }

  locationInfo() {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: StylingData.grey3,
            child: const Icon(CupertinoIcons.location_solid,
                color: StylingData.frColor, size: 30),
          ),
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Grand Park NewYork City, US',
                    style: StylingData.subText2),
                const Text('Grand City St. 100 New York US'),
              ],
            ),
            Container(
              width: width * 0.5,
              child: TextButton(
                  style: ButtonStyle(
                      //sets the button elevation to zero
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(StylingData.purple1),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        side: const BorderSide(color: StylingData.purple1),
                        borderRadius: BorderRadius.circular(25),
                      ))),
                  onPressed: () => null,
                  child: const Text(
                    'See Location on Maps',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ],
    );
  }

  priceInfo() {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: StylingData.grey3,
            child: const Icon(CupertinoIcons.ticket,
                color: StylingData.frColor, size: 30),
          ),
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('20 Birr - 100 Birr', style: StylingData.subText2),
                const Text('Ticket Price depends on Package'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  aboutEvent() {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 8, bottom: 8),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: StylingData.grey1,
                ),
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          // 'World Of Music'
                          '${widget.data.organizer!.name}',
                          style: StylingData.titleText2),
                      const Text('Organizer'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  'About Event',
                  style: StylingData.titleText2,
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
            child: Text(
                'Lorem ipsum tte,a sdakjsd kjjas dhajshd ahsbdah ashdb Lorem ipsum tte,a sdakjsd kjjas dhajshd ahsbdah ashdb'
                '${widget.data.description}'),
          )
        ],
      ),
    );
  }
}
