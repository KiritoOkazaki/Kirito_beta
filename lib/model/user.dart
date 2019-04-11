
class User {
  int _id;
  String _email;
  String _password;
  String _tokenAccess;
  String _nombre;
  String _picUser;
  int _active;
  
  User(this._id, this._email, this._password, this._tokenAccess, this._nombre,this._picUser, this._active);

  User.map(dynamic obj) {
    this._id =obj["id"];
    this._email = obj["email"];
    this._password = obj["password"];
    this._tokenAccess = obj["access_token"];
    this._nombre = obj["nombre"];
    this._picUser = obj["foto"];
    this._active = obj["activo"];
    
  }

  int get id => _id;
  String get email => _email;
  String get password => _password;
  String get tokenAccess => _tokenAccess;
  String get nombre => _nombre;
  String get foto => _picUser;
  int get activo => _active;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] =_id;
    map["email"] = _email;
    map["password"] = _password;
    map["access_token"] = _tokenAccess;
    map["nombre"] = _nombre;
    map["foto"] =_picUser;
    map["activo"] =_active;
    return map;
  }
}