// To parse this JSON data, do
//
//     final transportLocation = transportLocationFromJson(jsonString);

import 'dart:convert';

TransportLocation transportLocationFromJson(String str) =>
    TransportLocation.fromJson(json.decode(str));

String transportLocationToJson(TransportLocation data) =>
    json.encode(data.toJson());

class TransportLocation {
  List<TransportTicket> transportTickets;

  TransportLocation({
    required this.transportTickets,
  });

  factory TransportLocation.fromJson(Map<String, dynamic> json) =>
      TransportLocation(
        transportTickets: List<TransportTicket>.from(
            json["transport_tickets"].map((x) => TransportTicket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transport_tickets":
            List<dynamic>.from(transportTickets.map((x) => x.toJson())),
      };
}

class TransportTicket {
  int id;
  TransportProvider transportProvider;
  Location departureLocation;
  Location destinationLocation;
  int duration;
  int priceBirr;
  int priceCoin;
  int reward;
  int discount;
  DateTime departureDate;

  TransportTicket({
    required this.id,
    required this.transportProvider,
    required this.departureLocation,
    required this.destinationLocation,
    required this.duration,
    required this.priceBirr,
    required this.priceCoin,
    required this.reward,
    required this.discount,
    required this.departureDate,
  });

  factory TransportTicket.fromJson(Map<String, dynamic> json) =>
      TransportTicket(
        id: json["id"],
        transportProvider:
            TransportProvider.fromJson(json["transport_provider"]),
        departureLocation: Location.fromJson(json["departure_location"]),
        destinationLocation: Location.fromJson(json["destination_location"]),
        duration: json["duration"],
        priceBirr: json["price_birr"],
        priceCoin: json["price_coin"],
        reward: json["reward"],
        discount: json["discount"],
        departureDate: DateTime.parse(json["departure_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transport_provider": transportProvider.toJson(),
        "departure_location": departureLocation.toJson(),
        "destination_location": destinationLocation.toJson(),
        "duration": duration,
        "price_birr": priceBirr,
        "price_coin": priceCoin,
        "reward": reward,
        "discount": discount,
        "departure_date": departureDate.toIso8601String(),
      };
}

class Location {
  int id;
  String city;
  double latitude;
  double longitude;

  Location({
    required this.id,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
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

class TransportProvider {
  String name;
  int id;

  TransportProvider({
    required this.name,
    required this.id,
  });

  factory TransportProvider.fromJson(Map<String, dynamic> json) =>
      TransportProvider(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
