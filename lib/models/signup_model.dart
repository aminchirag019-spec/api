
class Signup {
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
  dynamic height;
  dynamic weight;
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

  Signup({this.id, this.firstName, this.lastName, this.maidenName, this.age, this.gender, this.email, this.phone, this.username, this.password, this.birthDate, this.image, this.bloodGroup, this.height, this.weight, this.eyeColor, this.hair, this.ip, this.address, this.macAddress, this.university, this.bank, this.company, this.ein, this.ssn, this.userAgent, this.crypto, this.role});

  Signup.fromJson(Map<String, dynamic> json) {
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
    address = json["address"] == null ? null : Address.fromJson(json["address"]);
    macAddress = json["macAddress"];
    university = json["university"];
    bank = json["bank"] == null ? null : Bank.fromJson(json["bank"]);
    company = json["company"] == null ? null : Company.fromJson(json["company"]);
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
    if(hair != null) {
      _data["hair"] = hair?.toJson();
    }
    _data["ip"] = ip;
    if(address != null) {
      _data["address"] = address?.toJson();
    }
    _data["macAddress"] = macAddress;
    _data["university"] = university;
    if(bank != null) {
      _data["bank"] = bank?.toJson();
    }
    if(company != null) {
      _data["company"] = company?.toJson();
    }
    _data["ein"] = ein;
    _data["ssn"] = ssn;
    _data["userAgent"] = userAgent;
    if(crypto != null) {
      _data["crypto"] = crypto?.toJson();
    }
    _data["role"] = role;
    return _data;
  }

  Signup copyWith({
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
    dynamic height,
    dynamic weight,
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
  }) => Signup(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    maidenName: maidenName ?? this.maidenName,
    age: age ?? this.age,
    gender: gender ?? this.gender,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    username: username ?? this.username,
    password: password ?? this.password,
    birthDate: birthDate ?? this.birthDate,
    image: image ?? this.image,
    bloodGroup: bloodGroup ?? this.bloodGroup,
    height: height ?? this.height,
    weight: weight ?? this.weight,
    eyeColor: eyeColor ?? this.eyeColor,
    hair: hair ?? this.hair,
    ip: ip ?? this.ip,
    address: address ?? this.address,
    macAddress: macAddress ?? this.macAddress,
    university: university ?? this.university,
    bank: bank ?? this.bank,
    company: company ?? this.company,
    ein: ein ?? this.ein,
    ssn: ssn ?? this.ssn,
    userAgent: userAgent ?? this.userAgent,
    crypto: crypto ?? this.crypto,
    role: role ?? this.role,
  );
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

  Crypto copyWith({
    String? coin,
    String? wallet,
    String? network,
  }) => Crypto(
    coin: coin ?? this.coin,
    wallet: wallet ?? this.wallet,
    network: network ?? this.network,
  );
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
    address = json["address"] == null ? null : Address1.fromJson(json["address"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["department"] = department;
    _data["name"] = name;
    _data["title"] = title;
    if(address != null) {
      _data["address"] = address?.toJson();
    }
    return _data;
  }

  Company copyWith({
    String? department,
    String? name,
    String? title,
    Address1? address,
  }) => Company(
    department: department ?? this.department,
    name: name ?? this.name,
    title: title ?? this.title,
    address: address ?? this.address,
  );
}

class Address1 {
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  Coordinates1? coordinates;
  String? country;

  Address1({this.address, this.city, this.state, this.stateCode, this.postalCode, this.coordinates, this.country});

  Address1.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    city = json["city"];
    state = json["state"];
    stateCode = json["stateCode"];
    postalCode = json["postalCode"];
    coordinates = json["coordinates"] == null ? null : Coordinates1.fromJson(json["coordinates"]);
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["address"] = address;
    _data["city"] = city;
    _data["state"] = state;
    _data["stateCode"] = stateCode;
    _data["postalCode"] = postalCode;
    if(coordinates != null) {
      _data["coordinates"] = coordinates?.toJson();
    }
    _data["country"] = country;
    return _data;
  }

  Address1 copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    Coordinates1? coordinates,
    String? country,
  }) => Address1(
    address: address ?? this.address,
    city: city ?? this.city,
    state: state ?? this.state,
    stateCode: stateCode ?? this.stateCode,
    postalCode: postalCode ?? this.postalCode,
    coordinates: coordinates ?? this.coordinates,
    country: country ?? this.country,
  );
}

class Coordinates1 {
  dynamic lat;
  dynamic lng;

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

  Coordinates1 copyWith({
    dynamic lat,
    dynamic lng,
  }) => Coordinates1(
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
  );
}

class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank({this.cardExpire, this.cardNumber, this.cardType, this.currency, this.iban});

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

  Bank copyWith({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) => Bank(
    cardExpire: cardExpire ?? this.cardExpire,
    cardNumber: cardNumber ?? this.cardNumber,
    cardType: cardType ?? this.cardType,
    currency: currency ?? this.currency,
    iban: iban ?? this.iban,
  );
}

class Address {
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  Coordinates? coordinates;
  String? country;

  Address({this.address, this.city, this.state, this.stateCode, this.postalCode, this.coordinates, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    city = json["city"];
    state = json["state"];
    stateCode = json["stateCode"];
    postalCode = json["postalCode"];
    coordinates = json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]);
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["address"] = address;
    _data["city"] = city;
    _data["state"] = state;
    _data["stateCode"] = stateCode;
    _data["postalCode"] = postalCode;
    if(coordinates != null) {
      _data["coordinates"] = coordinates?.toJson();
    }
    _data["country"] = country;
    return _data;
  }

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    Coordinates? coordinates,
    String? country,
  }) => Address(
    address: address ?? this.address,
    city: city ?? this.city,
    state: state ?? this.state,
    stateCode: stateCode ?? this.stateCode,
    postalCode: postalCode ?? this.postalCode,
    coordinates: coordinates ?? this.coordinates,
    country: country ?? this.country,
  );
}

class Coordinates {
  dynamic lat;
  dynamic lng;

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

  Coordinates copyWith({
    dynamic lat,
    dynamic lng,
  }) => Coordinates(
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
  );
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

  Hair copyWith({
    String? color,
    String? type,
  }) => Hair(
    color: color ?? this.color,
    type: type ?? this.type,
  );
}