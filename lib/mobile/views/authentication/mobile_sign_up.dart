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
                  Field1(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Field1(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Field1(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Field1(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Field1(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Field1(width, height),
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
            decoration: BoxDecoration(
                color: StylingData.purple1.withOpacity(0.4),
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
        onPressed: () {},
        child: const Text(
          'Sign Up',
          style: StylingData.buttonText,
        ),
      ),
    );
  }

  userNameField(double width, double height) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.purple3,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.purple2),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Enter username',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  Field1(double width, double height) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.grey2.withOpacity(0.6),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade50),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'First name',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  Field2(double width, double height) {
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
              borderSide: BorderSide(color: Colors.grey.shade50),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'First name',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  Field3(double width, double height) {
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
              borderSide: BorderSide(color: Colors.grey.shade50),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'First name',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  Field4(double width, double height) {
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
              borderSide: BorderSide(color: Colors.grey.shade50),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'First name',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  Field5(double width, double height) {
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
              borderSide: BorderSide(color: Colors.grey.shade50),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'First name',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  Field6(double width, double height) {
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
              borderSide: BorderSide(color: Colors.grey.shade50),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'First name',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }
}
