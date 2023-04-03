import 'package:etiocart/mobile/views/bottom_nav/bottom_nav.dart';
import 'package:etiocart/mobile/views/discover/discover.dart';
import 'package:flutter/material.dart';
import '../../../constants/theme_data.dart';

class MobileSignIn extends StatefulWidget {
  const MobileSignIn({super.key});

  @override
  State<MobileSignIn> createState() => _MobileSignInState();
}

class _MobileSignInState extends State<MobileSignIn> {
  bool isChecked = false;
  bool rememberMe = false;
  final bool _passwordVisible = false;
  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return '''       Password is required.''';
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword)) {
      return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return StylingData.purple1;
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor: StylingData.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: StylingData.bgColor,
          foregroundColor: StylingData.frColor,
          automaticallyImplyLeading: true,
          title: const Text(
            '',
            style: StylingData.appBarText,
          ),
        ),
        body: signInForm(height, width, getColor, context),
      ),
    );
  }

  signInForm(
          double height,
          double width,
          Color Function(Set<MaterialState> states) getColor,
          BuildContext context) =>
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              RichText(
                text: const TextSpan(
                  text: '',
                  style: StylingData.titleText2,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Login to Your Account',
                        style: StylingData.titleText),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                     'User Name',
                     style: StylingData.subText2,
                        ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(padding: const EdgeInsets.only(right: 10),
              child: userNameField(width, height),),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Password',
                      style: StylingData.subText2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(padding: const EdgeInsets.only(right: 10),
                child: passWordField(width, height),),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Remember me?',
                      style: isChecked ? StylingData.subText2 : StylingData.subText,
                    ),
                    // const Text(
                    //   'Forgot Password?',
                    //   style: StylingData.subText3,
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              signUpButton(context),
              SizedBox(
                height: height * 0.02,
              ),
              RichText(
                text: TextSpan(
                  text: 'Dont Have an Account? ',
                  style: StylingData.subText,
                  children: <TextSpan>[
                    TextSpan(text: 'Sign Up', style: StylingData.subText3),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

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
            fillColor: StylingData.grey2,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: StylingData.grey3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Enter username',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  passWordField(double width, double height) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        autofocus: false,
        maxLines: 1,
        obscureText: _passwordVisible,
        validator: validatePassword,
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
              borderSide: BorderSide(color:StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Enter username',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
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
              side: BorderSide(color:StylingData.purple1),
              borderRadius: BorderRadius.circular(25),
            ))),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  // isLoggedIn ? LoginScreen() : BottomNavBar()
                  BottomNav()
              ));
        },
        child: const Text(
          'Sign In',
          style: StylingData.buttonText,
        ),
      ),
    );
  }
}
