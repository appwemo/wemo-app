import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/events/ticket_info_detail.dart';
import 'package:etiocart/repository/event_servics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../repository/user_profile_servics.dart';
import '../../model/export_model.dart';
import '../../model/user/getuser_model.dart';
import '../events/ticket_info_detail_copy.dart';

class CopyDiscover extends StatelessWidget {
  final getuser? user;
  CopyDiscover({Key? key, required this.user}) : super(key: key);
  final Future<List<Events>> _getall_Event = EventServics().fetchItems();

  @override
  Widget build(BuildContext context) {
    // final Future<getuser> _getUser = UserAccountSerivcs().getUserProfileID(id);
    Future<Future<List<Events>>> _refreshItem(BuildContext, context) async {
      return EventServics().fetchItems();
    }

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: StylingData.bgColor,
        body: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: FutureBuilder<List<Events>>(
                future: _getall_Event,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Some error ${snapshot.error}"),
                    );
                  }
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.4,
                            child:
                                featuredContent(context, snapshot.data, user),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: popularEventsNavigator(),
                          ),
                          Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: popularEventsFilter(context),
                          ),
                          GridView.builder(
                            // scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CopyTicketInformationDetail(
                                          data: snapshot.data![index],
                                          id: index,
                                          user: user,
                                        )),
                              ),
                              child: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: width * 0.5,
                                        height: height * 0.2,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: StylingData.grey1
                                                .withOpacity(0.6)),
                                      ),
                                      Text(
                                        // 'National Festival',
                                        '${snapshot.data![index].title}',
                                        style: StylingData.titleText,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Text(
                                        'Monday Dec 24 18:00-23:00',
                                        style: StylingData.purpText3,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                              ),
                            ),
                            // Container(
                            //   color: Colors.amber,
                            //   height: 50,
                            //   width: 100,
                            //   child: Text(snapshot.data![index].id.toString()),
                            // ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            //  popularEvents(
                            //   context,
                            //   snapshot.data![index],
                            // ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                })

            // ListView(
            //   shrinkWrap: true,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: 10, right: 10),
            //       child: featuredNavigator(),
            //     ),
            //     Padding(
            //         padding: EdgeInsets.only(
            //       top: 5,
            //       bottom: 5,
            //     )),
            //     featuredContent(context),
            //     Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            // Padding(
            //   padding: EdgeInsets.only(left: 10, right: 10),
            //   child: popularEventsNavigator(),
            // ),
            // Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
            // Padding(
            //   padding: EdgeInsets.only(top: 10, bottom: 10),
            //   child: popularEventsFilter(context),
            // ),
            // popularEvents(context),
            //     // popularEvents(context),
            //     // popularEvents(context),
            //   ],
            // ),
            ));
  }

  featuredContent(context, List<Events>? data, getuser? getuser) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data!.length < 1 ? data.length : 1,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CopyTicketInformationDetail(
                      data: data[index],
                      id: index,
                      user: user,
                    )),
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
      },
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

  popularEvents(context, Events data) {
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
                Text(
                  // 'National Festival',
                  '${data.title}',
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
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, right: 10),
          //   child: Column(
          //     children: [
          //       Container(
          //         width: width * 0.5,
          //         height: height * 0.2,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(15),
          //             color: StylingData.grey1.withOpacity(0.6)),
          //       ),
          //       const Text(
          //         'National  Festival',
          //         style: StylingData.titleText,
          //       ),
          //       const Text(
          //         'Monday Dec 24 18:00-23:00',
          //         style: StylingData.purpText3,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           const Icon(
          //             CupertinoIcons.location_solid,
          //             color: StylingData.purple1,
          //           ),
          //           Text(
          //             'Grand Park New York',
          //             style: StylingData.subText,
          //           ),
          //           const Icon(
          //             CupertinoIcons.heart,
          //             color: StylingData.purple1,
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
