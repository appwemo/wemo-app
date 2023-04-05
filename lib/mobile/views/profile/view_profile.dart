import 'package:etiocart/constants/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: StylingData.bgColor,
      appBar: AppBar(
        backgroundColor: StylingData.bgColor,
        foregroundColor: StylingData.frColor,
        title: Text('EditProfile',style: StylingData.appBarText,),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
        child: ListView(
          children: [
            Center(child: profileAvatar(context),),
            SizedBox(
              height: height * 0.02,
            ),
            Text('First Name'),
            firstNameField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('First Name'),
            lastNameField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('First Name'),
            emailField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('First Name'),
            phoneField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('First Name'),
            handleField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('First Name'),
            birthdateField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            signUpButton(context),
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
                color: StylingData.purple1.withOpacity(0.95),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: const Icon(CupertinoIcons.pen,size: 35, color: StylingData.bgColor,),
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
                  side: const BorderSide(color: StylingData.purple1),
                  borderRadius: BorderRadius.circular(25),
                ))),
        onPressed: () {
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
