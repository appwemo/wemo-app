import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/events/ticket_list_page.dart';
import 'package:etiocart/mobile/views/help_center/help_center.dart';
import 'package:etiocart/mobile/views/profile/view_profile.dart';
import 'package:etiocart/mobile/views/security/security_page.dart';
import 'package:etiocart/mobile/views/wallet/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileBody(context),
    );
  }

  profileBody(context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: StylingData.purple1.withOpacity(0.08),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100, left: 100),
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              radius: 23,
                              backgroundColor: StylingData.purple1,
                              child: Icon(
                                CupertinoIcons.pen,
                                color: StylingData.bgColor,
                              )),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Andrew Ansley',
                        style: StylingData.bigBoldText,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewProfile()),
              ),
              child: Row(
                children: const [
                  Text(
                    'Profile',
                    style: StylingData.mediumText,
                  ),
                  Spacer(),
                  Icon(CupertinoIcons.forward)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WalletPage()),
              ),
              child: Row(
                children: const [
                  Text('Payments', style: StylingData.mediumText),
                  Spacer(),
                  Icon(CupertinoIcons.forward)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecurityPage()),
              ),
              child: Row(
                children: const [
                  Text('Security', style: StylingData.mediumText),
                  Spacer(),
                  Icon(CupertinoIcons.forward)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Row(
                children: const [
                  Text('Dark Mode', style: StylingData.mediumText),
                  Spacer(),
                  Icon(CupertinoIcons.forward)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpCenter()),
              ),
              child: Row(
                children: const [
                  Text('Help Center', style: StylingData.mediumText),
                  Spacer(),
                  Icon(CupertinoIcons.forward)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TicketListPage()),
              ),
              child: Row(
                children: const [
                  Text('Tickets', style: StylingData.mediumText),
                  Spacer(),
                  Icon(CupertinoIcons.forward)
                ],
              ),
            ),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () => {
                        showModalBottomSheet<void>(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                // height: height * 0.2,
                                child: Center(
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'Logout',
                                          style: StylingData.logoutButton,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          'Are You Sure You want to Logout?',
                                          style: StylingData.titleText3,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            logOut(context),
                                            const Spacer(),
                                            cancel(context)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      },
                  child: const Text(
                    'Logout',
                    style: StylingData.logoutButton2,
                  )),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  CupertinoIcons.forward,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  cancel(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: height * 0.05,
      width: width * 0.45,
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
          Navigator.pop(context);
        },
        child: const Text(
          'Cancel',
          style: StylingData.buttonText,
        ),
      ),
    );
  }

  logOut(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: height * 0.05,
      width: width * 0.45,
      child: ElevatedButton(
        style: ButtonStyle(
            //sets the button elevation to zero
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.all(StylingData.purple1.withOpacity(0.2)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              side: const BorderSide(color: StylingData.purple1),
              borderRadius: BorderRadius.circular(25),
            ))),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Yes, Logout',
          style: StylingData.buttonText2,
        ),
      ),
    );
  }
}
