import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/model/user/getuser_model.dart';
import 'package:etiocart/mobile/views/discover/discover.dart';
import 'package:etiocart/mobile/views/notification/notifications.dart';
import 'package:etiocart/mobile/views/profile/profile.dart';
import 'package:etiocart/mobile/views/profile/view_profile.dart';
import 'package:etiocart/mobile/views/search/custom_search.dart';
import 'package:etiocart/mobile/views/transport/transport_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/user_profile_servics.dart';
import '../discover/discover_copy.dart';
import '../moments/moment_view.dart';
import '../moments/moments_page copy.dart';
import '../moments/moments_page.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class BottomNav extends StatefulWidget {
  final getuser userData;
  const BottomNav({
    Key? key,
    required this.userData,
  }) : super(key: key);
  // final int id = 3;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  String? userID;
  int? UID;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Map<String, dynamic> JwtDecoderToken =
          JwtDecoder.decode(pref.getString("login")!);
      // userEmail = JwtDecoderToken["https://hasura.io/jwt/claims"]
      //     ["x-hasura-user-email"];
      userID =
          JwtDecoderToken["https://hasura.io/jwt/claims"]["x-hasura-user-id"];
    });
  }

  // void getUserData() async {
  //   final Future<getuser> _getUser =
  //       UserAccountSerivcs().getUserProfileID(UID!);
  // }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      CopyDiscover(user: widget.userData),
      // CopyMomentsPage(user: widget.userData),
      MomentResponse11(),
      const TransportPage(),
      ProfilePage(userId: widget.userData),
    ];
    var UID = int.parse(userID.toString());
    var width = MediaQuery.of(context).size.width;
    final Future<getuser> _getUser = UserAccountSerivcs().getUserProfileID(UID);

    return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: StylingData.bgColor,
            foregroundColor: StylingData.frColor,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: Row(
                  children: [
                    // IconButton(
                    //     onPressed: () {
                    //       showSearch(context: context, delegate: CustomSearch());
                    //     },
                    //     icon: ImageIcon(
                    //         color: Colors.green.shade800,
                    //         size: 25,
                    //         const AssetImage(
                    //           'asset/icons/search.png',
                    //         )
                    //         )
                    //         ),
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
                            size: 25,
                            AssetImage(
                              'asset/icons/bell.png',
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ViewProfile()),
                            // );
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: AssetImage(
                              'asset/icons/user.png',
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              enableFeedback: false,
              backgroundColor: Colors.white,
              selectedIconTheme: const IconThemeData(),
              type: BottomNavigationBarType.fixed,
              onTap: onTabTapped,
              items: <BottomNavigationBarItem>[
                // discover item
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "asset/icons/compass.png",
                    width: width * 0.23,
                    height: width * 0.05,
                    color: Colors.black,
                  ),
                  label: 'Discover',
                ),
                // moments item
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "asset/icons/camera.png",
                    width: width * 0.23,
                    height: width * 0.05,
                    color: Colors.black,
                  ),
                  label: 'Moments',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "asset/icons/bus.png",
                    width: width * 0.23,
                    height: width * 0.05,
                    color: Colors.black,
                  ),
                  label: 'Transport',
                ),
                // profile item
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  label: 'Profile',
                  icon: Image.asset(
                    "asset/icons/user.png",
                    width: width * 0.23,
                    height: width * 0.05,
                    color: Colors.black,
                  ),
                ),
              ],
              elevation: 0,
              iconSize: 20,
              // unselectedLabelStyle: TextStyle(color: Colors.teal.shade800),
              // selectedLabelStyle: TextStyle(color: Colors.teal.shade800),
              currentIndex: _selectedIndex,
              // selectedItemColor: Colors.teal.shade800,
            ),
          ),
        )

        // FutureBuilder<getuser>(
        //   future: _getUser,
        //   builder: (BuildContext context, snapshot) {
        //     if (snapshot.hasError) {
        //       Center(
        //         child: Text("${snapshot.error}"),
        //       );
        //     }
        //     if (snapshot.hasData) {

        //     }
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
        );
    //  bottomNav();
  }

  int _selectedIndex = 0;
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // bottomNav() {
  //   Future<getuser> _user;
  //   //var height = MediaQuery.of(context).size.height;
  //   var width = MediaQuery.of(context).size.width;
  //   return Theme(
  //     data: ThemeData(
  //       splashColor: Colors.transparent,
  //       highlightColor: Colors.transparent,
  //     ),
  //     child: FutureBuilder<getuser>(
  //       // future: us,
  //       builder: (BuildContext context, snapshot) {
  //         if (snapshot.hasError) {
  //           Center(
  //             child: Text("${snapshot.error}"),
  //           );
  //         }
  //         if (snapshot.hasData) {
  //           Scaffold(
  //             appBar: AppBar(
  //               backgroundColor: StylingData.bgColor,
  //               foregroundColor: StylingData.frColor,
  //               elevation: 0,
  //               actions: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 10, right: 15),
  //                   child: Row(
  //                     children: [
  //                       // IconButton(
  //                       //     onPressed: () {
  //                       //       showSearch(context: context, delegate: CustomSearch());
  //                       //     },
  //                       //     icon: ImageIcon(
  //                       //         color: Colors.green.shade800,
  //                       //         size: 25,
  //                       //         const AssetImage(
  //                       //           'asset/icons/search.png',
  //                       //         )
  //                       //         )
  //                       //         ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 10, right: 10),
  //                         child: InkWell(
  //                           onTap: () {
  //                             Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                   builder: (context) => Notifications()),
  //                             );
  //                           },
  //                           child: ImageIcon(
  //                               color: Colors.green.shade800,
  //                               size: 25,
  //                               AssetImage(
  //                                 'asset/icons/bell.png',
  //                               )),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 10, right: 5),
  //                         child: InkWell(
  //                             onTap: () {
  //                               // Navigator.push(
  //                               //   context,
  //                               //   MaterialPageRoute(
  //                               //       builder: (context) => ViewProfile()),
  //                               // );
  //                             },
  //                             child: CircleAvatar(
  //                               radius: 15,
  //                               backgroundColor: Colors.grey[200],
  //                               backgroundImage: AssetImage(
  //                                 'asset/icons/user.png',
  //                               ),
  //                             )),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             body: Center(
  //               child: _widgetOptions.elementAt(_selectedIndex),
  //             ),
  //             bottomNavigationBar: SizedBox(
  //               height: 70,
  //               child: BottomNavigationBar(
  //                 enableFeedback: false,
  //                 backgroundColor: Colors.white,
  //                 selectedIconTheme: const IconThemeData(),
  //                 type: BottomNavigationBarType.fixed,
  //                 onTap: onTabTapped,
  //                 items: <BottomNavigationBarItem>[
  //                   // discover item
  //                   BottomNavigationBarItem(
  //                     icon: Image.asset(
  //                       "asset/icons/compass.png",
  //                       width: width * 0.23,
  //                       height: width * 0.05,
  //                       color: Colors.black,
  //                     ),
  //                     label: 'Discover',
  //                   ),
  //                   // moments item
  //                   BottomNavigationBarItem(
  //                     icon: Image.asset(
  //                       "asset/icons/camera.png",
  //                       width: width * 0.23,
  //                       height: width * 0.05,
  //                       color: Colors.black,
  //                     ),
  //                     label: 'Moments',
  //                   ),
  //                   BottomNavigationBarItem(
  //                     icon: Image.asset(
  //                       "asset/icons/bus.png",
  //                       width: width * 0.23,
  //                       height: width * 0.05,
  //                       color: Colors.black,
  //                     ),
  //                     label: 'Transport',
  //                   ),
  //                   // profile item
  //                   BottomNavigationBarItem(
  //                     backgroundColor: Colors.black,
  //                     label: 'Profile',
  //                     icon: Image.asset(
  //                       "asset/icons/user.png",
  //                       width: width * 0.23,
  //                       height: width * 0.05,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ],
  //                 elevation: 0,
  //                 iconSize: 20,
  //                 // unselectedLabelStyle: TextStyle(color: Colors.teal.shade800),
  //                 // selectedLabelStyle: TextStyle(color: Colors.teal.shade800),
  //                 currentIndex: _selectedIndex,
  //                 // selectedItemColor: Colors.teal.shade800,
  //               ),
  //             ),
  //           );
  //         }
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       },
  //     ),
  //   );
  // }
}
