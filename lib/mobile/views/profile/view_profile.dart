import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/model/user/getuser_model.dart';
import 'package:etiocart/mobile/model/user/updateuser_model.dart';
import 'package:etiocart/mobile/views/bottom_nav/load_user_data_id.dart';
import 'package:etiocart/mobile/views/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../repository/user_profile_servics.dart';
import '../bottom_nav/bottom_nav.dart';

class ViewProfile extends StatefulWidget {
  final getuser? data;
  final int userID = 3;

  const ViewProfile({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController handleController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  bool isUpdated = true;
  // getUserData()async{
  //   await UserAccountSerivcs().getUserProfileID(widget.userID);

  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var getUser = widget.data!.user!;

    firstController.text = getUser.firstName.toString();
    lastController.text = getUser.lastName.toString();
    emailController.text = getUser.email.toString();
    handleController.text = getUser.handle.toString();
    numberController.text = getUser.phoneNumber.toString();
    birthController.text = getUser.dateOfBirth.toString();
  }

  @override
  Widget build(BuildContext context) {
    //  final Future<getuser> _getUser = UserAccountSerivcs().getUserProfileID(id);
    // TextEditingController nameController = TextEditingController();
    // final Future<updateUser> _updateUser = UserAccountSerivcs()
    //     .updateProfile(widget.userID, nameController.text, lastController.text);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: StylingData.bgColor,
      appBar: AppBar(
        backgroundColor: StylingData.bgColor,
        foregroundColor: StylingData.frColor,
        title: Text(
          'Edit Profile',
          style: StylingData.appBarText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 0,
        ),
        child: ListView(
          children: [
            Center(
              child: profileAvatar(context),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text('First Name'),
            firstNameField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('Last Name'),
            lastNameField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('Gmail'),
            emailField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('Phone number'),
            phoneField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('Handle'),
            handleField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            Text('Birth'),
            birthdateField(width, height),
            SizedBox(
              height: height * 0.02,
            ),
            signUpButton(context),
            SizedBox(
              height: 15,
            )
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
            child: const Icon(
              CupertinoIcons.pen,
              size: 35,
              color: StylingData.bgColor,
            ),
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
        onPressed: () async {
          if (isUpdated) {
            await UserAccountSerivcs().updateProfile(
                widget.userID, firstController.text, lastController.text);
            setState(() {
              print("updated");
              isUpdated = false;
            });
          }
          print("pass nav");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoadUserID()));
        },
        child: const Text(
          'Update',
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
        controller: firstController,
        // autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.grey2,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: StylingData.grey3)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            // labelText: 'First Name',
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
        controller: lastController,
        autofocus: false,
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            enabled: true,
            fillColor: StylingData.grey2,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: StylingData.grey3)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            // labelText: 'Last Name',
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
        controller: emailController,
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
                borderSide: BorderSide(color: StylingData.grey3)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            // labelText: 'Email',
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
        controller: numberController,
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
                borderSide: BorderSide(color: StylingData.grey3)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            // labelText: '+251',
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
        controller: birthController,
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
                borderSide: BorderSide(color: StylingData.grey3)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            // labelText: 'Birthdate',
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
        controller: handleController,
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
            // labelText: 'Handle',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }
}
