// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:etiocart/mobile/views/notification/empty_notification.dart';
import 'package:etiocart/mobile/views/search/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);

  final List<String> butnTag = ['notification', 'search', 'filter', 'Profile'];
  final notificationbool = 0;
  final btnStatus = 0;

  final List<String> titles = ['Booking', 'profile change', 'new event'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Notification',
            style: TextStyle(
                color: Colors.teal.shade900,
                fontSize: 22,
                fontFamily: 'SFPro',
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
                icon: ImageIcon(
                    color: Colors.green.shade800,
                    size: 25,
                    AssetImage(
                      'asset/icons/search.png',
                    )))
          ],
        ),
        body: notificationbool == 0
            ? notificationViewer(context)
            : emptyNotification());
  }

  Widget notificationViewer(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: notificationBody(context),
        );
      },
    );
  }

  Widget notificationCard(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(children: [
                      CircleAvatar(
                          radius: 30, backgroundColor: Colors.grey.shade200),
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.green.shade600,
                          size: 30,
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Notification Title',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'SFPro',
                                  fontSize: 22,
                                  color: Colors.teal.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Expanded(
                    child: Container(
                      width: width * 0.8,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'this is a notification text that works',
                              style: TextStyle(
                                  fontFamily: 'SFPro',
                                  fontSize: 18,
                                  color: Colors.grey.shade700),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Text('Notifcation Type')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  notificationBody(context) {
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: StylingData.purple1.withOpacity(0.08),
            child: const Icon(CupertinoIcons.ticket,
                color: StylingData.frColor, size: 30),
          ),
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notification title', style: StylingData.subText2),
                Text('Date', style: StylingData.subText),
                Text('notification Date', style: StylingData.subText3),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
