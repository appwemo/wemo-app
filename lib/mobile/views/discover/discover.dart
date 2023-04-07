import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/events/ticket_info_detail.dart';
import 'package:etiocart/repository/event_servics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/export_model.dart';
import '../events/ticket_info_detail copy.dart';

class Discover extends StatelessWidget {
  Discover({Key? key}) : super(key: key);
  final Future<List<Events>> _getall_Event = EventServics().fetchItems();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: StylingData.bgColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: featuredNavigator(),
              ),
              Padding(
                  padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              )),
              featuredContent(context),
              Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: popularEventsNavigator(),
              ),
              Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: popularEventsFilter(context),
              ),
              popularEvents(context),
              popularEvents(context),
              popularEvents(context),
            ],
          ),
        ));
  }

  featuredContent(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TicketInformationDetail()),
      ),
      child: Column(
        children: [
          Container(
            width: width * 0.8,
            height: height * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: StylingData.grey1.withOpacity(0.6)),
          ),
          const Text(
            'National Music Festival',
            style: StylingData.titleText,
          ),
          const Text(
            'Monday Dec 24 18:00-23:00',
            style: StylingData.purpText3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                CupertinoIcons.location_solid,
                color: StylingData.purple1,
              ),
              Text(
                'Grand Park New York',
                style: StylingData.subText,
              ),
              const Icon(
                CupertinoIcons.heart,
                color: StylingData.purple1,
              ),
            ],
          )
        ],
      ),
    );
  }

  featuredNavigator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Featured',
          style: StylingData.titleText2,
        ),
        const Text(
          'See All',
          style: StylingData.purpText3,
        )
      ],
    );
  }

  popularEventsNavigator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Popular Events',
          style: StylingData.titleText2,
        ),
        const Text(
          'See All',
          style: StylingData.purpText3,
        )
      ],
    );
  }

  popularEventsFilter(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.04,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextButton(
                style: ButtonStyle(
                    //sets the button elevation to zero
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      side: BorderSide(color: StylingData.purple1),
                      borderRadius: BorderRadius.circular(25),
                    ))),
                onPressed: () => null,
                child: Text('Party', style: StylingData.purpText)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextButton(
                style: ButtonStyle(
                    //sets the button elevation to zero
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      side: BorderSide(color: StylingData.purple1),
                      borderRadius: BorderRadius.circular(25),
                    ))),
                onPressed: () => null,
                child: Text('Church', style: StylingData.purpText)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextButton(
                style: ButtonStyle(
                    //sets the button elevation to zero
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      side: BorderSide(color: StylingData.purple1),
                      borderRadius: BorderRadius.circular(25),
                    ))),
                onPressed: () => null,
                child: Text('Art', style: StylingData.purpText)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextButton(
                style: ButtonStyle(
                    //sets the button elevation to zero
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      side: BorderSide(color: StylingData.purple1),
                      borderRadius: BorderRadius.circular(25),
                    ))),
                onPressed: () => null,
                child: Text(
                  'Music',
                  style: StylingData.purpText,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextButton(
                style: ButtonStyle(
                    //sets the button elevation to zero
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      side: BorderSide(color: StylingData.purple1),
                      borderRadius: BorderRadius.circular(25),
                    ))),
                onPressed: () => null,
                child: Text('Concert', style: StylingData.purpText)),
          ),
        ],
      ),
    );
  }

  popularEvents(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FittedBox(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  width: width * 0.5,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: StylingData.grey1.withOpacity(0.6)),
                ),
                const Text(
                  'National Festival',
                  style: StylingData.titleText,
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Monday Dec 24 18:00-23:00',
                  style: StylingData.purpText3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      CupertinoIcons.location_solid,
                      color: StylingData.purple1,
                    ),
                    Text(
                      'Grand Park New York',
                      style: StylingData.subText,
                    ),
                    const Icon(
                      CupertinoIcons.heart,
                      color: StylingData.purple1,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  width: width * 0.5,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: StylingData.grey1.withOpacity(0.6)),
                ),
                const Text(
                  'National  Festival',
                  style: StylingData.titleText,
                ),
                const Text(
                  'Monday Dec 24 18:00-23:00',
                  style: StylingData.purpText3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      CupertinoIcons.location_solid,
                      color: StylingData.purple1,
                    ),
                    Text(
                      'Grand Park New York',
                      style: StylingData.subText,
                    ),
                    const Icon(
                      CupertinoIcons.heart,
                      color: StylingData.purple1,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
