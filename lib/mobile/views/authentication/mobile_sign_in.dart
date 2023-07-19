import 'dart:convert';

import 'package:etiocart/mobile/views/bottom_nav/bottom_nav.dart';
import 'package:etiocart/mobile/views/discover/discover.dart';
import 'package:etiocart/repository/authentication_servics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/theme_data.dart';
import 'package:http/http.dart' as http;

import '../bottom_nav/load_user_data_id.dart';

class MobileSignIn extends StatefulWidget {
  const MobileSignIn({super.key});

  @override
  State<MobileSignIn> createState() => _MobileSignInState();
}

class _MobileSignInState extends State<MobileSignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        resizeToAvoidBottomInset: false,
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
          // String token,
          // String getToken,
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: userNameField(
                  width,
                  height,
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: passWordField(width, height),
              ),
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
                      style: isChecked
                          ? StylingData.subText2
                          : StylingData.subText,
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
              _SubmitButton(
                  email: _emailController.text,
                  password: _passwordController.text),

              // signUpButton(context, _emailController, _passwordController, tok),
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

  userNameField(
    double width,
    double height,
  ) {
    return SizedBox(
      width: width * 0.95,
      height: height * 0.06,
      child: TextFormField(
        controller: _emailController,
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
        controller: _passwordController,
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
                borderSide: BorderSide(color: StylingData.grey3)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: StylingData.grey3),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Enter username',
            labelStyle: StylingData.subText,
            hintStyle: StylingData.subText,
            border: InputBorder.none),
      ),
    );
  }

  signUpButton(context, TextEditingController email,
      TextEditingController password, String token, String getToken) {
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
        onPressed: () async {
          String baseUr = "http://167.71.12.36:8080/api/rest/login/user";
          try {
            print("object");
            final response = await post(Uri.parse(baseUr),
                body: {'email': email.text, 'password': password.text});
            print(response);
            print(response.statusCode);

            if (response.statusCode == 200) {
              var data = jsonDecode(response.body.toString());
              print(data);

              setState(() {
                final snackBar = SnackBar(
                  shape: StadiumBorder(),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                  content: Row(
                    children: [
                      Icon(
                        Icons.sms_failed_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login succesfully",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
              print("Login succesfully");

              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             // isLoggedIn ? LoginScreen() : BottomNavBar()
              //             BottomNav()));
            } else {
              final snackBar = SnackBar(
                shape: StadiumBorder(),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.red,
                content: Row(
                  children: [
                    Icon(
                      Icons.sms_failed_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "The verficiatin isnt correct! Please try again.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // setState(() {

              // });

              print('Login failed');
            }
          } catch (e) {
            print(e.toString());
          }
        },
        child: const Text(
          'Sign In',
          style: StylingData.buttonText,
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  _SubmitButton({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String email, password;

  @override
  Widget build(BuildContext context) {
    String tokenID;
    String getToken;
    void _hel0o(String email, password) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String baseUr = "http://167.71.12.36:8080/api/rest/login/user";
      try {
        print("object");
        final response = await http.post(Uri.parse(baseUr),
            // headers: {"alg": "HS256", "typ": "JWT"},
            body: {'email': email, 'password': password});
        // print(response);
        print(response.statusCode);
        var data = jsonDecode(response.body);

        if (response.statusCode == 200) {
          var myToken = data['login']['token'];
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("login", myToken);
          getToken = pref.getString("login")!;
          Map<String, dynamic> JwtDecoderToken = JwtDecoder.decode(getToken);

          tokenID = JwtDecoderToken["https://hasura.io/jwt/claims"]
              ["x-hasura-user-id"];

          // await storage.write(key: "token", value: myToken);

          // prefs.setString("token", "${myToken}");
          print(myToken);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoadUserID()));

          // prefs.setString('token',my myToken);

          // print(data);
          print("Login succesfully");
        } else {
          print(' Login failed');
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return ElevatedButton(
      onPressed: () {
        // final FireRepository _fre = FireAuthService();
        // _fre.login(email, password);
        _hel0o("dawit.aseged@gmail.com", "password");
      },
      // () async {
      //   _aa = await FireAuthService().pologin(email, password);
      //   if ((condition)) {

      //   }
      //   print('hello');
      // },
      child: const Text('Loginn'),
    );
  }
}
