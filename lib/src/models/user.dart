class Customer {
  String? uid;
  String? firstName;
  String? lastName;
  String? country;
  String? username;
  String? nickName;
  String? phone;
  String? password;
  String? address;
  String? email;
  String? dateOfBirth;
  String? registrationRef;

  Customer({
    this.uid,
    this.firstName,
    this.lastName,
    this.country,
    this.username,
    this.nickName,
    this.phone,
    this.password,
    this.address,
    this.email,
    this.dateOfBirth,
    this.registrationRef,
  });

  // Convert User to JSON
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'firstName': firstName,
    'lastName': lastName,
    'country': country,
    'username': username,
    'nickName': nickName,
    'phoneNumber': phone,
    'password': password,
    'address': address,
    'email': email,
    'dob': dateOfBirth,
    'registrationRef': registrationRef,
  };

  // Create User from JSON
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      uid: json['uid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      country: json['country'],
      username: json['username'],
      nickName: json['nickName'],
      phone: json['phoneNumber'],
      password: json['password'],
      address: json['address'],
      email: json['email'],
      dateOfBirth: json['dob'],
      registrationRef: json['registrationRef'],
    );
  }
}
