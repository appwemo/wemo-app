import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/model/user/getuser_model.dart';
import 'package:etiocart/mobile/views/events/ticket_list_page.dart';
import 'package:etiocart/mobile/views/help_center/help_center.dart';
import 'package:etiocart/mobile/views/profile/view_profile.dart';
import 'package:etiocart/mobile/views/security/security_page.dart';
import 'package:etiocart/mobile/views/wallet/wallet.dart';
import 'package:etiocart/repository/user_profile_servics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../../model/user/getuser_model.dart';
import '../authentication/mobile_sign_in.dart';
import '../events/ticket_list_page copy.dart';

class ProfilePage extends StatefulWidget {
  final getuser? userId;
  const ProfilePage({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileBody(context),
    );
  }

  profileBody(
    context,
  ) {
    final Future<getuser> _getUser = UserAccountSerivcs().getUserProfileID(3);

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
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewProfile(data: widget.userId)),
                          ),
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
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        // 'Andrew Ansley',
                        '${widget.userId!.user!.firstName} ${widget.userId!.user!.lastName}',
                        style: StylingData.bigBoldText,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ViewProfile(data: )),
              // ),
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
                MaterialPageRoute(builder: (context) => CopyTicketListPage()),
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
          signout();
        },
        child: const Text(
          'Yes, Logout',
          style: StylingData.buttonText2,
        ),
      ),
    );
  }

  void signout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    await pref.remove("login");

    setState(() {
      Future.delayed(const Duration(seconds: 4), () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MobileSignIn()),
            (Route<dynamic> route) => false);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => MobileSignIn()),
        // );
      });
    });
  }
}
