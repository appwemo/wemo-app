import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/authentication/mobile_sign_up.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'until splash screen content and logo is given',
              style: StylingData.titleText2,
            ),
          ),
          signUpButton(context)
        ],
      ),
    );
  }

  signUpButton(context) {
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
              side: BorderSide(color: StylingData.purple1),
              borderRadius: BorderRadius.circular(25),
            ))),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  // isLoggedIn ? LoginScreen() : BottomNavBar()
                  MobileSignUp()
              ));
        },
        child: const Text(
          'Next',
          style: StylingData.buttonText,
        ),
      ),
    );
  }
}
