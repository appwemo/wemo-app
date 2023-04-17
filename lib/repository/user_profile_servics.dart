import 'dart:convert';
import 'package:http/http.dart' as http;
import '../mobile/model/user/getuser_model.dart';
import '../mobile/model/user/updateuser_model.dart';

class UserAccountSerivcs {
  Future<getuser> getUserProfileID(int id) async {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsib3JnYW5pemF0aW9uLWFkbWluIl0sIngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6Im9yZ2FuaXphdGlvbi1hZG1pbiIsIngtaGFzdXJhLXJvbGUiOiJvcmdhbml6YXRpb24tYWRtaW4iLCJ4LWhhc3VyYS11c2VyLWlkIjoiMSIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJhZG1pbkBhZG1pbi5jb20ifSwiaWF0IjoxNjY1NzUxNTE5fQ.ADhw2Ldo4it-ZpvV3klwt5Ub32MJ2zYcVi2aUsrvxtY';
    final baseUrl = 'http://167.71.12.36:8080/api/rest/search/user';
    var url = '$baseUrl/$id';

    print(url);
    print("Checking url with id");

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    print("Checking above response status code");

    var data = json.decode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      return getuser.fromJson(data);
    } else {
      return getuser.fromJson(data);
    }
  }

  Future<updateUser> updateProfile(int id, String name, last) async {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJkYXdpdC5hc2VnZWRAZ21haWwuY29tIn0sImlhdCI6MTY3NzY2MTcwM30.helgpHnDubhbVb1QilkW0EXDQmySnZHlTWUC7P9sEyg';
    final baseUrl = 'http://167.71.12.36:8080/api/rest/user';
    var url = baseUrl;
    print(url);
    print("Checking above update user url");
    try {
      final response = await http.put(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode(
            {
              "id": id,
              "user": {
                "date_of_birth": "1999-04-16",
                "handle": "Dave12345",
                "first_name": name,
                // "first_name": "Dawit",
                "last_name": last,
                // "last_name": "Aseged",
                "phone_number": "+251936543154",
                "sex": "Male"
              }
            },
          ));
      print(url);

      print("Checking url above");
      print(response.statusCode);
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print(data);
        return updateUser.fromJson(data);
      }
    } catch (e) {
      print('Update succesfuly failed!');
      print(e);
      // throw Exception("someis wr");
    }

    throw Exception("Request Failed!");
  }
}
