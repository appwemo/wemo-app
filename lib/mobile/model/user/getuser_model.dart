class getuser {
  User? user;
  EventTickets? eventTickets;
  EventTickets? transportTickets;

  getuser({this.user, this.eventTickets, this.transportTickets});

  getuser.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    eventTickets = json['event_tickets'] != null
        ? new EventTickets.fromJson(json['event_tickets'])
        : null;
    transportTickets = json['transport_tickets'] != null
        ? new EventTickets.fromJson(json['transport_tickets'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.eventTickets != null) {
      data['event_tickets'] = this.eventTickets!.toJson();
    }
    if (this.transportTickets != null) {
      data['transport_tickets'] = this.transportTickets!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  String? handle;
  String? sex;
  int? balance;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.dateOfBirth,
      this.handle,
      this.sex,
      this.balance});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    dateOfBirth = json['date_of_birth'].toString();
    handle = json['handle'];
    sex = json['sex'];
    balance = json['balance'].toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['handle'] = this.handle;
    data['sex'] = this.sex;
    data['balance'].toDouble = this.balance;
    return data;
  }
}

class EventTickets {
  Aggregate? aggregate;

  EventTickets({this.aggregate});

  EventTickets.fromJson(Map<String, dynamic> json) {
    aggregate = json['aggregate'] != null
        ? new Aggregate.fromJson(json['aggregate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aggregate != null) {
      data['aggregate'] = this.aggregate!.toJson();
    }
    return data;
  }
}

class Aggregate {
  int? count;

  Aggregate({this.count});

  Aggregate.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}
