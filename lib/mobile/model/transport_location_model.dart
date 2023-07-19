// To parse this JSON data, do
//
//     final transportLocation = transportLocationFromJson(jsonString);

import 'dart:convert';

TransportLocation transportLocationFromJson(String str) =>
    TransportLocation.fromJson(json.decode(str));

String transportLocationToJson(TransportLocation data) =>
    json.encode(data.toJson());

class TransportLocation {
  List<TransportLocationElement> transportLocations;

  TransportLocation({
    required this.transportLocations,
  });

  factory TransportLocation.fromJson(Map<String, dynamic> json) =>
      TransportLocation(
        transportLocations: List<TransportLocationElement>.from(
            json["transport_locations"]
                .map((x) => TransportLocationElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transport_locations":
            List<dynamic>.from(transportLocations.map((x) => x.toJson())),
      };
}

class TransportLocationElement {
  int id;
  String city;
  double latitude;
  double longitude;

  TransportLocationElement({
    required this.id,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  factory TransportLocationElement.fromJson(Map<String, dynamic> json) =>
      TransportLocationElement(
        id: json["id"],
        city: json["city"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "latitude": latitude,
        "longitude": longitude,
      };
}
