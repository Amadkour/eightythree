/// user : ""
/// userType : ""
/// userDescription : ""
/// phone : ""
/// address : ""
/// image : ""
/// description : ""
/// space : ""
/// path : ""
/// bed : ""

class Home {
  Home({
    String user,
    String userType,
    String userDescription,
    String phone,
    String address,
    String image,
    String description,
    String space,
    String path,
    String price,
    String bed,
  }) {
    _user = user;
    _userType = userType;
    _userDescription = userDescription;
    _phone = phone;
    _address = address;
    _image = image;
    _description = description;
    _space = space;
    _path = path;
    _bed = bed;
    _price = price;
  }

  Home.fromJson(dynamic json) {
    _user = json['title'];
    _userType = json['category'];
    _userDescription = json['description'];
    _phone = json['phone'] ?? "01113452";
    _address = json['category'];
    _image = json['image'];
    _description = json['description'];
    _space = json['rating']['count'].toString();
    _bed = json['rating']['rate'].toString();
    _path = json['rating']['rate'].toString();
    _price = json['price'].toString();
  }

  String _user;
  String _userType;
  String _userDescription;
  String _phone;
  String _address;
  String _image;
  String _description;
  String _space;
  String _path;
  String _bed;
  String _price;

  String get user => _user;

  String get userType => _userType;

  String get userDescription => _userDescription;

  String get phone => _phone;

  String get address => _address;

  String get image => _image;

  String get description => _description;

  String get space => _space;

  String get path => _path;

  String get bed => _bed;

  String get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = _user;
    map['userType'] = _userType;
    map['userDescription'] = _userDescription;
    map['phone'] = _phone;
    map['address'] = _address;
    map['image'] = _image;
    map['description'] = _description;
    map['space'] = _space;
    map['path'] = _path;
    map['bed'] = _bed;
    map['price'] = _price;
    return map;
  }
}
