class transportrequest {
  GetRequests? getRequests;

  transportrequest({this.getRequests});

  transportrequest.fromJson(Map<String, dynamic> json) {
    getRequests = json['getRequests'] != null
        ? new GetRequests.fromJson(json['getRequests'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getRequests != null) {
      data['getRequests'] = this.getRequests!.toJson();
    }
    return data;
  }
}

class GetRequests {
  List<ResponseList>? responseList;

  GetRequests({this.responseList});

  GetRequests.fromJson(Map<String, dynamic> json) {
    if (json['responseList'] != null) {
      responseList = <ResponseList>[];
      json['responseList'].forEach((v) {
        responseList!.add(new ResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseList != null) {
      data['responseList'] = this.responseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseList {
  bool? approved;
  By? by;
  int? id;
  int? numberOfSeats;
  TransportTicket? transportTicket;

  ResponseList(
      {this.approved,
      this.by,
      this.id,
      this.numberOfSeats,
      this.transportTicket});

  ResponseList.fromJson(Map<String, dynamic> json) {
    approved = json['approved'];
    by = json['by'] != null ? new By.fromJson(json['by']) : null;
    id = json['id'];
    numberOfSeats = json['number_of_seats'];
    transportTicket = json['transport_ticket'] != null
        ? new TransportTicket.fromJson(json['transport_ticket'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approved'] = this.approved;
    if (this.by != null) {
      data['by'] = this.by!.toJson();
    }
    data['id'] = this.id;
    data['number_of_seats'] = this.numberOfSeats;
    if (this.transportTicket != null) {
      data['transport_ticket'] = this.transportTicket!.toJson();
    }
    return data;
  }
}

class By {
  String? email;
  String? firstName;
  int? id;
  String? lastName;

  By({this.email, this.firstName, this.id, this.lastName});

  By.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['id'] = this.id;
    data['last_name'] = this.lastName;
    return data;
  }
}

class TransportTicket {
  int? amount;
  String? departureDate;
  int? destinationLocationId;
  int? discount;
  double? duration;
  int? id;
  int? priceBirr;
  int? priceCoin;
  int? providerId;
  int? reward;
  int? startLocationId;
  TransportProvider? transportProvider;

  TransportTicket(
      {this.amount,
      this.departureDate,
      this.destinationLocationId,
      this.discount,
      this.duration,
      this.id,
      this.priceBirr,
      this.priceCoin,
      this.providerId,
      this.reward,
      this.startLocationId,
      this.transportProvider});

  TransportTicket.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    departureDate = json['departure_date'];
    destinationLocationId = json['destination_location_id'];
    discount = json['discount'];
    duration = json['duration'].toDouble();
    id = json['id'];
    priceBirr = json['price_birr'];
    priceCoin = json['price_coin'];
    providerId = json['provider_id'];
    reward = json['reward'];
    startLocationId = json['start_location_id'];
    transportProvider = json['transport_provider'] != null
        ? new TransportProvider.fromJson(json['transport_provider'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['departure_date'] = this.departureDate;
    data['destination_location_id'] = this.destinationLocationId;
    data['discount'] = this.discount;
    data['duration'] = this.duration;
    data['id'] = this.id;
    data['price_birr'] = this.priceBirr;
    data['price_coin'] = this.priceCoin;
    data['provider_id'] = this.providerId;
    data['reward'] = this.reward;
    data['start_location_id'] = this.startLocationId;
    if (this.transportProvider != null) {
      data['transport_provider'] = this.transportProvider!.toJson();
    }
    return data;
  }
}

class TransportProvider {
  int? id;
  String? name;

  TransportProvider({this.id, this.name});

  TransportProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
