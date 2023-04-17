// class AutoGenerate {
//   AutoGenerate({
//     required this.getFullPurchaseInformation,
//   });
//   late final GetFullPurchaseInformation getFullPurchaseInformation;

//   AutoGenerate.fromJson(Map<String, dynamic> json){
//     getFullPurchaseInformation = GetFullPurchaseInformation.fromJson(json['getFullPurchaseInformation']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['getFullPurchaseInformation'] = getFullPurchaseInformation.toJson();
//     return _data;
//   }
// }

// class GetFullPurchaseInformation {
//   GetFullPurchaseInformation({
//     required this.list,
//   });
//   late final List list;

//   GetFullPurchaseInformation.fromJson(Map<String, dynamic> json) {
//     list = List.fromJson(json['list']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['list'] = list.toJson();
//     return _data;
//   }
// }

// class List {
//   List({
//     required this.purchases,
//     required this.transportPurchases,
//   });
//   late final List<Purchases> purchases;
//   late final List<TransportPurchases> transportPurchases;

//   List.fromJson(Map<String, dynamic> json) {
//     if (json['purchases'] = null) {
//       purchases = <Purchases>[];
//       json['purchases'].forEach((v){

//       })
//     }

//     purchases =
//         List.from(json['purchases']).map((e) => Purchases.fromJson(e)).toList();
//     transportPurchases = List.from(json['transport_purchases'])
//         .map((e) => TransportPurchases.fromJson(e))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final   Map<String, dynamic> _data = new Map<String,>()
//     _data['purchases'] = purchases.map((e) => e.toJson()).toList();
//     _data['transport_purchases'] =
//         transportPurchases.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

class Purchases {
  Purchases({
    this.amount,
    this.boughtFor,
    this.buyer,
    this.id,
    this.redeemed,
    this.ticket,
    this.ticketId,
  });
  late final int? amount;
  late final BoughtFor? boughtFor;
  late final Buyer? buyer;
  late final String? id;
  late final bool? redeemed;
  late final Ticket? ticket;
  late final int? ticketId;

  Purchases.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    boughtFor = BoughtFor.fromJson(json['boughtFor']);
    buyer = Buyer.fromJson(json['buyer']);
    id = json['id'];
    redeemed = json['redeemed'];
    ticket = Ticket.fromJson(json['ticket']);
    ticketId = json['ticket_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['boughtFor'] = boughtFor?.toJson();
    _data['buyer'] = buyer?.toJson();
    _data['id'] = id;
    _data['redeemed'] = redeemed;
    _data['ticket'] = ticket?.toJson();
    _data['ticket_id'] = ticketId;
    return _data;
  }
}

class BoughtFor {
  BoughtFor({
    required this.firstName,
    required this.id,
    required this.lastName,
  });
  late final String firstName;
  late final int id;
  late final String lastName;

  BoughtFor.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['id'] = id;
    _data['last_name'] = lastName;
    return _data;
  }
}

class Buyer {
  Buyer({
    required this.firstName,
    required this.id,
    required this.lastName,
  });
  late final String firstName;
  late final int id;
  late final String lastName;

  Buyer.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['id'] = id;
    _data['last_name'] = lastName;
    return _data;
  }
}

class Ticket {
  Ticket({
    required this.event,
    required this.id,
  });
  late final Event event;
  late final int id;

  Ticket.fromJson(Map<String, dynamic> json) {
    event = Event.fromJson(json['event']);
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['event'] = event.toJson();
    _data['id'] = id;
    return _data;
  }
}

class Event {
  Event({
    required this.description,
    required this.eventEnd,
    required this.eventStart,
    required this.title,
  });
  late final String description;
  late final String eventEnd;
  late final String eventStart;
  late final String title;

  Event.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    eventEnd = json['event_end'];
    eventStart = json['event_start'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['event_end'] = eventEnd;
    _data['event_start'] = eventStart;
    _data['title'] = title;
    return _data;
  }
}

class TransportPurchases {
  TransportPurchases({
    required this.by,
    required this.fr,
    required this.id,
  });
  late final By by;
  late final For fr;
  late final String id;

  TransportPurchases.fromJson(Map<String, dynamic> json) {
    by = By.fromJson(json['by']);
    fr = For.fromJson(json['by']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['by'] = by.toJson();
    _data['for'] = fr.toJson();
    // _data['for'] = for.toJson();
    _data['id'] = id;
    return _data;
  }
}

class By {
  By({
    required this.firstName,
    required this.id,
    required this.lastName,
  });
  late final String firstName;
  late final int id;
  late final String lastName;

  By.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['id'] = id;
    _data['last_name'] = lastName;
    return _data;
  }
}

class For {
  For({
    required this.firstName,
    required this.id,
    required this.lastName,
  });
  late final String firstName;
  late final int id;
  late final String lastName;

  For.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['id'] = id;
    _data['last_name'] = lastName;
    return _data;
  }
}
