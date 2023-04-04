import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/discover/discover.dart';
import 'package:etiocart/mobile/views/notification/notifications.dart';
import 'package:etiocart/mobile/views/search/custom_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();


}

class _BottomNavState extends State<BottomNav> {


  @override
  Widget build(BuildContext context) {
    return bottomNav();
  }
  int _selectedIndex = 0;
  int currentIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Discover(),
    const Discover(),
    const Discover(),
    const Discover(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bottomNav() {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                  IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: CustomSearch());
                      },
                      icon: Icon(
                        CupertinoIcons.search,
                        size: 25,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()),
                      );
                    },
                    child: Icon(CupertinoIcons.bell),
                    // child: ImageIcon(
                    //     color: Colors.green.shade800,
                    //     size: 25,
                    //     AssetImage(
                    //       'asset/icons/notification.png',
                    //     )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notifications()),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                      )
                    ),
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
                icon: Icon(CupertinoIcons.add),
                // icon: SvgPicture.asset(
                //   "assets/icons/compass.svg",
                //   width: width * 0.23,
                //   height: width * 0.05,
                //   color: Colors.black,
                // ),
                label: 'Discover',
                // activeIcon: Image.asset(
                //     "assets/icons/navigation_outlined.png",
                //     width: width * 0.23,
                //     height: width * 0.05,
                //     color:const Color(0xff394f6b)
                // ),
              ),
              // moments item
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.add),
                // icon: SvgPicture.asset(
                //   "assets/icons/camera.svg",
                //   width: width * 0.23,
                //   height: width * 0.05,
                //   color:Colors.black,
                // ),
                label: 'Moments',
                // activeIcon: Icon(CupertinoIcons.camera)
                // activeIcon: Image.asset(
                //   "assets/icons/camera_outlined.png",
                //
                //   width: width * 0.23,
                //   height: width * 0.05,
                //   color: const Color(0xff394f6b),
                // ),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.app),
                // icon: SvgPicture.asset(
                //   "assets/icons/camera.svg",
                //   width: width * 0.23,
                //   height: width * 0.05,
                //   color:Colors.black,
                // ),
                label: 'Moments',
                // activeIcon: Icon(CupertinoIcons.camera)
                // activeIcon: Image.asset(
                //   "assets/icons/camera_outlined.png",
                //
                //   width: width * 0.23,
                //   height: width * 0.05,
                //   color: const Color(0xff394f6b),
                // ),
              ),
              // profile item
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: '',
                icon: Icon(CupertinoIcons.add),
              ),
            ],
            elevation: 0,
            iconSize: 20,
            unselectedLabelStyle: TextStyle(color: Colors.teal.shade800),
            selectedLabelStyle: TextStyle(color: Colors.teal.shade800),
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.teal.shade800,
          ),
        ),
      ),
    );
  }
}
