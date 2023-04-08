class adCompanies {
  List<AdvertizementCompanies>? advertizementCompanies;

  adCompanies({this.advertizementCompanies});

  adCompanies.fromJson(Map<String, dynamic> json) {
    if (json['advertizement_companies'] != null) {
      advertizementCompanies = <AdvertizementCompanies>[];
      json['advertizement_companies'].forEach((v) {
        advertizementCompanies!.add(new AdvertizementCompanies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.advertizementCompanies != null) {
      data['advertizement_companies'] =
          this.advertizementCompanies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdvertizementCompanies {
  int? id;
  String? name;

  AdvertizementCompanies({this.id, this.name});

  AdvertizementCompanies.fromJson(Map<String, dynamic> json) {
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
