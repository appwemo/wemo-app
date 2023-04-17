import 'dart:convert';
import 'package:etiocart/mobile/model/ad_companies_model.dart';
import 'package:http/http.dart' as http;

class AdCompanieServics {
  Future<List<AdvertizementCompanies>> fetchAd() async {
    List<AdvertizementCompanies> items = [];
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsib3JnYW5pemF0aW9uLWFkbWluIl0sIngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6Im9yZ2FuaXphdGlvbi1hZG1pbiIsIngtaGFzdXJhLXJvbGUiOiJvcmdhbml6YXRpb24tYWRtaW4iLCJ4LWhhc3VyYS11c2VyLWlkIjoiMSIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJhZG1pbkBhZG1pbi5jb20ifSwiaWF0IjoxNjU5MTc5MTA5fQ.KGUIHstK6DgxisFMGJMqD69vest_pfr0mHR9NJ3cgpE";

    final Uri url =
        Uri.parse("http://167.71.12.36:8080/api/rest/advertizement/company");
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      print(jsonMap);

      for (var myData in jsonMap['advertizement_companies']) {
        if (myData != null) {
          AdvertizementCompanies item = AdvertizementCompanies.fromJson(myData);
          items.add(item);
        }
      }
    }
    return items;
  }
}
