import 'package:etiocart/mobile/views/authentication/mobile_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/theme_data.dart';

class MobileSignUp extends StatelessWidget {
  const MobileSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: StylingData.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: StylingData.bgColor,
          foregroundColor: StylingData.frColor,
          title: const Text(
            'Fill Your Profile',
            style: StylingData.appBarText,
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  profileAvatar(context),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  firstNameField(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  lastNameField(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  emailField(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  phoneField(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  handleField(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  birthdateField(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  signUpButton(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  profileAvatar(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: StylingData.grey2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120, left: 110),
          child: Container(
            width: width * 0.095,
            height: height * 0.045,
            child: Icon(CupertinoIcons.pen,size: 35, color: StylingData.bgColor,),
            decoration: BoxDecoration(
                color: StylingData.purple1.withOpacity(0.95),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        )
      ],
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
                  MobileSignIn()
              ));
        },
        child: const Text(
          'Sign Up',
          style: StylingData.buttonText,
        ),
      ),
    );
  }


  firstNameField(double width, double height) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.grey2,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: StylingData.grey3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'First Name',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  lastNameField(double width, double height) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.grey2,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: StylingData.grey3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Last Name',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  emailField(double width, double height) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        autofocus: false,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.grey2,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: StylingData.grey3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Email',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  phoneField(double width, double height) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        autofocus: false,
        maxLines: 1,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.grey2,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: StylingData.grey3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: '+251',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  birthdateField(double width, double height) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        autofocus: false,
        maxLines: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.grey2,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: StylingData.grey3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Birthdate',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  handleField(double width, double height) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.grey2,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Handle',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }
}
