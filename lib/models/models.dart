import 'dart:math';

import 'package:flutter/animation.dart';

///-----------------------------------------------Profile-Model---------------------------------------------------------------///

class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  double? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;
  Crypto? crypto;
  String? role;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  ProfileModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    String? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    String? birthDate,
    String? image,
    String? bloodGroup,
    double? height,
    double? weight,
    String? eyeColor,
    Hair? hair,
    String? ip,
    Address? address,
    String? macAddress,
    String? university,
    Bank? bank,
    Company? company,
    String? ein,
    String? ssn,
    String? userAgent,
    Crypto? crypto,
    String? role,
  }) {
    return ProfileModel(
      image: image ?? this.image,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      age: age ?? this.age,
      bank: bank ?? this.bank,
      birthDate: birthDate ?? this.birthDate,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      company: company ?? this.company,
      crypto: crypto ?? this.crypto,
      ein: ein ?? this.ein,
      email: email ?? this.email,
      eyeColor: eyeColor ?? this.eyeColor,
      firstName: firstName ?? this.firstName,
      gender: gender ?? this.gender,
      hair: hair ?? this.hair,
      height: height ?? this.height,
      id: id ?? this.id,
      ip: ip ?? this.ip,
      lastName: lastName ?? this.lastName,
      macAddress: macAddress ?? this.macAddress,
      maidenName: maidenName ?? this.maidenName,
      password: password ?? this.password,
      role: role ?? this.role,
      ssn: ssn ?? this.ssn,
      university: university ?? this.university,
      userAgent: userAgent ?? this.userAgent,
      username: username ?? this.username,
      weight: weight ?? this.weight,
    );
  }

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    maidenName = json["maidenName"];
    age = json["age"];
    gender = json["gender"];
    email = json["email"];
    phone = json["phone"];
    username = json["username"];
    password = json["password"];
    birthDate = json["birthDate"];
    image = json["image"];
    bloodGroup = json["bloodGroup"];
    height = json["height"];
    weight = json["weight"];
    eyeColor = json["eyeColor"];
    hair = json["hair"] == null ? null : Hair.fromJson(json["hair"]);
    ip = json["ip"];
    address = json["address"] == null
        ? null
        : Address.fromJson(json["address"]);
    macAddress = json["macAddress"];
    university = json["university"];
    bank = json["bank"] == null ? null : Bank.fromJson(json["bank"]);
    company = json["company"] == null
        ? null
        : Company.fromJson(json["company"]);
    ein = json["ein"];
    ssn = json["ssn"];
    userAgent = json["userAgent"];
    crypto = json["crypto"] == null ? null : Crypto.fromJson(json["crypto"]);
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["firstName"] = firstName;
    _data["lastName"] = lastName;
    _data["maidenName"] = maidenName;
    _data["age"] = age;
    _data["gender"] = gender;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["username"] = username;
    _data["password"] = password;
    _data["birthDate"] = birthDate;
    _data["image"] = image;
    _data["bloodGroup"] = bloodGroup;
    _data["height"] = height;
    _data["weight"] = weight;
    _data["eyeColor"] = eyeColor;
    if (hair != null) {
      _data["hair"] = hair?.toJson();
    }
    _data["ip"] = ip;
    if (address != null) {
      _data["address"] = address?.toJson();
    }
    _data["macAddress"] = macAddress;
    _data["university"] = university;
    if (bank != null) {
      _data["bank"] = bank?.toJson();
    }
    if (company != null) {
      _data["company"] = company?.toJson();
    }
    _data["ein"] = ein;
    _data["ssn"] = ssn;
    _data["userAgent"] = userAgent;
    if (crypto != null) {
      _data["crypto"] = crypto?.toJson();
    }
    _data["role"] = role;
    return _data;
  }
}

class Crypto {
  String? coin;
  String? wallet;
  String? network;

  Crypto({this.coin, this.wallet, this.network});

  Crypto.fromJson(Map<String, dynamic> json) {
    coin = json["coin"];
    wallet = json["wallet"];
    network = json["network"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["coin"] = coin;
    _data["wallet"] = wallet;
    _data["network"] = network;
    return _data;
  }
}

class Company {
  String? department;
  String? name;
  String? title;
  Address1? address;

  Company({this.department, this.name, this.title, this.address});

  Company.fromJson(Map<String, dynamic> json) {
    department = json["department"];
    name = json["name"];
    title = json["title"];
    address = json["address"] == null
        ? null
        : Address1.fromJson(json["address"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["department"] = department;
    _data["name"] = name;
    _data["title"] = title;
    if (address != null) {
      _data["address"] = address?.toJson();
    }
    return _data;
  }
}

class Address1 {
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  Coordinates1? coordinates;
  String? country;

  Address1({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  Address1.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    city = json["city"];
    state = json["state"];
    stateCode = json["stateCode"];
    postalCode = json["postalCode"];
    coordinates = json["coordinates"] == null
        ? null
        : Coordinates1.fromJson(json["coordinates"]);
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["address"] = address;
    _data["city"] = city;
    _data["state"] = state;
    _data["stateCode"] = stateCode;
    _data["postalCode"] = postalCode;
    if (coordinates != null) {
      _data["coordinates"] = coordinates?.toJson();
    }
    _data["country"] = country;
    return _data;
  }
}

class Coordinates1 {
  double? lat;
  double? lng;

  Coordinates1({this.lat, this.lng});

  Coordinates1.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lat"] = lat;
    _data["lng"] = lng;
    return _data;
  }
}

class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  Bank.fromJson(Map<String, dynamic> json) {
    cardExpire = json["cardExpire"];
    cardNumber = json["cardNumber"];
    cardType = json["cardType"];
    currency = json["currency"];
    iban = json["iban"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cardExpire"] = cardExpire;
    _data["cardNumber"] = cardNumber;
    _data["cardType"] = cardType;
    _data["currency"] = currency;
    _data["iban"] = iban;
    return _data;
  }
}

class Address {
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  Coordinates? coordinates;
  String? country;

  Address({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  Address.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    city = json["city"];
    state = json["state"];
    stateCode = json["stateCode"];
    postalCode = json["postalCode"];
    coordinates = json["coordinates"] == null
        ? null
        : Coordinates.fromJson(json["coordinates"]);
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["address"] = address;
    _data["city"] = city;
    _data["state"] = state;
    _data["stateCode"] = stateCode;
    _data["postalCode"] = postalCode;
    if (coordinates != null) {
      _data["coordinates"] = coordinates?.toJson();
    }
    _data["country"] = country;
    return _data;
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lat"] = lat;
    _data["lng"] = lng;
    return _data;
  }
}

class Hair {
  String? color;
  String? type;

  Hair({this.color, this.type});

  Hair.fromJson(Map<String, dynamic> json) {
    color = json["color"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["color"] = color;
    _data["type"] = type;
    return _data;
  }
}

///----------------------------------------------------------------Get Products -----------------------------------------------///

///--------------------------------------------------------------------Get Product Details------------------------------------------------------///

class UpperRow {
  final String image;
  final String tag;

  UpperRow({required this.image, required this.tag});
}

List<UpperRow> topRow = [
  UpperRow(image: "assets/images/women_filter.png", tag: "Women"),
  UpperRow(image: "assets/images/men_filter.png", tag: "Men"),
  UpperRow(image: "assets/images/accesories_filter.png", tag: "Accessories"),
  UpperRow(image: "assets/images/beauty_filter.png", tag: "Beauty"),
];
