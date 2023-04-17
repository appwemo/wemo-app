class updateUser {
  int? id;
  User? user;

  updateUser({this.id, this.user});

  updateUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? dateOfBirth;
  String? handle;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? sex;

  User(
      {this.dateOfBirth,
      this.handle,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.sex});

  User.fromJson(Map<String, dynamic> json) {
    dateOfBirth = json['date_of_birth'];
    handle = json['handle'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_of_birth'] = this.dateOfBirth;
    data['handle'] = this.handle;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['sex'] = this.sex;
    return data;
  }
}
