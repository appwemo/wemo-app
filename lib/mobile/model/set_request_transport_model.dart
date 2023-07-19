class requestmModell {
  int? transportTicketId;
  int? numberOfSeats;
  int? buyerId;
  int? boughtFor;

  requestmModell(
      {this.transportTicketId,
      this.numberOfSeats,
      this.buyerId,
      this.boughtFor});

  requestmModell.fromJson(Map<String, dynamic> json) {
    transportTicketId = json['transport_ticket_id'];
    numberOfSeats = json['number_of_seats'];
    buyerId = json['buyer_id'];
    boughtFor = json['bought_for'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transport_ticket_id'] = this.transportTicketId;
    data['number_of_seats'] = this.numberOfSeats;
    data['buyer_id'] = this.buyerId;
    data['bought_for'] = this.boughtFor;
    return data;
  }
}
