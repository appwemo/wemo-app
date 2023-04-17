import 'dart:convert';

import 'package:http/http.dart';

abstract class AuthenticationRepository {
  Future<void> signupForm(String? email, String? password);
  Future<void> login(String? email, String? password);
  Future<void>? signout();
  Future<void>? deletMyAccount();
  // Future<void>? Useraccount();
}

class AuthService extends AuthenticationRepository {
  // LOGIN AND SIGN UP CORRECTLY FROM BACKEND API TEST
  //  "email": "dawit.aseged@gmail.com",
  // "password": "password"

  @override
  @override
  Future<void>? signout() {
    return null;
  }

  Future<void>? deletMyAccount() {
    return null;
  }

  @override
  Future<void> signupForm(String? email, String? password) async {
    String baseUr = "http://167.71.12.36/registerUser";
    try {
      print("object");
      Response response = await post(Uri.parse(baseUr), body: {
        'first_name': "",
        'email': "testemail",

        // TEST TEST TEST TEST TEST

        //  'last_name': "",
        // 'password': "password",
        // 'handle': "",
        // 'sex': "",
        // 'phone_number': "",
        // 'profile_picture': ""
        //REMAINING PROFILE PICTURE url FUNCITION
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("Login succesfully");
      } else {
        print(' Login failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> login(String? email, String? password) async {
    String baseUr = "http://167.71.12.36:8080/api/rest/login/user";
    try {
      final response = await post(Uri.parse(baseUr),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("Login succesfully");
      } else {
        print(' Login failed');
      }

      //  DONT DELETE
      //  DONT DELETE
      //  DONT DELETE DONT DELETE DONT DELETE DONT DELETE DONT DELETE

      // switch (response.statusCode) {
      //   case 200:
      //     var data = jsonDecode(response.body.toString());
      //     print("LOGGED  IN ${data}");
      //     break;
      //   case 201:
      //     var data = jsonDecode(response.body.toString());
      //     print("Your oassword is invalid please try again ${data}");
      //     break;
      //   case 400:
      //     var errorData = jsonDecode(response.body.toString());
      //     print(errorData);
      //     print("Your email is exsits please Regiser your account");
      //     break;

      // }
    } catch (e) {
      print(e.toString());
    }
  }
}
