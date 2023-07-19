import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/user_profile_servics.dart';
import '../../model/user/getuser_model.dart';
import '../authentication/mobile_sign_in.dart';
import 'bottom_nav.dart';

class LoadUserID extends StatefulWidget {
  const LoadUserID({
    super.key,
  });

  @override
  State<LoadUserID> createState() => _userLogginInState();
}

class _userLogginInState extends State<LoadUserID> {
  String? userID;
  bool getToken = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    UID();
  }

  void UID() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> jwtDecoderToken =
        JwtDecoder.decode(pref.getString("login")!);
    userID =
        jwtDecoderToken["https://hasura.io/jwt/claims"]["x-hasura-user-id"];

    var UID = int.parse(userID.toString());

    print("Check UserID -> ${UID}");
    if (UID != null) {
      print("user has ID");
      setState(() {
        getToken = true;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var UIDD = int.parse(userID.toString());

    final Future<getuser> _getUser =
        UserAccountSerivcs().getUserProfileID(UIDD);
    return Scaffold(
      body: Center(
        child: FutureBuilder<getuser>(
          future: _getUser,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              // print(snapshot.error.toString());
              return Column(
                children: [
                  Text("Please login again!"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => MobileSignIn()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text("Login Again"))
                ],
              );
            }
            if (snapshot.hasData) {
              if (getToken == true) {
                // if (snapshot.data != null) {
                //   print("okayyyyyyyyyyyyy");
                // }

                Future.delayed(Duration(seconds: 2), () {
                  print("user is logging in ");

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNav(
                                userData: snapshot.data!,
                              )));
                });
              }
              if (getToken == false) {
                return Center(
                  child: Column(
                    children: [
                      Text("Logging has expired, Please login again"),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => MobileSignIn()),
                                (Route<dynamic> route) => false);
                          },
                          child: Text("Login"))
                    ],
                  ),
                );
              } else {
                Center(
                  child: Column(
                    children: [
                      Text("please try again"),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => MobileSignIn()),
                                (Route<dynamic> route) => false);
                          },
                          child: Text("Try Again"))
                    ],
                  ),
                );
              }
            }
            //
            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Loading'),
                CircularProgressIndicator(),
              ],
            ));
          },
        ),
      ),
    );
  }

  // void routee(getuser? get) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => userloggingIn2(
  //                 userID: get!,
  //               )));
  // }
}
